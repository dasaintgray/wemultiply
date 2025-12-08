import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import 'package:wm_server/services/xendit_service.dart';
import 'package:wm_server/src/generated/protocol.dart';

class PaymentEndpoint extends Endpoint {
  final XenditService _xendit = XenditService(); //XENDIT SERVICE

  Future<Map<String, dynamic>> createInvoice(
      Session session, String orderId, double amount, String? email) async {
    final externalId =
        'order_${orderId}_${DateTime.now().millisecondsSinceEpoch}';

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

    return invoice;
  }

  Future<Map<String, dynamic>> createEwallet(Session session, String orderId,
      double amount, String channelCode) async {
    final referenceId =
        'ewallet_${orderId}_${DateTime.now().millisecondsSinceEpoch}';
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

    return resp;
  }

  Future<Payment?> getPaymentByExternalId(
      Session session, String externalId) async {
    return Payment.db
        .findFirstRow(session, where: (t) => t.externalId.equals(externalId));
  }

  Future<Map<String, dynamic>> createPayment(Session session,
      {required String orderID,
      required double amount,
      String? userEmail}) async {
    final invoice = await _xendit.createInvoice(
      externalId: orderID,
      amount: amount,
      customerEmail: userEmail,
    );

    //store to db
    return invoice;
  }

  /// Creates a direct card payment with 3DS authentication
  Future<Map<String, dynamic>> createCardPayment(
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

    return response;
  }

  /// Captures a pre-authorized card payment
  Future<Map<String, dynamic>> captureCardPayment(
    Session session, {
    required String paymentRequestId,
    required double captureAmount,
  }) async {
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

    return response;
  }

  /// Gets payment request status from Xendit
  Future<Map<String, dynamic>> getCardPaymentStatus(
    Session session,
    String paymentRequestId,
  ) async {
    return await _xendit.getPaymentRequestStatus(paymentRequestId);
  }
}
