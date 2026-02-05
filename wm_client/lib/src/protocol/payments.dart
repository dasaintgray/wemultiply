/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Payment implements _i1.SerializableModel {
  Payment._({
    this.id,
    required this.orderId,
    required this.externalId,
    required this.channel,
    required this.amount,
    required this.currency,
    required this.status,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment({
    int? id,
    required String orderId,
    required String externalId,
    required String channel,
    required double amount,
    required String currency,
    required String status,
    required String metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PaymentImpl;

  factory Payment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Payment(
      id: jsonSerialization['id'] as int?,
      orderId: jsonSerialization['orderId'] as String,
      externalId: jsonSerialization['externalId'] as String,
      channel: jsonSerialization['channel'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      status: jsonSerialization['status'] as String,
      metadata: jsonSerialization['metadata'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String orderId;

  String externalId;

  String channel;

  double amount;

  String currency;

  String status;

  String metadata;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Payment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Payment copyWith({
    int? id,
    String? orderId,
    String? externalId,
    String? channel,
    double? amount,
    String? currency,
    String? status,
    String? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Payment',
      if (id != null) 'id': id,
      'orderId': orderId,
      'externalId': externalId,
      'channel': channel,
      'amount': amount,
      'currency': currency,
      'status': status,
      'metadata': metadata,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentImpl extends Payment {
  _PaymentImpl({
    int? id,
    required String orderId,
    required String externalId,
    required String channel,
    required double amount,
    required String currency,
    required String status,
    required String metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         orderId: orderId,
         externalId: externalId,
         channel: channel,
         amount: amount,
         currency: currency,
         status: status,
         metadata: metadata,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Payment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Payment copyWith({
    Object? id = _Undefined,
    String? orderId,
    String? externalId,
    String? channel,
    double? amount,
    String? currency,
    String? status,
    String? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Payment(
      id: id is int? ? id : this.id,
      orderId: orderId ?? this.orderId,
      externalId: externalId ?? this.externalId,
      channel: channel ?? this.channel,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
