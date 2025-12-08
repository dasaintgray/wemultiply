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
import 'reaper_commissions.dart' as _i2;

abstract class Package implements _i1.SerializableModel {
  Package._({
    this.id,
    required this.packageName,
    required this.packageDescription,
    required this.membershipFee,
    required this.productId,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    required this.isActive,
    this.packageId,
  });

  factory Package({
    int? id,
    required String packageName,
    required String packageDescription,
    required double membershipFee,
    required int productId,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
    required bool isActive,
    List<_i2.ReaperCommission>? packageId,
  }) = _PackageImpl;

  factory Package.fromJson(Map<String, dynamic> jsonSerialization) {
    return Package(
      id: jsonSerialization['id'] as int?,
      packageName: jsonSerialization['packageName'] as String,
      packageDescription: jsonSerialization['packageDescription'] as String,
      membershipFee: (jsonSerialization['membershipFee'] as num).toDouble(),
      productId: jsonSerialization['productId'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdBy: jsonSerialization['createdBy'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      updatedBy: jsonSerialization['updatedBy'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      packageId: (jsonSerialization['packageId'] as List?)
          ?.map(
              (e) => _i2.ReaperCommission.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String packageName;

  String packageDescription;

  double membershipFee;

  int productId;

  DateTime? createdAt;

  String? createdBy;

  DateTime? updatedAt;

  String? updatedBy;

  bool isActive;

  List<_i2.ReaperCommission>? packageId;

  /// Returns a shallow copy of this [Package]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Package copyWith({
    int? id,
    String? packageName,
    String? packageDescription,
    double? membershipFee,
    int? productId,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
    bool? isActive,
    List<_i2.ReaperCommission>? packageId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'packageName': packageName,
      'packageDescription': packageDescription,
      'membershipFee': membershipFee,
      'productId': productId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (createdBy != null) 'createdBy': createdBy,
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy,
      'isActive': isActive,
      if (packageId != null)
        'packageId': packageId?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PackageImpl extends Package {
  _PackageImpl({
    int? id,
    required String packageName,
    required String packageDescription,
    required double membershipFee,
    required int productId,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
    required bool isActive,
    List<_i2.ReaperCommission>? packageId,
  }) : super._(
          id: id,
          packageName: packageName,
          packageDescription: packageDescription,
          membershipFee: membershipFee,
          productId: productId,
          createdAt: createdAt,
          createdBy: createdBy,
          updatedAt: updatedAt,
          updatedBy: updatedBy,
          isActive: isActive,
          packageId: packageId,
        );

  /// Returns a shallow copy of this [Package]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Package copyWith({
    Object? id = _Undefined,
    String? packageName,
    String? packageDescription,
    double? membershipFee,
    int? productId,
    Object? createdAt = _Undefined,
    Object? createdBy = _Undefined,
    Object? updatedAt = _Undefined,
    Object? updatedBy = _Undefined,
    bool? isActive,
    Object? packageId = _Undefined,
  }) {
    return Package(
      id: id is int? ? id : this.id,
      packageName: packageName ?? this.packageName,
      packageDescription: packageDescription ?? this.packageDescription,
      membershipFee: membershipFee ?? this.membershipFee,
      productId: productId ?? this.productId,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      createdBy: createdBy is String? ? createdBy : this.createdBy,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      updatedBy: updatedBy is String? ? updatedBy : this.updatedBy,
      isActive: isActive ?? this.isActive,
      packageId: packageId is List<_i2.ReaperCommission>?
          ? packageId
          : this.packageId?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
