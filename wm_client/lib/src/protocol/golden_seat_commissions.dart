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

abstract class GoldenSeatCommission implements _i1.SerializableModel {
  GoldenSeatCommission._({
    this.id,
    required this.seatType,
    required this.packageId,
    required this.productId,
    required this.netPerMember,
    required this.netPerBottle,
    required this.commissionAmount,
    required this.createdAt,
  });

  factory GoldenSeatCommission({
    int? id,
    required String seatType,
    required int packageId,
    required int productId,
    required double netPerMember,
    required double netPerBottle,
    required double commissionAmount,
    required DateTime createdAt,
  }) = _GoldenSeatCommissionImpl;

  factory GoldenSeatCommission.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return GoldenSeatCommission(
      id: jsonSerialization['id'] as int?,
      seatType: jsonSerialization['seatType'] as String,
      packageId: jsonSerialization['packageId'] as int,
      productId: jsonSerialization['productId'] as int,
      netPerMember: (jsonSerialization['netPerMember'] as num).toDouble(),
      netPerBottle: (jsonSerialization['netPerBottle'] as num).toDouble(),
      commissionAmount: (jsonSerialization['commissionAmount'] as num)
          .toDouble(),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String seatType;

  int packageId;

  int productId;

  double netPerMember;

  double netPerBottle;

  double commissionAmount;

  DateTime createdAt;

  /// Returns a shallow copy of this [GoldenSeatCommission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GoldenSeatCommission copyWith({
    int? id,
    String? seatType,
    int? packageId,
    int? productId,
    double? netPerMember,
    double? netPerBottle,
    double? commissionAmount,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GoldenSeatCommission',
      if (id != null) 'id': id,
      'seatType': seatType,
      'packageId': packageId,
      'productId': productId,
      'netPerMember': netPerMember,
      'netPerBottle': netPerBottle,
      'commissionAmount': commissionAmount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GoldenSeatCommissionImpl extends GoldenSeatCommission {
  _GoldenSeatCommissionImpl({
    int? id,
    required String seatType,
    required int packageId,
    required int productId,
    required double netPerMember,
    required double netPerBottle,
    required double commissionAmount,
    required DateTime createdAt,
  }) : super._(
         id: id,
         seatType: seatType,
         packageId: packageId,
         productId: productId,
         netPerMember: netPerMember,
         netPerBottle: netPerBottle,
         commissionAmount: commissionAmount,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [GoldenSeatCommission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GoldenSeatCommission copyWith({
    Object? id = _Undefined,
    String? seatType,
    int? packageId,
    int? productId,
    double? netPerMember,
    double? netPerBottle,
    double? commissionAmount,
    DateTime? createdAt,
  }) {
    return GoldenSeatCommission(
      id: id is int? ? id : this.id,
      seatType: seatType ?? this.seatType,
      packageId: packageId ?? this.packageId,
      productId: productId ?? this.productId,
      netPerMember: netPerMember ?? this.netPerMember,
      netPerBottle: netPerBottle ?? this.netPerBottle,
      commissionAmount: commissionAmount ?? this.commissionAmount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
