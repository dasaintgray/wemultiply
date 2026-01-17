import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import 'package:wm_server/services/xendit_service.dart';
import 'package:wm_server/src/generated/protocol.dart';

class PaymentEndpoint extends Endpoint {
  final XenditService _xendit = XenditService(); //XENDIT SERVICE

  Future<PaymentResponse> createInvoice(
      Session session, String orderId, double amount, String? email) async {
    final externalId =
        'order_${orderId}_${DateTime.now().millisecondsSinceEpoch}';

    try {
      final invoice = await _xendit.createInvoice(
        externalId: externalId,
        amount: amount,
        customerEmail: email,
      );

      //persist into database
      final payment = Payment(
        orderId: orderId,
        externalId: invoice['id'] ?? externalId,
        channel: 'INVOICE',
        amount: amount,
        currency: invoice['currency'] ?? 'PHP',
        status: invoice['status'] ?? 'PENDING',
        metadata: jsonEncode(invoice),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await Payment.db.insertRow(session, payment);

      return PaymentResponse(
        success: true,
        paymentId: invoice['id'] as String?,
        externalId: externalId,
        referenceId: externalId,
        status: invoice['status'] as String? ?? 'PENDING',
        invoiceUrl: invoice['invoice_url'] as String?,
        checkoutUrl: invoice['invoice_url'] as String?,
        currency: invoice['currency'] as String? ?? 'PHP',
        amount: amount,
        channel: 'INVOICE',
      );
    } catch (e) {
      return PaymentResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<PaymentResponse> createEwallet(Session session, String orderId,
      double amount, String channelCode) async {
    final referenceId =
        'ewallet_${orderId}_${DateTime.now().millisecondsSinceEpoch}';

    try {
      final resp = await _xendit.createEwalletCharge(
        referenceId: referenceId,
        amount: amount,
        channelCode: channelCode,
        successRedirectUrl: 'wemultiply://payment/success',
        failureRedirectUrl: 'wemultiply://payment/failure',
      );

      // save
      final payment = Payment(
        orderId: orderId,
        externalId: resp['id'] ?? referenceId,
        channel: 'EWALLET_$channelCode',
        amount: amount,
        currency: resp['currency'] ?? 'PHP',
        status: resp['status'] ?? 'PENDING',
        metadata: jsonEncode(resp),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await Payment.db.insertRow(session, payment);

      // Extract checkout URL from actions
      final actions = resp['actions'] as Map<String, dynamic>?;
      final checkoutUrl = actions?['mobile_web_checkout_url'] as String? ??
          actions?['desktop_web_checkout_url'] as String?;

      return PaymentResponse(
        success: true,
        paymentId: resp['id'] as String?,
        externalId: resp['id'] as String?,
        referenceId: referenceId,
        status: resp['status'] as String? ?? 'PENDING',
        checkoutUrl: checkoutUrl,
        currency: resp['currency'] as String? ?? 'PHP',
        amount: amount,
        channel: 'EWALLET_$channelCode',
      );
    } catch (e) {
      return PaymentResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<Payment?> getPaymentByExternalId(
      Session session, String externalId) async {
    return Payment.db
        .findFirstRow(session, where: (t) => t.externalId.equals(externalId));
  }

  Future<PaymentResponse> createPayment(Session session,
      {required String orderID,
      required double amount,
      String? userEmail}) async {
    return createInvoice(session, orderID, amount, userEmail);
  }

  /// Creates a direct card payment with 3DS authentication
  Future<PaymentResponse> createCardPayment(
    Session session, {
    required String orderId,
    required double amount,
    required String currency,
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvn,
    required String cardholderFirstName,
    required String cardholderLastName,
    required String cardholderEmail,
    String? cardholderPhone,
    String? description,
    bool preAuthorize = false, // Set true for MANUAL capture (pre-auth)
  }) async {
    final referenceId =
        'card_${orderId}_${DateTime.now().millisecondsSinceEpoch}';

    try {
      final response = await _xendit.createCardPaymentRequest(
        referenceId: referenceId,
        amount: amount,
        currency: currency,
        cardNumber: cardNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        cvn: cvn,
        cardholderFirstName: cardholderFirstName,
        cardholderLastName: cardholderLastName,
        cardholderEmail: cardholderEmail,
        cardholderPhone: cardholderPhone,
        description: description ?? 'Payment for order# $orderId',
        captureMethod: preAuthorize ? 'MANUAL' : 'AUTOMATIC',
        metadata: {
          'order_id': orderId,
        },
      );

      // Save payment to database
      final payment = Payment(
        orderId: orderId,
        externalId: response['id'] ?? referenceId,
        channel: 'CARD',
        amount: amount,
        currency: currency,
        status: response['status'] ?? 'PENDING',
        metadata: jsonEncode(response),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await Payment.db.insertRow(session, payment);

      // Extract 3DS URL from actions
      final actions = response['actions'] as List<dynamic>?;
      String? threeDsUrl;
      if (actions != null && actions.isNotEmpty) {
        for (final action in actions) {
          if (action is Map<String, dynamic> && action['action'] == 'AUTH') {
            threeDsUrl = action['url'] as String?;
            break;
          }
        }
      }

      return PaymentResponse(
        success: true,
        paymentId: response['id'] as String?,
        externalId: response['id'] as String?,
        referenceId: referenceId,
        status: response['status'] as String? ?? 'PENDING',
        checkoutUrl: threeDsUrl,
        currency: currency,
        amount: amount,
        channel: 'CARD',
      );
    } catch (e) {
      return PaymentResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Captures a pre-authorized card payment
  Future<PaymentResponse> captureCardPayment(
    Session session, {
    required String paymentRequestId,
    required double captureAmount,
  }) async {
    try {
      final response = await _xendit.captureCardPayment(
        paymentRequestId: paymentRequestId,
        captureAmount: captureAmount,
      );

      // Update payment status in database
      final payment = await Payment.db.findFirstRow(
        session,
        where: (t) => t.externalId.equals(paymentRequestId),
      );

      if (payment != null) {
        payment.status = response['status'] ?? 'CAPTURED';
        payment.metadata = jsonEncode(response);
        payment.updatedAt = DateTime.now();
        await Payment.db.updateRow(session, payment);
      }

      return PaymentResponse(
        success: true,
        paymentId: response['id'] as String?,
        externalId: paymentRequestId,
        status: response['status'] as String? ?? 'CAPTURED',
        amount: captureAmount,
      );
    } catch (e) {
      return PaymentResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Gets payment request status from Xendit
  Future<PaymentResponse> getCardPaymentStatus(
    Session session,
    String paymentRequestId,
  ) async {
    try {
      final response = await _xendit.getPaymentRequestStatus(paymentRequestId);
      return PaymentResponse(
        success: true,
        paymentId: response['id'] as String?,
        externalId: paymentRequestId,
        status: response['status'] as String?,
        amount: (response['amount'] as num?)?.toDouble(),
        currency: response['currency'] as String?,
      );
    } catch (e) {
      return PaymentResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Creates a QR PH payment
  Future<PaymentResponse> createQrPayment(
    Session session,
    String orderId,
    double amount,
  ) async {
    final externalId = 'qr_${orderId}_${DateTime.now().millisecondsSinceEpoch}';

    try {
      final response = await _xendit.createQrCode(
        externalId: externalId,
        amount: amount,
        type: 'DYNAMIC',
      );

      // Save payment to database
      final payment = Payment(
        orderId: orderId,
        externalId: response['id'] ?? externalId,
        channel: 'QRPH',
        amount: amount,
        currency: response['currency'] ?? 'PHP',
        status: response['status'] ?? 'PENDING',
        metadata: jsonEncode(response),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await Payment.db.insertRow(session, payment);

      return PaymentResponse(
        success: true,
        paymentId: response['id'] as String?,
        externalId: externalId,
        referenceId: externalId,
        status: response['status'] as String? ?? 'PENDING',
        qrString: response['qr_string'] as String?,
        currency: response['currency'] as String? ?? 'PHP',
        amount: amount,
        channel: 'QRPH',
      );
    } catch (e) {
      return PaymentResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Creates a PayLater payment (BillEase, Cashalo)
  Future<PaymentResponse> createPayLater(
    Session session,
    String orderId,
    double amount,
    String channelCode,
    String? email,
    String? phone,
  ) async {
    final referenceId =
        'paylater_${orderId}_${DateTime.now().millisecondsSinceEpoch}';

    try {
      final response = await _xendit.createPayLaterCharge(
        referenceId: referenceId,
        amount: amount,
        channelCode: channelCode,
        customerEmail: email,
        customerPhone: phone,
        successRedirectUrl: 'wemultiply://payment/success',
        failureRedirectUrl: 'wemultiply://payment/failure',
      );

      // Save payment to database
      final payment = Payment(
        orderId: orderId,
        externalId: response['id'] ?? referenceId,
        channel: 'PAYLATER_$channelCode',
        amount: amount,
        currency: response['currency'] ?? 'PHP',
        status: response['status'] ?? 'PENDING',
        metadata: jsonEncode(response),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await Payment.db.insertRow(session, payment);

      // Extract checkout URL from actions
      final actions = response['actions'] as Map<String, dynamic>?;
      final checkoutUrl = actions?['checkout_url'] as String? ??
          actions?['mobile_web_checkout_url'] as String? ??
          actions?['desktop_web_checkout_url'] as String?;

      return PaymentResponse(
        success: true,
        paymentId: response['id'] as String?,
        externalId: response['id'] as String?,
        referenceId: referenceId,
        status: response['status'] as String? ?? 'PENDING',
        checkoutUrl: checkoutUrl,
        currency: response['currency'] as String? ?? 'PHP',
        amount: amount,
        channel: 'PAYLATER_$channelCode',
      );
    } catch (e) {
      return PaymentResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Creates a Direct Debit payment (BPI, UnionBank)
  Future<PaymentResponse> createDirectDebit(
    Session session,
    String orderId,
    double amount,
    String channelCode,
    String? email,
  ) async {
    final referenceId =
        'dd_${orderId}_${DateTime.now().millisecondsSinceEpoch}';

    try {
      final response = await _xendit.createDirectDebitPayment(
        referenceId: referenceId,
        amount: amount,
        channelCode: channelCode,
        customerEmail: email,
        successRedirectUrl: 'wemultiply://payment/success',
        failureRedirectUrl: 'wemultiply://payment/failure',
      );

      // Save payment to database
      final payment = Payment(
        orderId: orderId,
        externalId: response['id'] ?? referenceId,
        channel: 'DIRECT_DEBIT_$channelCode',
        amount: amount,
        currency: response['currency'] ?? 'PHP',
        status: response['status'] ?? 'PENDING',
        metadata: jsonEncode(response),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await Payment.db.insertRow(session, payment);

      // Extract authorization URL from actions
      final actions = response['actions'] as Map<String, dynamic>?;
      final checkoutUrl = actions?['authorization_url'] as String? ??
          actions?['checkout_url'] as String?;

      return PaymentResponse(
        success: true,
        paymentId: response['id'] as String?,
        externalId: response['id'] as String?,
        referenceId: referenceId,
        status: response['status'] as String? ?? 'PENDING',
        checkoutUrl: checkoutUrl,
        currency: response['currency'] as String? ?? 'PHP',
        amount: amount,
        channel: 'DIRECT_DEBIT_$channelCode',
      );
    } catch (e) {
      return PaymentResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Webhook handler for Xendit payment callbacks
  Future<void> handleWebhook(
    Session session,
    Map<String, dynamic> payload,
  ) async {
    final externalId = payload['external_id'] as String? ??
        payload['reference_id'] as String? ??
        payload['id'] as String?;

    if (externalId == null) {
      session.log('Webhook received without external_id', level: LogLevel.warning);
      return;
    }

    final status = payload['status'] as String? ?? 'UNKNOWN';
    final eventType = payload['event'] as String?;

    session.log('Webhook received: $eventType for $externalId with status $status');

    // Find and update payment in database
    final payment = await Payment.db.findFirstRow(
      session,
      where: (t) => t.externalId.equals(externalId),
    );

    if (payment != null) {
      payment.status = status;
      payment.metadata = jsonEncode(payload);
      payment.updatedAt = DateTime.now();
      await Payment.db.updateRow(session, payment);
      session.log('Payment $externalId updated to status: $status');
    } else {
      session.log('Payment not found for external_id: $externalId', level: LogLevel.warning);
    }
  }
}
