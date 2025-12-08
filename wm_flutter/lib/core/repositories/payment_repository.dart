import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/spc_core.dart';

/// Payment methods supported by Xendit
enum PaymentMethod {
  invoice('INVOICE', 'Invoice', 'Pay via invoice link'),
  gcash('GCASH', 'GCash', 'Pay with GCash e-wallet'),
  maya('MAYA', 'Maya', 'Pay with Maya e-wallet'),
  grabPay('GRABPAY', 'GrabPay', 'Pay with GrabPay'),
  card('CARD', 'Credit/Debit Card', 'Pay with Visa or Mastercard');

  final String code;
  final String displayName;
  final String description;

  const PaymentMethod(this.code, this.displayName, this.description);
}

/// Result of a payment creation request
class PaymentResult {
  final bool success;
  final String? checkoutUrl;
  final String? invoiceUrl;
  final String? externalId;
  final String? paymentId;
  final String? error;

  PaymentResult({
    required this.success,
    this.checkoutUrl,
    this.invoiceUrl,
    this.externalId,
    this.paymentId,
    this.error,
  });

  factory PaymentResult.success({
    String? checkoutUrl,
    String? invoiceUrl,
    String? externalId,
    String? paymentId,
  }) {
    return PaymentResult(
      success: true,
      checkoutUrl: checkoutUrl,
      invoiceUrl: invoiceUrl,
      externalId: externalId,
      paymentId: paymentId,
    );
  }

  factory PaymentResult.failure(String error) {
    return PaymentResult(success: false, error: error);
  }
}

/// Repository for handling payment operations via Xendit
class PaymentRepository {
  final Client _client = SpcCore.client;

  /// Creates an invoice payment
  /// Returns a PaymentResult with the invoice URL
  Future<PaymentResult> createInvoice({
    required String orderId,
    required double amount,
    String? email,
  }) async {
    try {
      final userEmail = email ?? SpcCore.sessionManager.signedInUser?.email;

      final response = await _client.payment.createInvoice(
        orderId,
        amount,
        userEmail,
      );

      if (response['invoice_url'] != null) {
        return PaymentResult.success(
          invoiceUrl: response['invoice_url'] as String?,
          checkoutUrl: response['invoice_url'] as String?,
          externalId: response['external_id'] as String?,
          paymentId: response['id'] as String?,
        );
      } else {
        return PaymentResult.failure('Failed to create invoice');
      }
    } catch (e) {
      return PaymentResult.failure(e.toString());
    }
  }

  /// Creates an e-wallet payment (GCash, Maya, GrabPay)
  /// Returns a PaymentResult with the checkout URL
  Future<PaymentResult> createEwalletPayment({
    required String orderId,
    required double amount,
    required String channelCode,
  }) async {
    try {
      final response = await _client.payment.createEwallet(
        orderId,
        amount,
        channelCode,
      );

      // E-wallet responses have actions.mobile_web_checkout_url or actions.desktop_web_checkout_url
      final actions = response['actions'] as Map<String, dynamic>?;
      final checkoutUrl =
          actions?['mobile_web_checkout_url'] as String? ??
          actions?['desktop_web_checkout_url'] as String?;

      return PaymentResult.success(
        checkoutUrl: checkoutUrl,
        externalId: response['reference_id'] as String?,
        paymentId: response['id'] as String?,
      );
    } catch (e) {
      return PaymentResult.failure(e.toString());
    }
  }

  /// Creates a payment based on the selected payment method
  Future<PaymentResult> createPayment({
    required String orderId,
    required double amount,
    required PaymentMethod method,
    String? email,
  }) async {
    switch (method) {
      case PaymentMethod.invoice:
        return createInvoice(orderId: orderId, amount: amount, email: email);
      case PaymentMethod.gcash:
      case PaymentMethod.maya:
      case PaymentMethod.grabPay:
        return createEwalletPayment(
          orderId: orderId,
          amount: amount,
          channelCode: method.code,
        );
      case PaymentMethod.card:
        // For card payments, we use invoice which supports cards
        return createInvoice(orderId: orderId, amount: amount, email: email);
    }
  }

  /// Gets payment status by external ID
  Future<Payment?> getPaymentStatus(String externalId) async {
    try {
      return await _client.payment.getPaymentByExternalId(externalId);
    } catch (e) {
      return null;
    }
  }

  /// Checks if payment is completed
  Future<bool> isPaymentCompleted(String externalId) async {
    final payment = await getPaymentStatus(externalId);
    return payment?.status == 'PAID';
  }

  /// Creates a direct card payment with 3DS authentication
  Future<PaymentResult> createCardPayment({
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
    bool preAuthorize = false,
  }) async {
    try {
      final response = await _client.payment.createCardPayment(
        orderId: orderId,
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
        description: description,
        preAuthorize: preAuthorize,
      );

      // Check for 3DS authentication required
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

      return PaymentResult.success(
        checkoutUrl: threeDsUrl,
        externalId: response['reference_id'] as String?,
        paymentId: response['id'] as String?,
      );
    } catch (e) {
      return PaymentResult.failure(e.toString());
    }
  }

  /// Gets card payment status from Xendit
  Future<Map<String, dynamic>?> getCardPaymentXenditStatus(
    String paymentRequestId,
  ) async {
    try {
      return await _client.payment.getCardPaymentStatus(paymentRequestId);
    } catch (e) {
      return null;
    }
  }
}
