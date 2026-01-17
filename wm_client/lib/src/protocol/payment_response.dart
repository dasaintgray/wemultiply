/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class PaymentResponse implements _i1.SerializableModel {
  PaymentResponse._({
    required this.success,
    this.paymentId,
    this.externalId,
    this.referenceId,
    this.status,
    this.checkoutUrl,
    this.invoiceUrl,
    this.qrString,
    this.currency,
    this.amount,
    this.channel,
    this.errorCode,
    this.errorMessage,
  });

  factory PaymentResponse({
    required bool success,
    String? paymentId,
    String? externalId,
    String? referenceId,
    String? status,
    String? checkoutUrl,
    String? invoiceUrl,
    String? qrString,
    String? currency,
    double? amount,
    String? channel,
    String? errorCode,
    String? errorMessage,
  }) = _PaymentResponseImpl;

  factory PaymentResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentResponse(
      success: jsonSerialization['success'] as bool,
      paymentId: jsonSerialization['paymentId'] as String?,
      externalId: jsonSerialization['externalId'] as String?,
      referenceId: jsonSerialization['referenceId'] as String?,
      status: jsonSerialization['status'] as String?,
      checkoutUrl: jsonSerialization['checkoutUrl'] as String?,
      invoiceUrl: jsonSerialization['invoiceUrl'] as String?,
      qrString: jsonSerialization['qrString'] as String?,
      currency: jsonSerialization['currency'] as String?,
      amount: (jsonSerialization['amount'] as num?)?.toDouble(),
      channel: jsonSerialization['channel'] as String?,
      errorCode: jsonSerialization['errorCode'] as String?,
      errorMessage: jsonSerialization['errorMessage'] as String?,
    );
  }

  bool success;

  String? paymentId;

  String? externalId;

  String? referenceId;

  String? status;

  String? checkoutUrl;

  String? invoiceUrl;

  String? qrString;

  String? currency;

  double? amount;

  String? channel;

  String? errorCode;

  String? errorMessage;

  /// Returns a shallow copy of this [PaymentResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentResponse copyWith({
    bool? success,
    String? paymentId,
    String? externalId,
    String? referenceId,
    String? status,
    String? checkoutUrl,
    String? invoiceUrl,
    String? qrString,
    String? currency,
    double? amount,
    String? channel,
    String? errorCode,
    String? errorMessage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      if (paymentId != null) 'paymentId': paymentId,
      if (externalId != null) 'externalId': externalId,
      if (referenceId != null) 'referenceId': referenceId,
      if (status != null) 'status': status,
      if (checkoutUrl != null) 'checkoutUrl': checkoutUrl,
      if (invoiceUrl != null) 'invoiceUrl': invoiceUrl,
      if (qrString != null) 'qrString': qrString,
      if (currency != null) 'currency': currency,
      if (amount != null) 'amount': amount,
      if (channel != null) 'channel': channel,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentResponseImpl extends PaymentResponse {
  _PaymentResponseImpl({
    required bool success,
    String? paymentId,
    String? externalId,
    String? referenceId,
    String? status,
    String? checkoutUrl,
    String? invoiceUrl,
    String? qrString,
    String? currency,
    double? amount,
    String? channel,
    String? errorCode,
    String? errorMessage,
  }) : super._(
          success: success,
          paymentId: paymentId,
          externalId: externalId,
          referenceId: referenceId,
          status: status,
          checkoutUrl: checkoutUrl,
          invoiceUrl: invoiceUrl,
          qrString: qrString,
          currency: currency,
          amount: amount,
          channel: channel,
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// Returns a shallow copy of this [PaymentResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentResponse copyWith({
    bool? success,
    Object? paymentId = _Undefined,
    Object? externalId = _Undefined,
    Object? referenceId = _Undefined,
    Object? status = _Undefined,
    Object? checkoutUrl = _Undefined,
    Object? invoiceUrl = _Undefined,
    Object? qrString = _Undefined,
    Object? currency = _Undefined,
    Object? amount = _Undefined,
    Object? channel = _Undefined,
    Object? errorCode = _Undefined,
    Object? errorMessage = _Undefined,
  }) {
    return PaymentResponse(
      success: success ?? this.success,
      paymentId: paymentId is String? ? paymentId : this.paymentId,
      externalId: externalId is String? ? externalId : this.externalId,
      referenceId: referenceId is String? ? referenceId : this.referenceId,
      status: status is String? ? status : this.status,
      checkoutUrl: checkoutUrl is String? ? checkoutUrl : this.checkoutUrl,
      invoiceUrl: invoiceUrl is String? ? invoiceUrl : this.invoiceUrl,
      qrString: qrString is String? ? qrString : this.qrString,
      currency: currency is String? ? currency : this.currency,
      amount: amount is double? ? amount : this.amount,
      channel: channel is String? ? channel : this.channel,
      errorCode: errorCode is String? ? errorCode : this.errorCode,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
    );
  }
}
