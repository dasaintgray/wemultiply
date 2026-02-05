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

abstract class GoldenSeats
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GoldenSeats._({
    this.id,
    required this.seatType,
    required this.territory,
    required this.ownerId,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });

  factory GoldenSeats({
    int? id,
    required String seatType,
    required String territory,
    required int ownerId,
    required double price,
    required DateTime startDate,
    required DateTime endDate,
    required bool isActive,
  }) = _GoldenSeatsImpl;

  factory GoldenSeats.fromJson(Map<String, dynamic> jsonSerialization) {
    return GoldenSeats(
      id: jsonSerialization['id'] as int?,
      seatType: jsonSerialization['seatType'] as String,
      territory: jsonSerialization['territory'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      price: (jsonSerialization['price'] as num).toDouble(),
      startDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startDate'],
      ),
      endDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      isActive: jsonSerialization['isActive'] as bool,
    );
  }

  static final t = GoldenSeatsTable();

  static const db = GoldenSeatsRepository._();

  @override
  int? id;

  String seatType;

  String territory;

  int ownerId;

  double price;

  DateTime startDate;

  DateTime endDate;

  bool isActive;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GoldenSeats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GoldenSeats copyWith({
    int? id,
    String? seatType,
    String? territory,
    int? ownerId,
    double? price,
    DateTime? startDate,
    DateTime? endDate,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GoldenSeats',
      if (id != null) 'id': id,
      'seatType': seatType,
      'territory': territory,
      'ownerId': ownerId,
      'price': price,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'isActive': isActive,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GoldenSeats',
      if (id != null) 'id': id,
      'seatType': seatType,
      'territory': territory,
      'ownerId': ownerId,
      'price': price,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'isActive': isActive,
    };
  }

  static GoldenSeatsInclude include() {
    return GoldenSeatsInclude._();
  }

  static GoldenSeatsIncludeList includeList({
    _i1.WhereExpressionBuilder<GoldenSeatsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GoldenSeatsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GoldenSeatsTable>? orderByList,
    GoldenSeatsInclude? include,
  }) {
    return GoldenSeatsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GoldenSeats.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GoldenSeats.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GoldenSeatsImpl extends GoldenSeats {
  _GoldenSeatsImpl({
    int? id,
    required String seatType,
    required String territory,
    required int ownerId,
    required double price,
    required DateTime startDate,
    required DateTime endDate,
    required bool isActive,
  }) : super._(
         id: id,
         seatType: seatType,
         territory: territory,
         ownerId: ownerId,
         price: price,
         startDate: startDate,
         endDate: endDate,
         isActive: isActive,
       );

  /// Returns a shallow copy of this [GoldenSeats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GoldenSeats copyWith({
    Object? id = _Undefined,
    String? seatType,
    String? territory,
    int? ownerId,
    double? price,
    DateTime? startDate,
    DateTime? endDate,
    bool? isActive,
  }) {
    return GoldenSeats(
      id: id is int? ? id : this.id,
      seatType: seatType ?? this.seatType,
      territory: territory ?? this.territory,
      ownerId: ownerId ?? this.ownerId,
      price: price ?? this.price,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
    );
  }
}

class GoldenSeatsUpdateTable extends _i1.UpdateTable<GoldenSeatsTable> {
  GoldenSeatsUpdateTable(super.table);

  _i1.ColumnValue<String, String> seatType(String value) => _i1.ColumnValue(
    table.seatType,
    value,
  );

