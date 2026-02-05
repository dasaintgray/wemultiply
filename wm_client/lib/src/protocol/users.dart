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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'package:wm_client/src/protocol/protocol.dart' as _i3;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.passwordHash,
    required this.role,
    this.referrerId,
    required this.level,
    this.addressId,
    required this.joinDate,
    required this.isActive,
    required this.isPioneer,
    this.membershipPackageId,
    this.longtitude,
    this.latitude,
    required this.isUpgraded,
    this.upgradedAt,
    this.lastLoginAt,
    required this.userInfoId,
    this.userInfo,
  });

  factory User({
    int? id,
    required String firstName,
    required String middleName,
    required String lastName,
    required String email,
    String? phone,
    required String passwordHash,
    required String role,
    int? referrerId,
    required int level,
    int? addressId,
    required DateTime joinDate,
    required bool isActive,
    required bool isPioneer,
    int? membershipPackageId,
    double? longtitude,
    double? latitude,
    required bool isUpgraded,
    DateTime? upgradedAt,
    DateTime? lastLoginAt,
    required int userInfoId,
    _i2.UserInfo? userInfo,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      firstName: jsonSerialization['firstName'] as String,
      middleName: jsonSerialization['middleName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      email: jsonSerialization['email'] as String,
      phone: jsonSerialization['phone'] as String?,
      passwordHash: jsonSerialization['passwordHash'] as String,
      role: jsonSerialization['role'] as String,
      referrerId: jsonSerialization['referrerId'] as int?,
      level: jsonSerialization['level'] as int,
      addressId: jsonSerialization['addressId'] as int?,
      joinDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['joinDate'],
      ),
      isActive: jsonSerialization['isActive'] as bool,
      isPioneer: jsonSerialization['isPioneer'] as bool,
      membershipPackageId: jsonSerialization['membershipPackageId'] as int?,
      longtitude: (jsonSerialization['longtitude'] as num?)?.toDouble(),
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      isUpgraded: jsonSerialization['isUpgraded'] as bool,
      upgradedAt: jsonSerialization['upgradedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['upgradedAt']),
      lastLoginAt: jsonSerialization['lastLoginAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastLoginAt'],
            ),
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.UserInfo>(
              jsonSerialization['userInfo'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String firstName;

  String middleName;

  String lastName;

  String email;

  String? phone;

  String passwordHash;

  String role;

  int? referrerId;

  int level;

  int? addressId;

  DateTime joinDate;

  bool isActive;

  bool isPioneer;

  int? membershipPackageId;

  double? longtitude;

  double? latitude;

  bool isUpgraded;

  DateTime? upgradedAt;

  DateTime? lastLoginAt;

  int userInfoId;

  _i2.UserInfo? userInfo;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    String? phone,
    String? passwordHash,
    String? role,
    int? referrerId,
    int? level,
    int? addressId,
    DateTime? joinDate,
    bool? isActive,
    bool? isPioneer,
    int? membershipPackageId,
    double? longtitude,
    double? latitude,
    bool? isUpgraded,
    DateTime? upgradedAt,
    DateTime? lastLoginAt,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'email': email,
      if (phone != null) 'phone': phone,
      'passwordHash': passwordHash,
      'role': role,
      if (referrerId != null) 'referrerId': referrerId,
      'level': level,
      if (addressId != null) 'addressId': addressId,
      'joinDate': joinDate.toJson(),
      'isActive': isActive,
      'isPioneer': isPioneer,
      if (membershipPackageId != null)
        'membershipPackageId': membershipPackageId,
      if (longtitude != null) 'longtitude': longtitude,
      if (latitude != null) 'latitude': latitude,
      'isUpgraded': isUpgraded,
      if (upgradedAt != null) 'upgradedAt': upgradedAt?.toJson(),
      if (lastLoginAt != null) 'lastLoginAt': lastLoginAt?.toJson(),
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String firstName,
    required String middleName,
    required String lastName,
    required String email,
    String? phone,
    required String passwordHash,
    required String role,
    int? referrerId,
    required int level,
    int? addressId,
    required DateTime joinDate,
    required bool isActive,
    required bool isPioneer,
    int? membershipPackageId,
    double? longtitude,
    double? latitude,
    required bool isUpgraded,
    DateTime? upgradedAt,
    DateTime? lastLoginAt,
    required int userInfoId,
    _i2.UserInfo? userInfo,
  }) : super._(
         id: id,
         firstName: firstName,
         middleName: middleName,
         lastName: lastName,
         email: email,
         phone: phone,
         passwordHash: passwordHash,
         role: role,
         referrerId: referrerId,
         level: level,
         addressId: addressId,
         joinDate: joinDate,
         isActive: isActive,
         isPioneer: isPioneer,
         membershipPackageId: membershipPackageId,
         longtitude: longtitude,
         latitude: latitude,
         isUpgraded: isUpgraded,
         upgradedAt: upgradedAt,
         lastLoginAt: lastLoginAt,
         userInfoId: userInfoId,
         userInfo: userInfo,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    Object? phone = _Undefined,
    String? passwordHash,
    String? role,
    Object? referrerId = _Undefined,
    int? level,
    Object? addressId = _Undefined,
    DateTime? joinDate,
    bool? isActive,
    bool? isPioneer,
    Object? membershipPackageId = _Undefined,
    Object? longtitude = _Undefined,
    Object? latitude = _Undefined,
    bool? isUpgraded,
    Object? upgradedAt = _Undefined,
    Object? lastLoginAt = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone is String? ? phone : this.phone,
      passwordHash: passwordHash ?? this.passwordHash,
      role: role ?? this.role,
      referrerId: referrerId is int? ? referrerId : this.referrerId,
      level: level ?? this.level,
      addressId: addressId is int? ? addressId : this.addressId,
      joinDate: joinDate ?? this.joinDate,
      isActive: isActive ?? this.isActive,
      isPioneer: isPioneer ?? this.isPioneer,
      membershipPackageId: membershipPackageId is int?
          ? membershipPackageId
          : this.membershipPackageId,
      longtitude: longtitude is double? ? longtitude : this.longtitude,
      latitude: latitude is double? ? latitude : this.latitude,
      isUpgraded: isUpgraded ?? this.isUpgraded,
      upgradedAt: upgradedAt is DateTime? ? upgradedAt : this.upgradedAt,
      lastLoginAt: lastLoginAt is DateTime? ? lastLoginAt : this.lastLoginAt,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo: userInfo is _i2.UserInfo?
          ? userInfo
          : this.userInfo?.copyWith(),
    );
  }
}
