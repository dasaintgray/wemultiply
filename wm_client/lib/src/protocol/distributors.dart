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

abstract class Distributors implements _i1.SerializableModel {
  Distributors._({
    this.id,
    required this.distributorName,
    required this.email,
    required this.userID,
    required this.joinDate,
    required this.currentRankId,
    required this.isActive,
  });

  factory Distributors({
    int? id,
    required String distributorName,
    required String email,
    required int userID,
    required DateTime joinDate,
    required int currentRankId,
    required bool isActive,
  }) = _DistributorsImpl;

  factory Distributors.fromJson(Map<String, dynamic> jsonSerialization) {
    return Distributors(
      id: jsonSerialization['id'] as int?,
      distributorName: jsonSerialization['distributorName'] as String,
      email: jsonSerialization['email'] as String,
      userID: jsonSerialization['userID'] as int,
      joinDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['joinDate']),
      currentRankId: jsonSerialization['currentRankId'] as int,
      isActive: jsonSerialization['isActive'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String distributorName;

  String email;

  int userID;

  DateTime joinDate;

  int currentRankId;

  bool isActive;

  /// Returns a shallow copy of this [Distributors]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Distributors copyWith({
    int? id,
    String? distributorName,
    String? email,
    int? userID,
    DateTime? joinDate,
    int? currentRankId,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'distributorName': distributorName,
      'email': email,
      'userID': userID,
      'joinDate': joinDate.toJson(),
      'currentRankId': currentRankId,
      'isActive': isActive,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DistributorsImpl extends Distributors {
  _DistributorsImpl({
    int? id,
    required String distributorName,
    required String email,
    required int userID,
    required DateTime joinDate,
    required int currentRankId,
    required bool isActive,
  }) : super._(
          id: id,
          distributorName: distributorName,
          email: email,
          userID: userID,
          joinDate: joinDate,
          currentRankId: currentRankId,
          isActive: isActive,
        );

  /// Returns a shallow copy of this [Distributors]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Distributors copyWith({
    Object? id = _Undefined,
    String? distributorName,
    String? email,
    int? userID,
    DateTime? joinDate,
    int? currentRankId,
    bool? isActive,
  }) {
    return Distributors(
      id: id is int? ? id : this.id,
      distributorName: distributorName ?? this.distributorName,
      email: email ?? this.email,
      userID: userID ?? this.userID,
      joinDate: joinDate ?? this.joinDate,
      currentRankId: currentRankId ?? this.currentRankId,
      isActive: isActive ?? this.isActive,
    );
  }
}
