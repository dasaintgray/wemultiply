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

abstract class Commissions implements _i1.SerializableModel {
  Commissions._({
    this.id,
    required this.saleId,
    required this.recipientId,
    required this.sourceLevel,
    required this.commissionType,
    required this.commissionAmount,
    required this.isPaid,
    this.paidAt,
    required this.createdAt,
  });

  factory Commissions({
    int? id,
    required int saleId,
    required int recipientId,
    required int sourceLevel,
    required String commissionType,
    required double commissionAmount,
    required bool isPaid,
    DateTime? paidAt,
    required DateTime createdAt,
  }) = _CommissionsImpl;

  factory Commissions.fromJson(Map<String, dynamic> jsonSerialization) {
    return Commissions(
      id: jsonSerialization['id'] as int?,
      saleId: jsonSerialization['saleId'] as int,
      recipientId: jsonSerialization['recipientId'] as int,
      sourceLevel: jsonSerialization['sourceLevel'] as int,
      commissionType: jsonSerialization['commissionType'] as String,
      commissionAmount: (jsonSerialization['commissionAmount'] as num)
          .toDouble(),
      isPaid: jsonSerialization['isPaid'] as bool,
      paidAt: jsonSerialization['paidAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['paidAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int saleId;

  int recipientId;

  int sourceLevel;

  String commissionType;

  double commissionAmount;

  bool isPaid;

  DateTime? paidAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [Commissions]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Commissions copyWith({
    int? id,
    int? saleId,
    int? recipientId,
    int? sourceLevel,
    String? commissionType,
    double? commissionAmount,
    bool? isPaid,
    DateTime? paidAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Commissions',
      if (id != null) 'id': id,
      'saleId': saleId,
      'recipientId': recipientId,
      'sourceLevel': sourceLevel,
      'commissionType': commissionType,
      'commissionAmount': commissionAmount,
      'isPaid': isPaid,
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommissionsImpl extends Commissions {
  _CommissionsImpl({
    int? id,
    required int saleId,
    required int recipientId,
    required int sourceLevel,
    required String commissionType,
    required double commissionAmount,
    required bool isPaid,
    DateTime? paidAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         saleId: saleId,
         recipientId: recipientId,
         sourceLevel: sourceLevel,
         commissionType: commissionType,
         commissionAmount: commissionAmount,
         isPaid: isPaid,
         paidAt: paidAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Commissions]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Commissions copyWith({
    Object? id = _Undefined,
    int? saleId,
    int? recipientId,
    int? sourceLevel,
    String? commissionType,
    double? commissionAmount,
    bool? isPaid,
    Object? paidAt = _Undefined,
    DateTime? createdAt,
  }) {
    return Commissions(
      id: id is int? ? id : this.id,
      saleId: saleId ?? this.saleId,
      recipientId: recipientId ?? this.recipientId,
      sourceLevel: sourceLevel ?? this.sourceLevel,
      commissionType: commissionType ?? this.commissionType,
      commissionAmount: commissionAmount ?? this.commissionAmount,
      isPaid: isPaid ?? this.isPaid,
      paidAt: paidAt is DateTime? ? paidAt : this.paidAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
