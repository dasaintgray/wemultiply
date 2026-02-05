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

abstract class UserInfo implements _i1.SerializableModel {
  UserInfo._({
    required this.id,
    required this.userIdentifier,
    required this.userName,
    required this.fullName,
    required this.email,
    required this.createdAt,
    required this.imageUrl,
    required this.blocked,
  });

  factory UserInfo({
    required int id,
    required String userIdentifier,
    required String userName,
    required String fullName,
    required String email,
    required DateTime createdAt,
    required String imageUrl,
    required bool blocked,
  }) = _UserInfoImpl;

  factory UserInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserInfo(
      id: jsonSerialization['id'] as int,
      userIdentifier: jsonSerialization['userIdentifier'] as String,
      userName: jsonSerialization['userName'] as String,
      fullName: jsonSerialization['fullName'] as String,
      email: jsonSerialization['email'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      imageUrl: jsonSerialization['imageUrl'] as String,
      blocked: jsonSerialization['blocked'] as bool,
    );
  }

  int id;

  String userIdentifier;

  String userName;

  String fullName;

  String email;

  DateTime createdAt;

  String imageUrl;

  bool blocked;

  /// Returns a shallow copy of this [UserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserInfo copyWith({
    int? id,
    String? userIdentifier,
    String? userName,
    String? fullName,
    String? email,
    DateTime? createdAt,
    String? imageUrl,
    bool? blocked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserInfo',
      'id': id,
      'userIdentifier': userIdentifier,
      'userName': userName,
      'fullName': fullName,
      'email': email,
      'createdAt': createdAt.toJson(),
      'imageUrl': imageUrl,
      'blocked': blocked,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserInfoImpl extends UserInfo {
  _UserInfoImpl({
    required int id,
    required String userIdentifier,
    required String userName,
    required String fullName,
    required String email,
    required DateTime createdAt,
    required String imageUrl,
    required bool blocked,
  }) : super._(
         id: id,
         userIdentifier: userIdentifier,
         userName: userName,
         fullName: fullName,
         email: email,
         createdAt: createdAt,
         imageUrl: imageUrl,
         blocked: blocked,
       );

  /// Returns a shallow copy of this [UserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserInfo copyWith({
    int? id,
    String? userIdentifier,
    String? userName,
    String? fullName,
    String? email,
    DateTime? createdAt,
    String? imageUrl,
    bool? blocked,
  }) {
    return UserInfo(
      id: id ?? this.id,
      userIdentifier: userIdentifier ?? this.userIdentifier,
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
      blocked: blocked ?? this.blocked,
    );
  }
}
