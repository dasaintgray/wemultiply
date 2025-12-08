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

abstract class ReaperCommission implements _i1.SerializableModel {
  ReaperCommission._({
    this.id,
    required this.packageId,
    required this.level,
    required this.productId,
    required this.netPerMember,
    required this.repeatOrderNet,
    this.ronDescription,
    required this.isActive,
    required this.createdBy,
    required this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  factory ReaperCommission({
    int? id,
    required int packageId,
    required int level,
    required int productId,
    required double netPerMember,
    required double repeatOrderNet,
    String? ronDescription,
    required bool isActive,
    required String createdBy,
    required DateTime createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  }) = _ReaperCommissionImpl;

  factory ReaperCommission.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReaperCommission(
      id: jsonSerialization['id'] as int?,
      packageId: jsonSerialization['packageId'] as int,
      level: jsonSerialization['level'] as int,
      productId: jsonSerialization['productId'] as int,
      netPerMember: (jsonSerialization['netPerMember'] as num).toDouble(),
      repeatOrderNet: (jsonSerialization['repeatOrderNet'] as num).toDouble(),
      ronDescription: jsonSerialization['ronDescription'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      createdBy: jsonSerialization['createdBy'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedBy: jsonSerialization['updatedBy'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int packageId;

  int level;

  int productId;

  double netPerMember;

  double repeatOrderNet;

  String? ronDescription;

  bool isActive;

  String createdBy;

  DateTime createdAt;

  String? updatedBy;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [ReaperCommission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReaperCommission copyWith({
    int? id,
    int? packageId,
    int? level,
    int? productId,
    double? netPerMember,
    double? repeatOrderNet,
    String? ronDescription,
    bool? isActive,
    String? createdBy,
    DateTime? createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'packageId': packageId,
      'level': level,
      'productId': productId,
      'netPerMember': netPerMember,
      'repeatOrderNet': repeatOrderNet,
      if (ronDescription != null) 'ronDescription': ronDescription,
      'isActive': isActive,
      'createdBy': createdBy,
      'createdAt': createdAt.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReaperCommissionImpl extends ReaperCommission {
  _ReaperCommissionImpl({
    int? id,
    required int packageId,
    required int level,
    required int productId,
    required double netPerMember,
    required double repeatOrderNet,
    String? ronDescription,
    required bool isActive,
    required String createdBy,
    required DateTime createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          packageId: packageId,
          level: level,
          productId: productId,
          netPerMember: netPerMember,
          repeatOrderNet: repeatOrderNet,
          ronDescription: ronDescription,
          isActive: isActive,
          createdBy: createdBy,
          createdAt: createdAt,
          updatedBy: updatedBy,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [ReaperCommission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReaperCommission copyWith({
    Object? id = _Undefined,
    int? packageId,
    int? level,
    int? productId,
    double? netPerMember,
    double? repeatOrderNet,
    Object? ronDescription = _Undefined,
    bool? isActive,
    String? createdBy,
    DateTime? createdAt,
    Object? updatedBy = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return ReaperCommission(
      id: id is int? ? id : this.id,
      packageId: packageId ?? this.packageId,
      level: level ?? this.level,
      productId: productId ?? this.productId,
      netPerMember: netPerMember ?? this.netPerMember,
      repeatOrderNet: repeatOrderNet ?? this.repeatOrderNet,
      ronDescription:
          ronDescription is String? ? ronDescription : this.ronDescription,
      isActive: isActive ?? this.isActive,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedBy: updatedBy is String? ? updatedBy : this.updatedBy,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
