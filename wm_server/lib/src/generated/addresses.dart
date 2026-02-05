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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Addresses
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Addresses._({
    this.id,
    required this.userId,
    required this.label,
    required this.contactName,
    required this.contactPhone,
    required this.street,
    required this.brgy,
    required this.city,
    required this.province,
    required this.postalCode,
    required this.country,
    this.latitude,
    this.longitude,
    required this.isPrimary,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Addresses({
    int? id,
    required int userId,
    required String label,
    required String contactName,
    required String contactPhone,
    required String street,
    required String brgy,
    required String city,
    required String province,
    required String postalCode,
    required String country,
    double? latitude,
    double? longitude,
    required bool isPrimary,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AddressesImpl;

  factory Addresses.fromJson(Map<String, dynamic> jsonSerialization) {
    return Addresses(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      label: jsonSerialization['label'] as String,
      contactName: jsonSerialization['contactName'] as String,
      contactPhone: jsonSerialization['contactPhone'] as String,
      street: jsonSerialization['street'] as String,
      brgy: jsonSerialization['brgy'] as String,
      city: jsonSerialization['city'] as String,
      province: jsonSerialization['province'] as String,
      postalCode: jsonSerialization['postalCode'] as String,
      country: jsonSerialization['country'] as String,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      isPrimary: jsonSerialization['isPrimary'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = AddressesTable();

  static const db = AddressesRepository._();

  @override
  int? id;

  int userId;

  String label;

  String contactName;

  String contactPhone;

  String street;

  String brgy;

  String city;

  String province;

  String postalCode;

  String country;

  double? latitude;

  double? longitude;

  bool isPrimary;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Addresses]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Addresses copyWith({
    int? id,
    int? userId,
    String? label,
    String? contactName,
    String? contactPhone,
    String? street,
    String? brgy,
    String? city,
    String? province,
    String? postalCode,
    String? country,
    double? latitude,
    double? longitude,
    bool? isPrimary,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Addresses',
      if (id != null) 'id': id,
      'userId': userId,
      'label': label,
      'contactName': contactName,
      'contactPhone': contactPhone,
      'street': street,
      'brgy': brgy,
      'city': city,
      'province': province,
      'postalCode': postalCode,
      'country': country,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'isPrimary': isPrimary,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Addresses',
      if (id != null) 'id': id,
      'userId': userId,
      'label': label,
      'contactName': contactName,
      'contactPhone': contactPhone,
      'street': street,
      'brgy': brgy,
      'city': city,
      'province': province,
      'postalCode': postalCode,
      'country': country,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'isPrimary': isPrimary,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static AddressesInclude include() {
    return AddressesInclude._();
  }

  static AddressesIncludeList includeList({
    _i1.WhereExpressionBuilder<AddressesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AddressesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AddressesTable>? orderByList,
    AddressesInclude? include,
  }) {
    return AddressesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Addresses.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Addresses.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AddressesImpl extends Addresses {
  _AddressesImpl({
    int? id,
    required int userId,
    required String label,
    required String contactName,
    required String contactPhone,
    required String street,
    required String brgy,
    required String city,
    required String province,
    required String postalCode,
    required String country,
    double? latitude,
    double? longitude,
    required bool isPrimary,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         label: label,
         contactName: contactName,
         contactPhone: contactPhone,
         street: street,
         brgy: brgy,
         city: city,
         province: province,
         postalCode: postalCode,
         country: country,
         latitude: latitude,
         longitude: longitude,
         isPrimary: isPrimary,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Addresses]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Addresses copyWith({
    Object? id = _Undefined,
    int? userId,
    String? label,
    String? contactName,
    String? contactPhone,
    String? street,
    String? brgy,
    String? city,
    String? province,
    String? postalCode,
    String? country,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    bool? isPrimary,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Addresses(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      label: label ?? this.label,
      contactName: contactName ?? this.contactName,
      contactPhone: contactPhone ?? this.contactPhone,
      street: street ?? this.street,
      brgy: brgy ?? this.brgy,
      city: city ?? this.city,
      province: province ?? this.province,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      isPrimary: isPrimary ?? this.isPrimary,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class AddressesUpdateTable extends _i1.UpdateTable<AddressesTable> {
  AddressesUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> label(String value) => _i1.ColumnValue(
    table.label,
    value,
  );

  _i1.ColumnValue<String, String> contactName(String value) => _i1.ColumnValue(
    table.contactName,
    value,
  );

  _i1.ColumnValue<String, String> contactPhone(String value) => _i1.ColumnValue(
    table.contactPhone,
    value,
  );

  _i1.ColumnValue<String, String> street(String value) => _i1.ColumnValue(
    table.street,
    value,
  );

  _i1.ColumnValue<String, String> brgy(String value) => _i1.ColumnValue(
    table.brgy,
    value,
  );

  _i1.ColumnValue<String, String> city(String value) => _i1.ColumnValue(
    table.city,
    value,
  );

  _i1.ColumnValue<String, String> province(String value) => _i1.ColumnValue(
    table.province,
    value,
  );

  _i1.ColumnValue<String, String> postalCode(String value) => _i1.ColumnValue(
    table.postalCode,
    value,
  );

  _i1.ColumnValue<String, String> country(String value) => _i1.ColumnValue(
    table.country,
    value,
  );

  _i1.ColumnValue<double, double> latitude(double? value) => _i1.ColumnValue(
    table.latitude,
    value,
  );

  _i1.ColumnValue<double, double> longitude(double? value) => _i1.ColumnValue(
    table.longitude,
    value,
  );

  _i1.ColumnValue<bool, bool> isPrimary(bool value) => _i1.ColumnValue(
    table.isPrimary,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class AddressesTable extends _i1.Table<int?> {
  AddressesTable({super.tableRelation}) : super(tableName: 'addresses') {
    updateTable = AddressesUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    label = _i1.ColumnString(
      'label',
      this,
    );
    contactName = _i1.ColumnString(
      'contactName',
      this,
    );
    contactPhone = _i1.ColumnString(
      'contactPhone',
      this,
    );
    street = _i1.ColumnString(
      'street',
      this,
    );
    brgy = _i1.ColumnString(
      'brgy',
      this,
    );
    city = _i1.ColumnString(
      'city',
      this,
    );
    province = _i1.ColumnString(
      'province',
      this,
    );
    postalCode = _i1.ColumnString(
      'postalCode',
      this,
    );
    country = _i1.ColumnString(
      'country',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
    isPrimary = _i1.ColumnBool(
      'isPrimary',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final AddressesUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString label;

  late final _i1.ColumnString contactName;

  late final _i1.ColumnString contactPhone;

  late final _i1.ColumnString street;

  late final _i1.ColumnString brgy;

  late final _i1.ColumnString city;

  late final _i1.ColumnString province;

  late final _i1.ColumnString postalCode;

  late final _i1.ColumnString country;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  late final _i1.ColumnBool isPrimary;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    label,
    contactName,
    contactPhone,
    street,
    brgy,
    city,
    province,
    postalCode,
    country,
    latitude,
    longitude,
    isPrimary,
    createdAt,
    updatedAt,
  ];
}

class AddressesInclude extends _i1.IncludeObject {
  AddressesInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Addresses.t;
}

class AddressesIncludeList extends _i1.IncludeList {
  AddressesIncludeList._({
    _i1.WhereExpressionBuilder<AddressesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Addresses.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Addresses.t;
}

class AddressesRepository {
  const AddressesRepository._();

  /// Returns a list of [Addresses]s matching the given query parameters.
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
  Future<List<Addresses>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AddressesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AddressesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AddressesTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Addresses>(
      where: where?.call(Addresses.t),
      orderBy: orderBy?.call(Addresses.t),
      orderByList: orderByList?.call(Addresses.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Addresses] matching the given query parameters.
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
  Future<Addresses?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AddressesTable>? where,
    int? offset,
    _i1.OrderByBuilder<AddressesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AddressesTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Addresses>(
      where: where?.call(Addresses.t),
      orderBy: orderBy?.call(Addresses.t),
      orderByList: orderByList?.call(Addresses.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Addresses] by its [id] or null if no such row exists.
  Future<Addresses?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Addresses>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Addresses]s in the list and returns the inserted rows.
  ///
  /// The returned [Addresses]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Addresses>> insert(
    _i1.Session session,
    List<Addresses> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Addresses>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Addresses] and returns the inserted row.
  ///
  /// The returned [Addresses] will have its `id` field set.
  Future<Addresses> insertRow(
    _i1.Session session,
    Addresses row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Addresses>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Addresses]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Addresses>> update(
    _i1.Session session,
    List<Addresses> rows, {
    _i1.ColumnSelections<AddressesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Addresses>(
      rows,
      columns: columns?.call(Addresses.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Addresses]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Addresses> updateRow(
    _i1.Session session,
    Addresses row, {
    _i1.ColumnSelections<AddressesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Addresses>(
      row,
      columns: columns?.call(Addresses.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Addresses] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Addresses?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AddressesUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Addresses>(
      id,
      columnValues: columnValues(Addresses.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Addresses]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Addresses>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AddressesUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AddressesTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AddressesTable>? orderBy,
    _i1.OrderByListBuilder<AddressesTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Addresses>(
      columnValues: columnValues(Addresses.t.updateTable),
      where: where(Addresses.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Addresses.t),
      orderByList: orderByList?.call(Addresses.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Addresses]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Addresses>> delete(
    _i1.Session session,
    List<Addresses> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Addresses>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Addresses].
  Future<Addresses> deleteRow(
    _i1.Session session,
    Addresses row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Addresses>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Addresses>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AddressesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Addresses>(
      where: where(Addresses.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AddressesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Addresses>(
      where: where?.call(Addresses.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