  _i1.ColumnValue<String, String> territory(String value) => _i1.ColumnValue(
    table.territory,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> startDate(DateTime value) =>
      _i1.ColumnValue(
        table.startDate,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> endDate(DateTime value) =>
      _i1.ColumnValue(
        table.endDate,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );
}

class GoldenSeatsTable extends _i1.Table<int?> {
  GoldenSeatsTable({super.tableRelation}) : super(tableName: 'golden_seats') {
    updateTable = GoldenSeatsUpdateTable(this);
    seatType = _i1.ColumnString(
      'seatType',
      this,
    );
    territory = _i1.ColumnString(
      'territory',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    startDate = _i1.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _i1.ColumnDateTime(
      'endDate',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
  }

  late final GoldenSeatsUpdateTable updateTable;

  late final _i1.ColumnString seatType;

  late final _i1.ColumnString territory;

  late final _i1.ColumnInt ownerId;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnDateTime startDate;

  late final _i1.ColumnDateTime endDate;

  late final _i1.ColumnBool isActive;

  @override
  List<_i1.Column> get columns => [
    id,
    seatType,
    territory,
    ownerId,
    price,
    startDate,
    endDate,
    isActive,
  ];
}

class GoldenSeatsInclude extends _i1.IncludeObject {
  GoldenSeatsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => GoldenSeats.t;
}

class GoldenSeatsIncludeList extends _i1.IncludeList {
  GoldenSeatsIncludeList._({
    _i1.WhereExpressionBuilder<GoldenSeatsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GoldenSeats.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GoldenSeats.t;
}

class GoldenSeatsRepository {
  const GoldenSeatsRepository._();

  /// Returns a list of [GoldenSeats]s matching the given query parameters.
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
  Future<List<GoldenSeats>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoldenSeatsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GoldenSeatsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GoldenSeatsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<GoldenSeats>(
      where: where?.call(GoldenSeats.t),
      orderBy: orderBy?.call(GoldenSeats.t),
      orderByList: orderByList?.call(GoldenSeats.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [GoldenSeats] matching the given query parameters.
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
  Future<GoldenSeats?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoldenSeatsTable>? where,
    int? offset,
    _i1.OrderByBuilder<GoldenSeatsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GoldenSeatsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<GoldenSeats>(
      where: where?.call(GoldenSeats.t),
      orderBy: orderBy?.call(GoldenSeats.t),
      orderByList: orderByList?.call(GoldenSeats.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [GoldenSeats] by its [id] or null if no such row exists.
  Future<GoldenSeats?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<GoldenSeats>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [GoldenSeats]s in the list and returns the inserted rows.
  ///
  /// The returned [GoldenSeats]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GoldenSeats>> insert(
    _i1.Session session,
    List<GoldenSeats> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GoldenSeats>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GoldenSeats] and returns the inserted row.
  ///
  /// The returned [GoldenSeats] will have its `id` field set.
  Future<GoldenSeats> insertRow(
    _i1.Session session,
    GoldenSeats row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GoldenSeats>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GoldenSeats]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GoldenSeats>> update(
    _i1.Session session,
    List<GoldenSeats> rows, {
    _i1.ColumnSelections<GoldenSeatsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GoldenSeats>(
      rows,
      columns: columns?.call(GoldenSeats.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GoldenSeats]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GoldenSeats> updateRow(
    _i1.Session session,
    GoldenSeats row, {
    _i1.ColumnSelections<GoldenSeatsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GoldenSeats>(
      row,
      columns: columns?.call(GoldenSeats.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GoldenSeats] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<GoldenSeats?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<GoldenSeatsUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<GoldenSeats>(
      id,
      columnValues: columnValues(GoldenSeats.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [GoldenSeats]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<GoldenSeats>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<GoldenSeatsUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<GoldenSeatsTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GoldenSeatsTable>? orderBy,
    _i1.OrderByListBuilder<GoldenSeatsTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<GoldenSeats>(
      columnValues: columnValues(GoldenSeats.t.updateTable),
      where: where(GoldenSeats.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GoldenSeats.t),
      orderByList: orderByList?.call(GoldenSeats.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [GoldenSeats]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GoldenSeats>> delete(
    _i1.Session session,
    List<GoldenSeats> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GoldenSeats>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GoldenSeats].
  Future<GoldenSeats> deleteRow(
    _i1.Session session,
    GoldenSeats row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GoldenSeats>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GoldenSeats>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GoldenSeatsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GoldenSeats>(
      where: where(GoldenSeats.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoldenSeatsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GoldenSeats>(
      where: where?.call(GoldenSeats.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
