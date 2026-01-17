import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/spc_core.dart';

/// Payment method categories for grouping in UI
enum PaymentCategory {
  ewallet('E-Wallets'),
  qr('QR Code'),
  card('Cards'),
  paylater('Pay Later'),
  directDebit('Direct Debit'),
  other('Other');

  final String displayName;
  const PaymentCategory(this.displayName);
}

/// Payment methods supported by Xendit Philippines
enum PaymentMethod {
  // E-Wallets (Xendit PH channel codes)
  gcash('PH_GCASH', 'GCash', 'Pay with GCash e-wallet', PaymentCategory.ewallet),
  maya('PH_PAYMAYA', 'Maya', 'Pay with Maya e-wallet', PaymentCategory.ewallet),
  grabPay('PH_GRABPAY', 'GrabPay', 'Pay with GrabPay', PaymentCategory.ewallet),
  shopeePay('PH_SHOPEEPAY', 'ShopeePay', 'Pay with ShopeePay', PaymentCategory.ewallet),

  // QR Code
  qrph('QRPH', 'QR Ph', 'Scan to pay via InstaPay/PESONet', PaymentCategory.qr),

  // Cards
  card('CARD', 'Credit/Debit Card', 'Pay with Visa or Mastercard', PaymentCategory.card),

  // PayLater / Buy Now Pay Later (Xendit PH channel codes)
  billease('PH_BILLEASE', 'BillEase', 'Buy now, pay later with BillEase', PaymentCategory.paylater),
  cashalo('PH_CASHALO', 'Cashalo', 'Buy now, pay later with Cashalo', PaymentCategory.paylater),

  // Direct Debit (Xendit PH channel codes)
  bpiDirectDebit('BPI', 'BPI Direct Debit', 'Pay directly from BPI account', PaymentCategory.directDebit),
  ubpDirectDebit('UBP', 'UnionBank Direct Debit', 'Pay directly from UnionBank', PaymentCategory.directDebit),

  // Invoice / Other
  invoice('INVOICE', 'Invoice', 'Pay via invoice link', PaymentCategory.other);

  final String code;
  final String displayName;
  final String description;
  final PaymentCategory category;

  const PaymentMethod(this.code, this.displayName, this.description, this.category);
}

/// Result of a payment creation request
class PaymentResult {
  final bool success;
  final String? checkoutUrl;
  final String? invoiceUrl;
  final String? externalId;
  final String? paymentId;
  final String? qrString;
  final String? error;

  PaymentResult({
    required this.success,
    this.checkoutUrl,
    this.invoiceUrl,
    this.externalId,
    this.paymentId,
    this.qrString,
    this.error,
  });

  factory PaymentResult.success({
    String? checkoutUrl,
    String? invoiceUrl,
    String? externalId,
    String? paymentId,
    String? qrString,
  }) {
    return PaymentResult(
      success: true,
      checkoutUrl: checkoutUrl,
      invoiceUrl: invoiceUrl,
      externalId: externalId,
      paymentId: paymentId,
      qrString: qrString,
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

      if (response.success && response.invoiceUrl != null) {
        return PaymentResult.success(
          invoiceUrl: response.invoiceUrl,
          checkoutUrl: response.checkoutUrl,
          externalId: response.externalId,
          paymentId: response.paymentId,
        );
      } else {
        return PaymentResult.failure(response.errorMessage ?? 'Failed to create invoice');
      }
    } catch (e) {
      return PaymentResult.failure(e.toString());
    }
  }

  /// Creates an e-wallet payment (GCash, Maya, GrabPay, ShopeePay)
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

