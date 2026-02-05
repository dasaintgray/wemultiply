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

abstract class CommissionRule
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CommissionRule._({
    this.id,
    required this.rankId,
    required this.level,
    required this.commissionRate,
    required this.commissionType,
  });

  factory CommissionRule({
    int? id,
    required int rankId,
    required int level,
    required double commissionRate,
    required String commissionType,
  }) = _CommissionRuleImpl;

  factory CommissionRule.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommissionRule(
      id: jsonSerialization['id'] as int?,
      rankId: jsonSerialization['rankId'] as int,
      level: jsonSerialization['level'] as int,
      commissionRate: (jsonSerialization['commissionRate'] as num).toDouble(),
      commissionType: jsonSerialization['commissionType'] as String,
    );
  }

  static final t = CommissionRuleTable();

  static const db = CommissionRuleRepository._();

  @override
  int? id;

  int rankId;

  int level;

  double commissionRate;

  String commissionType;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CommissionRule]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CommissionRule copyWith({
    int? id,
    int? rankId,
    int? level,
    double? commissionRate,
    String? commissionType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommissionRule',
      if (id != null) 'id': id,
      'rankId': rankId,
      'level': level,
      'commissionRate': commissionRate,
      'commissionType': commissionType,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommissionRule',
      if (id != null) 'id': id,
      'rankId': rankId,
      'level': level,
      'commissionRate': commissionRate,
      'commissionType': commissionType,
    };
  }

  static CommissionRuleInclude include() {
    return CommissionRuleInclude._();
  }

  static CommissionRuleIncludeList includeList({
    _i1.WhereExpressionBuilder<CommissionRuleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommissionRuleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommissionRuleTable>? orderByList,
    CommissionRuleInclude? include,
  }) {
    return CommissionRuleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommissionRule.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CommissionRule.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommissionRuleImpl extends CommissionRule {
  _CommissionRuleImpl({
    int? id,
    required int rankId,
    required int level,
    required double commissionRate,
    required String commissionType,
  }) : super._(
         id: id,
         rankId: rankId,
         level: level,
         commissionRate: commissionRate,
         commissionType: commissionType,
       );

  /// Returns a shallow copy of this [CommissionRule]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CommissionRule copyWith({
    Object? id = _Undefined,
    int? rankId,
    int? level,
    double? commissionRate,
    String? commissionType,
  }) {
    return CommissionRule(
      id: id is int? ? id : this.id,
      rankId: rankId ?? this.rankId,
      level: level ?? this.level,
      commissionRate: commissionRate ?? this.commissionRate,
      commissionType: commissionType ?? this.commissionType,
    );
  }
}

class CommissionRuleUpdateTable extends _i1.UpdateTable<CommissionRuleTable> {
  CommissionRuleUpdateTable(super.table);

  _i1.ColumnValue<int, int> rankId(int value) => _i1.ColumnValue(
    table.rankId,
    value,
  );

  _i1.ColumnValue<int, int> level(int value) => _i1.ColumnValue(
    table.level,
    value,
  );

  _i1.ColumnValue<double, double> commissionRate(double value) =>
      _i1.ColumnValue(
        table.commissionRate,
        value,
      );

  _i1.ColumnValue<String, String> commissionType(String value) =>
      _i1.ColumnValue(
        table.commissionType,
        value,
      );
}

class CommissionRuleTable extends _i1.Table<int?> {
  CommissionRuleTable({super.tableRelation})
    : super(tableName: 'commission_rules') {
    updateTable = CommissionRuleUpdateTable(this);
    rankId = _i1.ColumnInt(
      'rankId',
      this,
    );
    level = _i1.ColumnInt(
      'level',
      this,
    );
    commissionRate = _i1.ColumnDouble(
      'commissionRate',
      this,
    );
    commissionType = _i1.ColumnString(
      'commissionType',
      this,
    );
  }

  late final CommissionRuleUpdateTable updateTable;

  late final _i1.ColumnInt rankId;

  late final _i1.ColumnInt level;

  late final _i1.ColumnDouble commissionRate;

  late final _i1.ColumnString commissionType;

  @override
  List<_i1.Column> get columns => [
    id,
    rankId,
    level,
    commissionRate,
    commissionType,
  ];
}

class CommissionRuleInclude extends _i1.IncludeObject {
  CommissionRuleInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CommissionRule.t;
}

class CommissionRuleIncludeList extends _i1.IncludeList {
  CommissionRuleIncludeList._({
    _i1.WhereExpressionBuilder<CommissionRuleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CommissionRule.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CommissionRule.t;
}

class CommissionRuleRepository {
  const CommissionRuleRepository._();

  /// Returns a list of [CommissionRule]s matching the given query parameters.
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
  Future<List<CommissionRule>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommissionRuleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommissionRuleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommissionRuleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CommissionRule>(
      where: where?.call(CommissionRule.t),
      orderBy: orderBy?.call(CommissionRule.t),
      orderByList: orderByList?.call(CommissionRule.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CommissionRule] matching the given query parameters.
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
  Future<CommissionRule?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommissionRuleTable>? where,
    int? offset,
    _i1.OrderByBuilder<CommissionRuleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommissionRuleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CommissionRule>(
      where: where?.call(CommissionRule.t),
      orderBy: orderBy?.call(CommissionRule.t),
      orderByList: orderByList?.call(CommissionRule.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CommissionRule] by its [id] or null if no such row exists.
  Future<CommissionRule?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CommissionRule>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CommissionRule]s in the list and returns the inserted rows.
  ///
  /// The returned [CommissionRule]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CommissionRule>> insert(
    _i1.Session session,
    List<CommissionRule> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CommissionRule>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CommissionRule] and returns the inserted row.
  ///
  /// The returned [CommissionRule] will have its `id` field set.
  Future<CommissionRule> insertRow(
    _i1.Session session,
    CommissionRule row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CommissionRule>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CommissionRule]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CommissionRule>> update(
    _i1.Session session,
    List<CommissionRule> rows, {
    _i1.ColumnSelections<CommissionRuleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CommissionRule>(
      rows,
      columns: columns?.call(CommissionRule.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommissionRule]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CommissionRule> updateRow(
    _i1.Session session,
    CommissionRule row, {
    _i1.ColumnSelections<CommissionRuleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CommissionRule>(
      row,
      columns: columns?.call(CommissionRule.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommissionRule] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CommissionRule?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CommissionRuleUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CommissionRule>(
      id,
      columnValues: columnValues(CommissionRule.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CommissionRule]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CommissionRule>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CommissionRuleUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CommissionRuleTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommissionRuleTable>? orderBy,
    _i1.OrderByListBuilder<CommissionRuleTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CommissionRule>(
      columnValues: columnValues(CommissionRule.t.updateTable),
      where: where(CommissionRule.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommissionRule.t),
      orderByList: orderByList?.call(CommissionRule.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CommissionRule]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CommissionRule>> delete(
    _i1.Session session,
    List<CommissionRule> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CommissionRule>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CommissionRule].
  Future<CommissionRule> deleteRow(
    _i1.Session session,
    CommissionRule row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CommissionRule>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CommissionRule>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CommissionRuleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CommissionRule>(
      where: where(CommissionRule.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommissionRuleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CommissionRule>(
      where: where?.call(CommissionRule.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
