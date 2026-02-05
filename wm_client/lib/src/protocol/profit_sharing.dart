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

abstract class ProfitSharing implements _i1.SerializableModel {
  ProfitSharing._({
    this.id,
    required this.profitType,
    required this.percentage,
    required this.effectiveDate,
    required this.createdAt,
    required this.isActive,
  });

  factory ProfitSharing({
    int? id,
    required String profitType,
    required double percentage,
    required DateTime effectiveDate,
    required DateTime createdAt,
    required bool isActive,
  }) = _ProfitSharingImpl;

  factory ProfitSharing.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProfitSharing(
      id: jsonSerialization['id'] as int?,
      profitType: jsonSerialization['profitType'] as String,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
      effectiveDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['effectiveDate'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      isActive: jsonSerialization['isActive'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String profitType;

  double percentage;

  DateTime effectiveDate;

  DateTime createdAt;

  bool isActive;

  /// Returns a shallow copy of this [ProfitSharing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProfitSharing copyWith({
    int? id,
    String? profitType,
    double? percentage,
    DateTime? effectiveDate,
    DateTime? createdAt,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProfitSharing',
      if (id != null) 'id': id,
      'profitType': profitType,
      'percentage': percentage,
      'effectiveDate': effectiveDate.toJson(),
      'createdAt': createdAt.toJson(),
      'isActive': isActive,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProfitSharingImpl extends ProfitSharing {
  _ProfitSharingImpl({
    int? id,
    required String profitType,
    required double percentage,
    required DateTime effectiveDate,
    required DateTime createdAt,
    required bool isActive,
  }) : super._(
         id: id,
         profitType: profitType,
         percentage: percentage,
         effectiveDate: effectiveDate,
         createdAt: createdAt,
         isActive: isActive,
       );

  /// Returns a shallow copy of this [ProfitSharing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProfitSharing copyWith({
    Object? id = _Undefined,
    String? profitType,
    double? percentage,
    DateTime? effectiveDate,
    DateTime? createdAt,
    bool? isActive,
  }) {
    return ProfitSharing(
      id: id is int? ? id : this.id,
      profitType: profitType ?? this.profitType,
      percentage: percentage ?? this.percentage,
      effectiveDate: effectiveDate ?? this.effectiveDate,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }
}