      if (response.success) {
        return PaymentResult.success(
          checkoutUrl: response.checkoutUrl,
          externalId: response.externalId,
          paymentId: response.paymentId,
        );
      } else {
        return PaymentResult.failure(response.errorMessage ?? 'Failed to create e-wallet payment');
      }
    } catch (e) {
      return PaymentResult.failure(e.toString());
    }
  }

  /// Creates a QR PH payment
  Future<PaymentResult> createQrPayment({
    required String orderId,
    required double amount,
  }) async {
    try {
      final response = await _client.payment.createQrPayment(
        orderId,
        amount,
      );

      if (response.success) {
        return PaymentResult.success(
          qrString: response.qrString,
          externalId: response.externalId ?? response.referenceId,
          paymentId: response.paymentId,
        );
      } else {
        return PaymentResult.failure(response.errorMessage ?? 'Failed to create QR payment');
      }
    } catch (e) {
      return PaymentResult.failure(e.toString());
    }
  }

  /// Creates a PayLater payment (BillEase, Cashalo)
  Future<PaymentResult> createPayLaterPayment({
    required String orderId,
    required double amount,
    required String channelCode,
    String? email,
    String? phone,
  }) async {
    try {
      final userEmail = email ?? SpcCore.sessionManager.signedInUser?.email;

      final response = await _client.payment.createPayLater(
        orderId,
        amount,
        channelCode,
        userEmail,
        phone,
      );

      if (response.success) {
        return PaymentResult.success(
          checkoutUrl: response.checkoutUrl,
          externalId: response.externalId,
          paymentId: response.paymentId,
        );
      } else {
        return PaymentResult.failure(response.errorMessage ?? 'Failed to create PayLater payment');
      }
    } catch (e) {
      return PaymentResult.failure(e.toString());
    }
  }

  /// Creates a Direct Debit payment (BPI, UnionBank)
  Future<PaymentResult> createDirectDebitPayment({
    required String orderId,
    required double amount,
    required String channelCode,
    String? email,
  }) async {
    try {
      final userEmail = email ?? SpcCore.sessionManager.signedInUser?.email;

      final response = await _client.payment.createDirectDebit(
        orderId,
        amount,
        channelCode,
        userEmail,
      );

      if (response.success) {
        return PaymentResult.success(
          checkoutUrl: response.checkoutUrl,
          externalId: response.externalId,
          paymentId: response.paymentId,
        );
      } else {
        return PaymentResult.failure(response.errorMessage ?? 'Failed to create Direct Debit payment');
      }
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
    String? phone,
  }) async {
    switch (method) {
      case PaymentMethod.invoice:
        return createInvoice(orderId: orderId, amount: amount, email: email);

      case PaymentMethod.gcash:
      case PaymentMethod.maya:
      case PaymentMethod.grabPay:
      case PaymentMethod.shopeePay:
        return createEwalletPayment(
          orderId: orderId,
          amount: amount,
          channelCode: method.code,
        );

      case PaymentMethod.qrph:
        return createQrPayment(orderId: orderId, amount: amount);

      case PaymentMethod.billease:
      case PaymentMethod.cashalo:
        return createPayLaterPayment(
          orderId: orderId,
          amount: amount,
          channelCode: method.code,
          email: email,
          phone: phone,
        );

      case PaymentMethod.bpiDirectDebit:
      case PaymentMethod.ubpDirectDebit:
        return createDirectDebitPayment(
          orderId: orderId,
          amount: amount,
          channelCode: method.code,
          email: email,
        );

      case PaymentMethod.card:
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
    return payment?.status == 'PAID' || payment?.status == 'SUCCEEDED';
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

      if (response.success) {
        return PaymentResult.success(
          checkoutUrl: response.checkoutUrl,
          externalId: response.externalId,
          paymentId: response.paymentId,
        );
      } else {
        return PaymentResult.failure(response.errorMessage ?? 'Failed to create card payment');
      }
    } catch (e) {
      return PaymentResult.failure(e.toString());
    }
  }

  /// Gets card payment status from Xendit
  Future<PaymentResponse?> getCardPaymentXenditStatus(
    String paymentRequestId,
  ) async {
    try {
      return await _client.payment.getCardPaymentStatus(paymentRequestId);
    } catch (e) {
      return null;
    }
  }
}
