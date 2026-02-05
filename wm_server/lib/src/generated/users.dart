/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'package:wm_server/src/generated/protocol.dart' as _i3;

abstract class User implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = UserTable();

  static const db = UserRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
    };
  }

  static UserInclude include({_i2.UserInfoInclude? userInfo}) {
    return UserInclude._(userInfo: userInfo);
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
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

class UserUpdateTable extends _i1.UpdateTable<UserTable> {
  UserUpdateTable(super.table);

  _i1.ColumnValue<String, String> firstName(String value) => _i1.ColumnValue(
    table.firstName,
    value,
  );

  _i1.ColumnValue<String, String> middleName(String value) => _i1.ColumnValue(
    table.middleName,
    value,
  );

  _i1.ColumnValue<String, String> lastName(String value) => _i1.ColumnValue(
    table.lastName,
    value,
  );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<String, String> phone(String? value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<String, String> passwordHash(String value) => _i1.ColumnValue(
    table.passwordHash,
    value,
  );

  _i1.ColumnValue<String, String> role(String value) => _i1.ColumnValue(
    table.role,
    value,
  );

  _i1.ColumnValue<int, int> referrerId(int? value) => _i1.ColumnValue(
    table.referrerId,
    value,
  );

  _i1.ColumnValue<int, int> level(int value) => _i1.ColumnValue(
    table.level,
    value,
  );

  _i1.ColumnValue<int, int> addressId(int? value) => _i1.ColumnValue(
    table.addressId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> joinDate(DateTime value) =>
      _i1.ColumnValue(
        table.joinDate,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<bool, bool> isPioneer(bool value) => _i1.ColumnValue(
    table.isPioneer,
    value,
  );

  _i1.ColumnValue<int, int> membershipPackageId(int? value) => _i1.ColumnValue(
    table.membershipPackageId,
    value,
  );

  _i1.ColumnValue<double, double> longtitude(double? value) => _i1.ColumnValue(
    table.longtitude,
    value,
  );

  _i1.ColumnValue<double, double> latitude(double? value) => _i1.ColumnValue(
    table.latitude,
    value,
  );

  _i1.ColumnValue<bool, bool> isUpgraded(bool value) => _i1.ColumnValue(
    table.isUpgraded,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> upgradedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.upgradedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastLoginAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastLoginAt,
        value,
      );

  _i1.ColumnValue<int, int> userInfoId(int value) => _i1.ColumnValue(
    table.userInfoId,
    value,
  );
}

class UserTable extends _i1.Table<int?> {
  UserTable({super.tableRelation}) : super(tableName: 'users') {
    updateTable = UserUpdateTable(this);
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    middleName = _i1.ColumnString(
      'middleName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    passwordHash = _i1.ColumnString(
      'passwordHash',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
    referrerId = _i1.ColumnInt(
      'referrerId',
      this,
    );
    level = _i1.ColumnInt(
      'level',
      this,
    );
    addressId = _i1.ColumnInt(
      'addressId',
      this,
    );
    joinDate = _i1.ColumnDateTime(
      'joinDate',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    isPioneer = _i1.ColumnBool(
      'isPioneer',
      this,
    );
    membershipPackageId = _i1.ColumnInt(
      'membershipPackageId',
      this,
    );
    longtitude = _i1.ColumnDouble(
      'longtitude',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    isUpgraded = _i1.ColumnBool(
      'isUpgraded',
      this,
    );
    upgradedAt = _i1.ColumnDateTime(
      'upgradedAt',
      this,
    );
    lastLoginAt = _i1.ColumnDateTime(
      'lastLoginAt',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final UserUpdateTable updateTable;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString middleName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString email;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString passwordHash;

  late final _i1.ColumnString role;

  late final _i1.ColumnInt referrerId;

  late final _i1.ColumnInt level;

  late final _i1.ColumnInt addressId;

  late final _i1.ColumnDateTime joinDate;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isPioneer;

  late final _i1.ColumnInt membershipPackageId;

  late final _i1.ColumnDouble longtitude;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnBool isUpgraded;

  late final _i1.ColumnDateTime upgradedAt;

  late final _i1.ColumnDateTime lastLoginAt;

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: User.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    firstName,
    middleName,
    lastName,
    email,
    phone,
    passwordHash,
    role,
    referrerId,
    level,
    addressId,
    joinDate,
    isActive,
    isPioneer,
    membershipPackageId,
    longtitude,
    latitude,
    isUpgraded,
    upgradedAt,
    lastLoginAt,
    userInfoId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table<int?> get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attachRow = const UserAttachRowRepository._();

  /// Returns a list of [User]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [User] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [User] by its [id] or null if no such row exists.
  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [User]s in the list and returns the inserted rows.
  ///
  /// The returned [User]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [User] and returns the inserted row.
  ///
  /// The returned [User] will have its `id` field set.
  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [User]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<User?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<UserUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<User>(
      id,
      columnValues: columnValues(User.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [User]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<User>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UserTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<User>(
      columnValues: columnValues(User.t.updateTable),
      where: where(User.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [User]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [User].
  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  /// Creates a relation between the given [User] and [UserInfo]
  /// by setting the [User]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    User user,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $user = user.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.userInfoId],
      transaction: transaction,
    );
  }
}
