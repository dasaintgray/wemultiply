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

abstract class CommissionRule implements _i1.SerializableModel {
  CommissionRule._({
    this.id,
    required this.rankId,
    required this.level,
    required this.commissionRate,
    required this.commissionType,
  });

  factory CommissionRule({
    int? id,
    required int rankId,
    required int level,
    required double commissionRate,
    required String commissionType,
  }) = _CommissionRuleImpl;

  factory CommissionRule.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommissionRule(
      id: jsonSerialization['id'] as int?,
      rankId: jsonSerialization['rankId'] as int,
      level: jsonSerialization['level'] as int,
      commissionRate: (jsonSerialization['commissionRate'] as num).toDouble(),
      commissionType: jsonSerialization['commissionType'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int rankId;

  int level;

  double commissionRate;

  String commissionType;

  /// Returns a shallow copy of this [CommissionRule]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CommissionRule copyWith({
    int? id,
    int? rankId,
    int? level,
    double? commissionRate,
    String? commissionType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommissionRule',
      if (id != null) 'id': id,
      'rankId': rankId,
      'level': level,
      'commissionRate': commissionRate,
      'commissionType': commissionType,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommissionRuleImpl extends CommissionRule {
  _CommissionRuleImpl({
    int? id,
    required int rankId,
    required int level,
    required double commissionRate,
    required String commissionType,
  }) : super._(
         id: id,
         rankId: rankId,
         level: level,
         commissionRate: commissionRate,
         commissionType: commissionType,
       );

  /// Returns a shallow copy of this [CommissionRule]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CommissionRule copyWith({
    Object? id = _Undefined,
    int? rankId,
    int? level,
    double? commissionRate,
    String? commissionType,
  }) {
    return CommissionRule(
      id: id is int? ? id : this.id,
      rankId: rankId ?? this.rankId,
      level: level ?? this.level,
      commissionRate: commissionRate ?? this.commissionRate,
      commissionType: commissionType ?? this.commissionType,
    );
  }
}
