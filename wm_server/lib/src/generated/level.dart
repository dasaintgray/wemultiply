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

abstract class Level implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Level._({
    this.id,
    required this.levelName,
    this.description,
    required this.isActive,
    required this.createdAt,
  });

  factory Level({
    int? id,
    required String levelName,
    String? description,
    required bool isActive,
    required DateTime createdAt,
  }) = _LevelImpl;

  factory Level.fromJson(Map<String, dynamic> jsonSerialization) {
    return Level(
      id: jsonSerialization['id'] as int?,
      levelName: jsonSerialization['levelName'] as String,
      description: jsonSerialization['description'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = LevelTable();

  static const db = LevelRepository._();

  @override
  int? id;

  String levelName;

  String? description;

  bool isActive;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Level]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Level copyWith({
    int? id,
    String? levelName,
    String? description,
    bool? isActive,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Level',
      if (id != null) 'id': id,
      'levelName': levelName,
      if (description != null) 'description': description,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Level',
      if (id != null) 'id': id,
      'levelName': levelName,
      if (description != null) 'description': description,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  static LevelInclude include() {
    return LevelInclude._();
  }

  static LevelIncludeList includeList({
    _i1.WhereExpressionBuilder<LevelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LevelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LevelTable>? orderByList,
    LevelInclude? include,
  }) {
    return LevelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Level.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Level.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LevelImpl extends Level {
  _LevelImpl({
    int? id,
    required String levelName,
    String? description,
    required bool isActive,
    required DateTime createdAt,
  }) : super._(
         id: id,
         levelName: levelName,
         description: description,
         isActive: isActive,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Level]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Level copyWith({
    Object? id = _Undefined,
    String? levelName,
    Object? description = _Undefined,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return Level(
      id: id is int? ? id : this.id,
      levelName: levelName ?? this.levelName,
      description: description is String? ? description : this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class LevelUpdateTable extends _i1.UpdateTable<LevelTable> {
  LevelUpdateTable(super.table);

  _i1.ColumnValue<String, String> levelName(String value) => _i1.ColumnValue(
    table.levelName,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class LevelTable extends _i1.Table<int?> {
  LevelTable({super.tableRelation}) : super(tableName: 'levels') {
    updateTable = LevelUpdateTable(this);
    levelName = _i1.ColumnString(
      'levelName',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final LevelUpdateTable updateTable;

  late final _i1.ColumnString levelName;

  late final _i1.ColumnString description;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    levelName,
    description,
    isActive,
    createdAt,
  ];
}

class LevelInclude extends _i1.IncludeObject {
  LevelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Level.t;
}

class LevelIncludeList extends _i1.IncludeList {
  LevelIncludeList._({
    _i1.WhereExpressionBuilder<LevelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Level.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Level.t;
}

class LevelRepository {
  const LevelRepository._();

  /// Returns a list of [Level]s matching the given query parameters.
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
  Future<List<Level>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LevelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LevelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LevelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Level>(
      where: where?.call(Level.t),
      orderBy: orderBy?.call(Level.t),
      orderByList: orderByList?.call(Level.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Level] matching the given query parameters.
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
  Future<Level?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LevelTable>? where,
    int? offset,
    _i1.OrderByBuilder<LevelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LevelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Level>(
      where: where?.call(Level.t),
      orderBy: orderBy?.call(Level.t),
      orderByList: orderByList?.call(Level.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Level] by its [id] or null if no such row exists.
  Future<Level?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Level>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Level]s in the list and returns the inserted rows.
  ///
  /// The returned [Level]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Level>> insert(
    _i1.Session session,
    List<Level> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Level>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Level] and returns the inserted row.
  ///
  /// The returned [Level] will have its `id` field set.
  Future<Level> insertRow(
    _i1.Session session,
    Level row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Level>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Level]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Level>> update(
    _i1.Session session,
    List<Level> rows, {
    _i1.ColumnSelections<LevelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Level>(
      rows,
      columns: columns?.call(Level.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Level]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Level> updateRow(
    _i1.Session session,
    Level row, {
    _i1.ColumnSelections<LevelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Level>(
      row,
      columns: columns?.call(Level.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Level] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Level?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<LevelUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Level>(
      id,
      columnValues: columnValues(Level.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Level]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Level>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<LevelUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LevelTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LevelTable>? orderBy,
    _i1.OrderByListBuilder<LevelTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Level>(
      columnValues: columnValues(Level.t.updateTable),
      where: where(Level.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Level.t),
      orderByList: orderByList?.call(Level.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Level]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Level>> delete(
    _i1.Session session,
    List<Level> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Level>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Level].
  Future<Level> deleteRow(
    _i1.Session session,
    Level row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Level>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Level>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LevelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Level>(
      where: where(Level.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LevelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Level>(
      where: where?.call(Level.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
