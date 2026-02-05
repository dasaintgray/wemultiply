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

abstract class GoldenSeatCommission
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GoldenSeatCommission._({
    this.id,
    required this.seatType,
    required this.packageId,
    required this.productId,
    required this.netPerMember,
    required this.netPerBottle,
    required this.commissionAmount,
    required this.createdAt,
  });

  factory GoldenSeatCommission({
    int? id,
    required String seatType,
    required int packageId,
    required int productId,
    required double netPerMember,
    required double netPerBottle,
    required double commissionAmount,
    required DateTime createdAt,
  }) = _GoldenSeatCommissionImpl;

  factory GoldenSeatCommission.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return GoldenSeatCommission(
      id: jsonSerialization['id'] as int?,
      seatType: jsonSerialization['seatType'] as String,
      packageId: jsonSerialization['packageId'] as int,
      productId: jsonSerialization['productId'] as int,
      netPerMember: (jsonSerialization['netPerMember'] as num).toDouble(),
      netPerBottle: (jsonSerialization['netPerBottle'] as num).toDouble(),
      commissionAmount: (jsonSerialization['commissionAmount'] as num)
          .toDouble(),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = GoldenSeatCommissionTable();

  static const db = GoldenSeatCommissionRepository._();

  @override
  int? id;

  String seatType;

  int packageId;

  int productId;

  double netPerMember;

  double netPerBottle;

  double commissionAmount;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GoldenSeatCommission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GoldenSeatCommission copyWith({
    int? id,
    String? seatType,
    int? packageId,
    int? productId,
    double? netPerMember,
    double? netPerBottle,
    double? commissionAmount,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GoldenSeatCommission',
      if (id != null) 'id': id,
      'seatType': seatType,
      'packageId': packageId,
      'productId': productId,
      'netPerMember': netPerMember,
      'netPerBottle': netPerBottle,
      'commissionAmount': commissionAmount,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GoldenSeatCommission',
      if (id != null) 'id': id,
      'seatType': seatType,
      'packageId': packageId,
      'productId': productId,
      'netPerMember': netPerMember,
      'netPerBottle': netPerBottle,
      'commissionAmount': commissionAmount,
      'createdAt': createdAt.toJson(),
    };
  }

  static GoldenSeatCommissionInclude include() {
    return GoldenSeatCommissionInclude._();
  }

  static GoldenSeatCommissionIncludeList includeList({
    _i1.WhereExpressionBuilder<GoldenSeatCommissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GoldenSeatCommissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GoldenSeatCommissionTable>? orderByList,
    GoldenSeatCommissionInclude? include,
  }) {
    return GoldenSeatCommissionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GoldenSeatCommission.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GoldenSeatCommission.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GoldenSeatCommissionImpl extends GoldenSeatCommission {
  _GoldenSeatCommissionImpl({
    int? id,
    required String seatType,
    required int packageId,
    required int productId,
    required double netPerMember,
    required double netPerBottle,
    required double commissionAmount,
    required DateTime createdAt,
  }) : super._(
         id: id,
         seatType: seatType,
         packageId: packageId,
         productId: productId,
         netPerMember: netPerMember,
         netPerBottle: netPerBottle,
         commissionAmount: commissionAmount,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [GoldenSeatCommission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GoldenSeatCommission copyWith({
    Object? id = _Undefined,
    String? seatType,
    int? packageId,
    int? productId,
    double? netPerMember,
    double? netPerBottle,
    double? commissionAmount,
    DateTime? createdAt,
  }) {
    return GoldenSeatCommission(
      id: id is int? ? id : this.id,
      seatType: seatType ?? this.seatType,
      packageId: packageId ?? this.packageId,
      productId: productId ?? this.productId,
      netPerMember: netPerMember ?? this.netPerMember,
      netPerBottle: netPerBottle ?? this.netPerBottle,
      commissionAmount: commissionAmount ?? this.commissionAmount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class GoldenSeatCommissionUpdateTable
    extends _i1.UpdateTable<GoldenSeatCommissionTable> {
  GoldenSeatCommissionUpdateTable(super.table);

  _i1.ColumnValue<String, String> seatType(String value) => _i1.ColumnValue(
    table.seatType,
    value,
  );

  _i1.ColumnValue<int, int> packageId(int value) => _i1.ColumnValue(
    table.packageId,
    value,
  );

  _i1.ColumnValue<int, int> productId(int value) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<double, double> netPerMember(double value) => _i1.ColumnValue(
    table.netPerMember,
    value,
  );

  _i1.ColumnValue<double, double> netPerBottle(double value) => _i1.ColumnValue(
    table.netPerBottle,
    value,
  );

  _i1.ColumnValue<double, double> commissionAmount(double value) =>
      _i1.ColumnValue(
        table.commissionAmount,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class GoldenSeatCommissionTable extends _i1.Table<int?> {
  GoldenSeatCommissionTable({super.tableRelation})
    : super(tableName: 'golden_seat_commissions') {
    updateTable = GoldenSeatCommissionUpdateTable(this);
    seatType = _i1.ColumnString(
      'seatType',
      this,
    );
    packageId = _i1.ColumnInt(
      'packageId',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    netPerMember = _i1.ColumnDouble(
      'netPerMember',
      this,
    );
    netPerBottle = _i1.ColumnDouble(
      'netPerBottle',
      this,
    );
    commissionAmount = _i1.ColumnDouble(
      'commissionAmount',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final GoldenSeatCommissionUpdateTable updateTable;

  late final _i1.ColumnString seatType;

  late final _i1.ColumnInt packageId;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnDouble netPerMember;

  late final _i1.ColumnDouble netPerBottle;

  late final _i1.ColumnDouble commissionAmount;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    seatType,
    packageId,
    productId,
    netPerMember,
    netPerBottle,
    commissionAmount,
    createdAt,
  ];
}

class GoldenSeatCommissionInclude extends _i1.IncludeObject {
  GoldenSeatCommissionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => GoldenSeatCommission.t;
}

class GoldenSeatCommissionIncludeList extends _i1.IncludeList {
  GoldenSeatCommissionIncludeList._({
    _i1.WhereExpressionBuilder<GoldenSeatCommissionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GoldenSeatCommission.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GoldenSeatCommission.t;
}

class GoldenSeatCommissionRepository {
  const GoldenSeatCommissionRepository._();

  /// Returns a list of [GoldenSeatCommission]s matching the given query parameters.
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
  Future<List<GoldenSeatCommission>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoldenSeatCommissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GoldenSeatCommissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GoldenSeatCommissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<GoldenSeatCommission>(
      where: where?.call(GoldenSeatCommission.t),
      orderBy: orderBy?.call(GoldenSeatCommission.t),
      orderByList: orderByList?.call(GoldenSeatCommission.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [GoldenSeatCommission] matching the given query parameters.
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
  Future<GoldenSeatCommission?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoldenSeatCommissionTable>? where,
    int? offset,
    _i1.OrderByBuilder<GoldenSeatCommissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GoldenSeatCommissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<GoldenSeatCommission>(
      where: where?.call(GoldenSeatCommission.t),
      orderBy: orderBy?.call(GoldenSeatCommission.t),
      orderByList: orderByList?.call(GoldenSeatCommission.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [GoldenSeatCommission] by its [id] or null if no such row exists.
  Future<GoldenSeatCommission?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<GoldenSeatCommission>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [GoldenSeatCommission]s in the list and returns the inserted rows.
  ///
  /// The returned [GoldenSeatCommission]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GoldenSeatCommission>> insert(
    _i1.Session session,
    List<GoldenSeatCommission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GoldenSeatCommission>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GoldenSeatCommission] and returns the inserted row.
  ///
  /// The returned [GoldenSeatCommission] will have its `id` field set.
  Future<GoldenSeatCommission> insertRow(
    _i1.Session session,
    GoldenSeatCommission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GoldenSeatCommission>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GoldenSeatCommission]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GoldenSeatCommission>> update(
    _i1.Session session,
    List<GoldenSeatCommission> rows, {
    _i1.ColumnSelections<GoldenSeatCommissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GoldenSeatCommission>(
      rows,
      columns: columns?.call(GoldenSeatCommission.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GoldenSeatCommission]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GoldenSeatCommission> updateRow(
    _i1.Session session,
    GoldenSeatCommission row, {
    _i1.ColumnSelections<GoldenSeatCommissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GoldenSeatCommission>(
      row,
      columns: columns?.call(GoldenSeatCommission.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GoldenSeatCommission] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<GoldenSeatCommission?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<GoldenSeatCommissionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<GoldenSeatCommission>(
      id,
      columnValues: columnValues(GoldenSeatCommission.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [GoldenSeatCommission]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<GoldenSeatCommission>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<GoldenSeatCommissionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<GoldenSeatCommissionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GoldenSeatCommissionTable>? orderBy,
    _i1.OrderByListBuilder<GoldenSeatCommissionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<GoldenSeatCommission>(
      columnValues: columnValues(GoldenSeatCommission.t.updateTable),
      where: where(GoldenSeatCommission.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GoldenSeatCommission.t),
      orderByList: orderByList?.call(GoldenSeatCommission.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [GoldenSeatCommission]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GoldenSeatCommission>> delete(
    _i1.Session session,
    List<GoldenSeatCommission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GoldenSeatCommission>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GoldenSeatCommission].
  Future<GoldenSeatCommission> deleteRow(
    _i1.Session session,
    GoldenSeatCommission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GoldenSeatCommission>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GoldenSeatCommission>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GoldenSeatCommissionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GoldenSeatCommission>(
      where: where(GoldenSeatCommission.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoldenSeatCommissionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GoldenSeatCommission>(
      where: where?.call(GoldenSeatCommission.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
