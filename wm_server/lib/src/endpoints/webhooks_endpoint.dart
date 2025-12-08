import 'package:dotenv/dotenv.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import 'package:wm_server/services/commission_service.dart';
import 'package:wm_server/src/generated/protocol.dart';

class WebhooksEndpoint extends Endpoint {
  @override
  bool get requireLogin => false;

  final _environment = DotEnv()..load();
  final _commissionService = CommissionService();

  String get _webhookToken => _environment['XENDIT_WEBHOOK_TOKEN'] ?? '';

  /// Xendit webhook handler for payment status updates
  /// Handles: invoice.paid, invoice.expired, ewallet.capture, etc.
  Future<Map<String, dynamic>> xendit(
    Session session,
    Map<String, dynamic> body,
    String? callbackToken,
  ) async {
    // 1. Validate webhook token
    if (_webhookToken.isNotEmpty && callbackToken != _webhookToken) {
      session.log('Xendit webhook: Invalid callback token',
          level: LogLevel.warning);
      return {'success': false, 'message': 'Invalid callback token'};
    }

    final event = body['event'] as String?;
    final data = body['data'] as Map<String, dynamic>?;
    final webhookId =
        body['id'] as String?; // Xendit webhook ID for idempotency

    if (event == null || data == null) {
      session.log('Xendit webhook: Missing event or data',
          level: LogLevel.warning);
      return {'success': false, 'message': 'Missing event or data'};
    }

    session.log('Xendit webhook received: $event (webhook_id: $webhookId)');

    // 2. Determine external_id or reference_id based on event type
    String? externalId;
    String? status;

    if (event.startsWith('invoice.')) {
      // Invoice events: invoice.paid, invoice.expired, invoice.pending
      externalId = data['external_id'] as String?;
      status = data['status'] as String?;
    } else if (event.startsWith('ewallet.')) {
      // E-wallet events: ewallet.capture
      externalId = data['reference_id'] as String?;
      status = data['status'] as String?;
    } else if (event.startsWith('payment.')) {
      // Payment request events
      externalId =
          data['reference_id'] as String? ?? data['external_id'] as String?;
      status = data['status'] as String?;
    } else if (event.startsWith('qr.')) {
      // QR code events
      externalId = data['external_id'] as String?;
      status = data['status'] as String?;
    }

    if (externalId == null) {
      session.log(
          'Xendit webhook: Could not extract external_id from event $event',
          level: LogLevel.warning);
      return {'success': false, 'message': 'Missing external_id'};
    }

    // 3. Idempotency check - see if we already processed this webhook
    if (webhookId != null) {
      final existingEvent = await PaymentEvent.db.findFirstRow(
        session,
        where: (t) => t.payload.like('%"id":"$webhookId"%'),
      );
      if (existingEvent != null) {
        session.log(
            'Xendit webhook: Already processed webhook $webhookId (idempotency)');
        return {
          'success': true,
          'message': 'Already processed',
          'idempotent': true
        };
      }
    }

    // 4. Find the payment record
    final payment = await Payment.db.findFirstRow(
      session,
      where: (t) => t.externalId.equals(externalId!),
    );

    if (payment == null) {
      session.log(
          'Xendit webhook: Payment not found for externalId: $externalId',
          level: LogLevel.warning);
      return {'success': false, 'message': 'Payment not found'};
    }

    // 5. Map Xendit status to our status
    final newStatus = _mapXenditStatus(event, status);
    final previousStatus = payment.status;

    // 6. Update payment status
    final updatedPayment = payment.copyWith(
      status: newStatus,
      updatedAt: DateTime.now(),
    );
    await Payment.db.updateRow(session, updatedPayment);

    session.log(
        'Xendit webhook: Updated payment ${payment.id} status $previousStatus -> $newStatus');

    // 7. Log the event to payment_events table
    final paymentEvent = PaymentEvent(
      paymentId: payment.id!,
      eventType: event,
      payload: body.toString(),
      createdAt: DateTime.now(),
    );
    await PaymentEvent.db.insertRow(session, paymentEvent);

    // 8. Update related order status
    await _updateOrderStatus(session, payment.orderId, newStatus);

    // 9. If payment is PAID, trigger commission calculation
    if (newStatus == 'PAID' && previousStatus != 'PAID') {
      await _processPaymentCompletion(session, payment);
    }

    return {
      'success': true,
      'message': 'Payment updated',
      'status': newStatus,
      'commissions_processed': newStatus == 'PAID' && previousStatus != 'PAID',
    };
  }

