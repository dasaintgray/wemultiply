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

abstract class Ranks implements _i1.SerializableModel {
  Ranks._({
    this.id,
    required this.rankName,
    required this.rankCategoryID,
    required this.minPersonalSalesTarget,
    required this.minGroupSalesTarget,
    required this.minDirectRecruits,
  });

  factory Ranks({
    int? id,
    required String rankName,
    required int rankCategoryID,
    required int minPersonalSalesTarget,
    required int minGroupSalesTarget,
    required int minDirectRecruits,
  }) = _RanksImpl;

  factory Ranks.fromJson(Map<String, dynamic> jsonSerialization) {
    return Ranks(
      id: jsonSerialization['id'] as int?,
      rankName: jsonSerialization['rankName'] as String,
      rankCategoryID: jsonSerialization['rankCategoryID'] as int,
      minPersonalSalesTarget:
          jsonSerialization['minPersonalSalesTarget'] as int,
      minGroupSalesTarget: jsonSerialization['minGroupSalesTarget'] as int,
      minDirectRecruits: jsonSerialization['minDirectRecruits'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String rankName;

  int rankCategoryID;

  int minPersonalSalesTarget;

  int minGroupSalesTarget;

  int minDirectRecruits;

  /// Returns a shallow copy of this [Ranks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Ranks copyWith({
    int? id,
    String? rankName,
    int? rankCategoryID,
    int? minPersonalSalesTarget,
    int? minGroupSalesTarget,
    int? minDirectRecruits,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Ranks',
      if (id != null) 'id': id,
      'rankName': rankName,
      'rankCategoryID': rankCategoryID,
      'minPersonalSalesTarget': minPersonalSalesTarget,
      'minGroupSalesTarget': minGroupSalesTarget,
      'minDirectRecruits': minDirectRecruits,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RanksImpl extends Ranks {
  _RanksImpl({
    int? id,
    required String rankName,
    required int rankCategoryID,
    required int minPersonalSalesTarget,
    required int minGroupSalesTarget,
    required int minDirectRecruits,
  }) : super._(
         id: id,
         rankName: rankName,
         rankCategoryID: rankCategoryID,
         minPersonalSalesTarget: minPersonalSalesTarget,
         minGroupSalesTarget: minGroupSalesTarget,
         minDirectRecruits: minDirectRecruits,
       );

  /// Returns a shallow copy of this [Ranks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Ranks copyWith({
    Object? id = _Undefined,
    String? rankName,
    int? rankCategoryID,
    int? minPersonalSalesTarget,
    int? minGroupSalesTarget,
    int? minDirectRecruits,
  }) {
    return Ranks(
      id: id is int? ? id : this.id,
      rankName: rankName ?? this.rankName,
      rankCategoryID: rankCategoryID ?? this.rankCategoryID,
      minPersonalSalesTarget:
          minPersonalSalesTarget ?? this.minPersonalSalesTarget,
      minGroupSalesTarget: minGroupSalesTarget ?? this.minGroupSalesTarget,
      minDirectRecruits: minDirectRecruits ?? this.minDirectRecruits,
    );
  }
}
