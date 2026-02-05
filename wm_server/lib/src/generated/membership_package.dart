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

abstract class MembershipPackage
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MembershipPackage._({
    this.id,
    required this.name,
    required this.price,
    required this.bottlesIncluded,
    this.cashback,
    this.description,
  });

  factory MembershipPackage({
    int? id,
    required String name,
    required double price,
    required int bottlesIncluded,
    double? cashback,
    String? description,
  }) = _MembershipPackageImpl;

  factory MembershipPackage.fromJson(Map<String, dynamic> jsonSerialization) {
    return MembershipPackage(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      bottlesIncluded: jsonSerialization['bottlesIncluded'] as int,
      cashback: (jsonSerialization['cashback'] as num?)?.toDouble(),
      description: jsonSerialization['description'] as String?,
    );
  }

  static final t = MembershipPackageTable();

  static const db = MembershipPackageRepository._();

  @override
  int? id;

  String name;

  double price;

  int bottlesIncluded;

  double? cashback;

  String? description;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MembershipPackage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MembershipPackage copyWith({
    int? id,
    String? name,
    double? price,
    int? bottlesIncluded,
    double? cashback,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MembershipPackage',
      if (id != null) 'id': id,
      'name': name,
      'price': price,
      'bottlesIncluded': bottlesIncluded,
      if (cashback != null) 'cashback': cashback,
      if (description != null) 'description': description,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MembershipPackage',
      if (id != null) 'id': id,
      'name': name,
      'price': price,
      'bottlesIncluded': bottlesIncluded,
      if (cashback != null) 'cashback': cashback,
      if (description != null) 'description': description,
    };
  }

  static MembershipPackageInclude include() {
    return MembershipPackageInclude._();
  }

  static MembershipPackageIncludeList includeList({
    _i1.WhereExpressionBuilder<MembershipPackageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MembershipPackageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MembershipPackageTable>? orderByList,
    MembershipPackageInclude? include,
  }) {
    return MembershipPackageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MembershipPackage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MembershipPackage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MembershipPackageImpl extends MembershipPackage {
  _MembershipPackageImpl({
    int? id,
    required String name,
    required double price,
    required int bottlesIncluded,
    double? cashback,
    String? description,
  }) : super._(
         id: id,
         name: name,
         price: price,
         bottlesIncluded: bottlesIncluded,
         cashback: cashback,
         description: description,
       );

  /// Returns a shallow copy of this [MembershipPackage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MembershipPackage copyWith({
    Object? id = _Undefined,
    String? name,
    double? price,
    int? bottlesIncluded,
    Object? cashback = _Undefined,
    Object? description = _Undefined,
  }) {
    return MembershipPackage(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      bottlesIncluded: bottlesIncluded ?? this.bottlesIncluded,
      cashback: cashback is double? ? cashback : this.cashback,
      description: description is String? ? description : this.description,
    );
  }
}

class MembershipPackageUpdateTable
    extends _i1.UpdateTable<MembershipPackageTable> {
  MembershipPackageUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );

  _i1.ColumnValue<int, int> bottlesIncluded(int value) => _i1.ColumnValue(
    table.bottlesIncluded,
    value,
  );

  _i1.ColumnValue<double, double> cashback(double? value) => _i1.ColumnValue(
    table.cashback,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );
}

class MembershipPackageTable extends _i1.Table<int?> {
  MembershipPackageTable({super.tableRelation})
    : super(tableName: 'membership_packages') {
    updateTable = MembershipPackageUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    bottlesIncluded = _i1.ColumnInt(
      'bottlesIncluded',
      this,
    );
    cashback = _i1.ColumnDouble(
      'cashback',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
  }

  late final MembershipPackageUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnInt bottlesIncluded;

  late final _i1.ColumnDouble cashback;

  late final _i1.ColumnString description;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    price,
    bottlesIncluded,
    cashback,
    description,
  ];
}

class MembershipPackageInclude extends _i1.IncludeObject {
  MembershipPackageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MembershipPackage.t;
}

class MembershipPackageIncludeList extends _i1.IncludeList {
  MembershipPackageIncludeList._({
    _i1.WhereExpressionBuilder<MembershipPackageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MembershipPackage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MembershipPackage.t;
}

class MembershipPackageRepository {
  const MembershipPackageRepository._();

  /// Returns a list of [MembershipPackage]s matching the given query parameters.
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
  Future<List<MembershipPackage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MembershipPackageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MembershipPackageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MembershipPackageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MembershipPackage>(
      where: where?.call(MembershipPackage.t),
      orderBy: orderBy?.call(MembershipPackage.t),
      orderByList: orderByList?.call(MembershipPackage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MembershipPackage] matching the given query parameters.
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
  Future<MembershipPackage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MembershipPackageTable>? where,
    int? offset,
    _i1.OrderByBuilder<MembershipPackageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MembershipPackageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MembershipPackage>(
      where: where?.call(MembershipPackage.t),
      orderBy: orderBy?.call(MembershipPackage.t),
      orderByList: orderByList?.call(MembershipPackage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MembershipPackage] by its [id] or null if no such row exists.
  Future<MembershipPackage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MembershipPackage>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MembershipPackage]s in the list and returns the inserted rows.
  ///
  /// The returned [MembershipPackage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MembershipPackage>> insert(
    _i1.Session session,
    List<MembershipPackage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MembershipPackage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MembershipPackage] and returns the inserted row.
  ///
  /// The returned [MembershipPackage] will have its `id` field set.
  Future<MembershipPackage> insertRow(
    _i1.Session session,
    MembershipPackage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MembershipPackage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MembershipPackage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MembershipPackage>> update(
    _i1.Session session,
    List<MembershipPackage> rows, {
    _i1.ColumnSelections<MembershipPackageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MembershipPackage>(
      rows,
      columns: columns?.call(MembershipPackage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MembershipPackage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MembershipPackage> updateRow(
    _i1.Session session,
    MembershipPackage row, {
    _i1.ColumnSelections<MembershipPackageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MembershipPackage>(
      row,
      columns: columns?.call(MembershipPackage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MembershipPackage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MembershipPackage?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MembershipPackageUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MembershipPackage>(
      id,
      columnValues: columnValues(MembershipPackage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MembershipPackage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MembershipPackage>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MembershipPackageUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<MembershipPackageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MembershipPackageTable>? orderBy,
    _i1.OrderByListBuilder<MembershipPackageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MembershipPackage>(
      columnValues: columnValues(MembershipPackage.t.updateTable),
      where: where(MembershipPackage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MembershipPackage.t),
      orderByList: orderByList?.call(MembershipPackage.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MembershipPackage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MembershipPackage>> delete(
    _i1.Session session,
    List<MembershipPackage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MembershipPackage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MembershipPackage].
  Future<MembershipPackage> deleteRow(
    _i1.Session session,
    MembershipPackage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MembershipPackage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MembershipPackage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MembershipPackageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MembershipPackage>(
      where: where(MembershipPackage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MembershipPackageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MembershipPackage>(
      where: where?.call(MembershipPackage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