  /// Update the order status when payment status changes
  Future<void> _updateOrderStatus(
      Session session, String orderId, String paymentStatus) async {
    // Try to find order by ID (orderId might be the order's id or a reference)
    final orderIdInt = int.tryParse(orderId);
    Order? order;

    if (orderIdInt != null) {
      order = await Order.db.findById(session, orderIdInt);
    }

    if (order == null) {
      // orderId might be embedded in externalId like "order_123_timestamp"
      final match = RegExp(r'order_(\d+)_').firstMatch(orderId);
      if (match != null) {
        final extractedId = int.tryParse(match.group(1) ?? '');
        if (extractedId != null) {
          order = await Order.db.findById(session, extractedId);
        }
      }
    }

    if (order == null) {
      session.log('Xendit webhook: Order not found for orderId: $orderId');
      return;
    }

    // Map payment status to order status
    String orderStatus;
    switch (paymentStatus) {
      case 'PAID':
        orderStatus = 'paid';
        break;
      case 'FAILED':
        orderStatus = 'payment_failed';
        break;
      case 'EXPIRED':
        orderStatus = 'payment_expired';
        break;
      case 'CANCELLED':
        orderStatus = 'cancelled';
        break;
      default:
        orderStatus = 'pending_payment';
    }

    final updatedOrder = order.copyWith(
      status: orderStatus,
      updatedAt: DateTime.now(),
    );
    await Order.db.updateRow(session, updatedOrder);

    session.log(
        'Xendit webhook: Updated order ${order.id} status to $orderStatus');
  }

  /// Process actions when payment is completed (PAID)
  Future<void> _processPaymentCompletion(
      Session session, Payment payment) async {
    session
        .log('Xendit webhook: Processing payment completion for ${payment.id}');

    // Find the related sale record
    // The orderId in payment should match the sale or we need to find it
    final saleNumber = payment.orderId;

    final sale = await Sale.db.findFirstRow(
      session,
      where: (t) => t.saleNumber.equals(saleNumber),
    );

    if (sale == null) {
      // Try extracting from externalId pattern
      final match = RegExp(r'order_(\d+)_').firstMatch(payment.externalId);
      if (match != null) {
        final saleId = int.tryParse(match.group(1) ?? '');
        if (saleId != null) {
          final saleById = await Sale.db.findById(session, saleId);
          if (saleById != null) {
            await _completeSaleAndCommissions(session, saleById);
            return;
          }
        }
      }

      session.log(
          'Xendit webhook: No sale found for payment ${payment.id}, skipping commission calculation');
      return;
    }

    await _completeSaleAndCommissions(session, sale);
  }

  /// Mark sale as completed and calculate commissions
  Future<void> _completeSaleAndCommissions(Session session, Sale sale) async {
    // Update sale status to completed
    final updatedSale = sale.copyWith(status: 'completed');
    await Sale.db.updateRow(session, updatedSale);

    session.log('Xendit webhook: Sale ${sale.id} marked as completed');

    // Calculate and distribute commissions
    final commissions = await _commissionService.processCommissionsForSale(
        session, updatedSale);

    session.log(
        'Xendit webhook: Created ${commissions.length} commission records for sale ${sale.id}');
  }

  /// Maps Xendit webhook events/status to our internal status
  String _mapXenditStatus(String event, String? xenditStatus) {
    // Event-based mapping
    switch (event) {
      case 'invoice.paid':
      case 'ewallet.capture':
      case 'payment.succeeded':
        return 'PAID';
      case 'invoice.expired':
      case 'payment.expired':
        return 'EXPIRED';
      case 'invoice.failed':
      case 'payment.failed':
        return 'FAILED';
      case 'payment.pending':
      case 'invoice.pending':
        return 'PENDING';
    }

    // Fallback to status field if event not matched
    if (xenditStatus != null) {
      switch (xenditStatus.toUpperCase()) {
        case 'PAID':
        case 'CAPTURED':
        case 'SUCCEEDED':
          return 'PAID';
        case 'EXPIRED':
          return 'EXPIRED';
        case 'FAILED':
          return 'FAILED';
        case 'PENDING':
        case 'AWAITING_CAPTURE':
          return 'PENDING';
      }
    }

    return xenditStatus?.toUpperCase() ?? 'UNKNOWN';
  }
}
