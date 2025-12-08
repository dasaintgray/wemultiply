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

abstract class PaymentEvent implements _i1.SerializableModel {
  PaymentEvent._({
    this.id,
    required this.paymentId,
    required this.eventType,
    required this.payload,
    required this.createdAt,
  });

  factory PaymentEvent({
    int? id,
    required int paymentId,
    required String eventType,
    required String payload,
    required DateTime createdAt,
  }) = _PaymentEventImpl;

  factory PaymentEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentEvent(
      id: jsonSerialization['id'] as int?,
      paymentId: jsonSerialization['paymentId'] as int,
      eventType: jsonSerialization['eventType'] as String,
      payload: jsonSerialization['payload'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int paymentId;

  String eventType;

  String payload;

  DateTime createdAt;

  /// Returns a shallow copy of this [PaymentEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentEvent copyWith({
    int? id,
    int? paymentId,
    String? eventType,
    String? payload,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'paymentId': paymentId,
      'eventType': eventType,
      'payload': payload,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentEventImpl extends PaymentEvent {
  _PaymentEventImpl({
    int? id,
    required int paymentId,
    required String eventType,
    required String payload,
    required DateTime createdAt,
  }) : super._(
          id: id,
          paymentId: paymentId,
          eventType: eventType,
          payload: payload,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [PaymentEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentEvent copyWith({
    Object? id = _Undefined,
    int? paymentId,
    String? eventType,
    String? payload,
    DateTime? createdAt,
  }) {
    return PaymentEvent(
      id: id is int? ? id : this.id,
      paymentId: paymentId ?? this.paymentId,
      eventType: eventType ?? this.eventType,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
