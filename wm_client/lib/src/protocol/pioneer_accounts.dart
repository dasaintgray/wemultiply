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

abstract class PioneerAccounts implements _i1.SerializableModel {
  PioneerAccounts._({
    this.id,
    required this.gsID,
    required this.userId,
    required this.pioneerCode,
    required this.createdAt,
    required this.isRedeemed,
    this.redeemedAt,
  });

  factory PioneerAccounts({
    int? id,
    required int gsID,
    required int userId,
    required String pioneerCode,
    required DateTime createdAt,
    required bool isRedeemed,
    DateTime? redeemedAt,
  }) = _PioneerAccountsImpl;

  factory PioneerAccounts.fromJson(Map<String, dynamic> jsonSerialization) {
    return PioneerAccounts(
      id: jsonSerialization['id'] as int?,
      gsID: jsonSerialization['gsID'] as int,
      userId: jsonSerialization['userId'] as int,
      pioneerCode: jsonSerialization['pioneerCode'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      isRedeemed: jsonSerialization['isRedeemed'] as bool,
      redeemedAt: jsonSerialization['redeemedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['redeemedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gsID;

  int userId;

  String pioneerCode;

  DateTime createdAt;

  bool isRedeemed;

  DateTime? redeemedAt;

  /// Returns a shallow copy of this [PioneerAccounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PioneerAccounts copyWith({
    int? id,
    int? gsID,
    int? userId,
    String? pioneerCode,
    DateTime? createdAt,
    bool? isRedeemed,
    DateTime? redeemedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PioneerAccounts',
      if (id != null) 'id': id,
      'gsID': gsID,
      'userId': userId,
      'pioneerCode': pioneerCode,
      'createdAt': createdAt.toJson(),
      'isRedeemed': isRedeemed,
      if (redeemedAt != null) 'redeemedAt': redeemedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PioneerAccountsImpl extends PioneerAccounts {
  _PioneerAccountsImpl({
    int? id,
    required int gsID,
    required int userId,
    required String pioneerCode,
    required DateTime createdAt,
    required bool isRedeemed,
    DateTime? redeemedAt,
  }) : super._(
         id: id,
         gsID: gsID,
         userId: userId,
         pioneerCode: pioneerCode,
         createdAt: createdAt,
         isRedeemed: isRedeemed,
         redeemedAt: redeemedAt,
       );

  /// Returns a shallow copy of this [PioneerAccounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PioneerAccounts copyWith({
    Object? id = _Undefined,
    int? gsID,
    int? userId,
    String? pioneerCode,
    DateTime? createdAt,
    bool? isRedeemed,
    Object? redeemedAt = _Undefined,
  }) {
    return PioneerAccounts(
      id: id is int? ? id : this.id,
      gsID: gsID ?? this.gsID,
      userId: userId ?? this.userId,
      pioneerCode: pioneerCode ?? this.pioneerCode,
      createdAt: createdAt ?? this.createdAt,
      isRedeemed: isRedeemed ?? this.isRedeemed,
      redeemedAt: redeemedAt is DateTime? ? redeemedAt : this.redeemedAt,
    );
  }
}
