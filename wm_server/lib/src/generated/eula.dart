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

abstract class Eula implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Eula._({
    this.id,
    required this.menuId,
    required this.documentType,
    required this.content,
    required this.version,
    required this.effectiveDate,
    required this.isActive,
    required this.language,
  }) : _menuEulaitemsMenuId = null;

  factory Eula({
    int? id,
    required int menuId,
    required String documentType,
    required String content,
    required String version,
    required DateTime effectiveDate,
    required bool isActive,
    required String language,
  }) = _EulaImpl;

  factory Eula.fromJson(Map<String, dynamic> jsonSerialization) {
    return EulaImplicit._(
      id: jsonSerialization['id'] as int?,
      menuId: jsonSerialization['menuId'] as int,
      documentType: jsonSerialization['documentType'] as String,
      content: jsonSerialization['content'] as String,
      version: jsonSerialization['version'] as String,
      effectiveDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['effectiveDate'],
      ),
      isActive: jsonSerialization['isActive'] as bool,
      language: jsonSerialization['language'] as String,
      $_menuEulaitemsMenuId: jsonSerialization['_menuEulaitemsMenuId'] as int?,
    );
  }

  static final t = EulaTable();

  static const db = EulaRepository._();

  @override
  int? id;

  int menuId;

  String documentType;

  String content;

  String version;

  DateTime effectiveDate;

  bool isActive;

  String language;

  final int? _menuEulaitemsMenuId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Eula]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Eula copyWith({
    int? id,
    int? menuId,
    String? documentType,
    String? content,
    String? version,
    DateTime? effectiveDate,
    bool? isActive,
    String? language,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Eula',
      if (id != null) 'id': id,
      'menuId': menuId,
      'documentType': documentType,
      'content': content,
      'version': version,
      'effectiveDate': effectiveDate.toJson(),
      'isActive': isActive,
      'language': language,
      if (_menuEulaitemsMenuId != null)
        '_menuEulaitemsMenuId': _menuEulaitemsMenuId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Eula',
      if (id != null) 'id': id,
      'menuId': menuId,
      'documentType': documentType,
      'content': content,
      'version': version,
      'effectiveDate': effectiveDate.toJson(),
      'isActive': isActive,
      'language': language,
    };
  }

  static EulaInclude include() {
    return EulaInclude._();
  }

  static EulaIncludeList includeList({
    _i1.WhereExpressionBuilder<EulaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EulaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EulaTable>? orderByList,
    EulaInclude? include,
  }) {
    return EulaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Eula.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Eula.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EulaImpl extends Eula {
  _EulaImpl({
    int? id,
    required int menuId,
    required String documentType,
    required String content,
    required String version,
    required DateTime effectiveDate,
    required bool isActive,
    required String language,
  }) : super._(
         id: id,
         menuId: menuId,
         documentType: documentType,
         content: content,
         version: version,
         effectiveDate: effectiveDate,
         isActive: isActive,
         language: language,
       );

  /// Returns a shallow copy of this [Eula]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Eula copyWith({
    Object? id = _Undefined,
    int? menuId,
    String? documentType,
    String? content,
    String? version,
    DateTime? effectiveDate,
    bool? isActive,
    String? language,
  }) {
    return EulaImplicit._(
      id: id is int? ? id : this.id,
      menuId: menuId ?? this.menuId,
      documentType: documentType ?? this.documentType,
      content: content ?? this.content,
      version: version ?? this.version,
      effectiveDate: effectiveDate ?? this.effectiveDate,
      isActive: isActive ?? this.isActive,
      language: language ?? this.language,
      $_menuEulaitemsMenuId: this._menuEulaitemsMenuId,
    );
  }
}

class EulaImplicit extends _EulaImpl {
  EulaImplicit._({
    int? id,
    required int menuId,
    required String documentType,
    required String content,
    required String version,
    required DateTime effectiveDate,
    required bool isActive,
    required String language,
    int? $_menuEulaitemsMenuId,
  }) : _menuEulaitemsMenuId = $_menuEulaitemsMenuId,
       super(
         id: id,
         menuId: menuId,
         documentType: documentType,
         content: content,
         version: version,
         effectiveDate: effectiveDate,
         isActive: isActive,
         language: language,
       );

  factory EulaImplicit(
    Eula eula, {
    int? $_menuEulaitemsMenuId,
  }) {
    return EulaImplicit._(
      id: eula.id,
      menuId: eula.menuId,
      documentType: eula.documentType,
      content: eula.content,
      version: eula.version,
      effectiveDate: eula.effectiveDate,
      isActive: eula.isActive,
      language: eula.language,
      $_menuEulaitemsMenuId: $_menuEulaitemsMenuId,
    );
  }

  @override
  final int? _menuEulaitemsMenuId;
}

class EulaUpdateTable extends _i1.UpdateTable<EulaTable> {
  EulaUpdateTable(super.table);

  _i1.ColumnValue<int, int> menuId(int value) => _i1.ColumnValue(
    table.menuId,
    value,
  );

  _i1.ColumnValue<String, String> documentType(String value) => _i1.ColumnValue(
    table.documentType,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<String, String> version(String value) => _i1.ColumnValue(
    table.version,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> effectiveDate(DateTime value) =>
      _i1.ColumnValue(
        table.effectiveDate,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<String, String> language(String value) => _i1.ColumnValue(
    table.language,
    value,
  );

  _i1.ColumnValue<int, int> $_menuEulaitemsMenuId(int? value) =>
      _i1.ColumnValue(
        table.$_menuEulaitemsMenuId,
        value,
      );
}

class EulaTable extends _i1.Table<int?> {
  EulaTable({super.tableRelation}) : super(tableName: 'eula') {
    updateTable = EulaUpdateTable(this);
    menuId = _i1.ColumnInt(
      'menuId',
      this,
    );
    documentType = _i1.ColumnString(
      'documentType',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    version = _i1.ColumnString(
      'version',
      this,
    );
    effectiveDate = _i1.ColumnDateTime(
      'effectiveDate',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    language = _i1.ColumnString(
      'language',
      this,
    );
    $_menuEulaitemsMenuId = _i1.ColumnInt(
      '_menuEulaitemsMenuId',
      this,
    );
  }

  late final EulaUpdateTable updateTable;

  late final _i1.ColumnInt menuId;

  late final _i1.ColumnString documentType;

  late final _i1.ColumnString content;

  late final _i1.ColumnString version;

  late final _i1.ColumnDateTime effectiveDate;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnString language;

  late final _i1.ColumnInt $_menuEulaitemsMenuId;

  @override
  List<_i1.Column> get columns => [
    id,
    menuId,
    documentType,
    content,
    version,
    effectiveDate,
    isActive,
    language,
    $_menuEulaitemsMenuId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    menuId,
    documentType,
    content,
    version,
    effectiveDate,
    isActive,
    language,
  ];
}

class EulaInclude extends _i1.IncludeObject {
  EulaInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Eula.t;
}

class EulaIncludeList extends _i1.IncludeList {
  EulaIncludeList._({
    _i1.WhereExpressionBuilder<EulaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Eula.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Eula.t;
}

class EulaRepository {
  const EulaRepository._();

  /// Returns a list of [Eula]s matching the given query parameters.
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
  Future<List<Eula>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EulaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EulaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EulaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Eula>(
      where: where?.call(Eula.t),
      orderBy: orderBy?.call(Eula.t),
      orderByList: orderByList?.call(Eula.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Eula] matching the given query parameters.
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
  Future<Eula?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EulaTable>? where,
    int? offset,
    _i1.OrderByBuilder<EulaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EulaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Eula>(
      where: where?.call(Eula.t),
      orderBy: orderBy?.call(Eula.t),
      orderByList: orderByList?.call(Eula.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Eula] by its [id] or null if no such row exists.
  Future<Eula?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Eula>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Eula]s in the list and returns the inserted rows.
  ///
  /// The returned [Eula]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Eula>> insert(
    _i1.Session session,
    List<Eula> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Eula>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Eula] and returns the inserted row.
  ///
  /// The returned [Eula] will have its `id` field set.
  Future<Eula> insertRow(
    _i1.Session session,
    Eula row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Eula>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Eula]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Eula>> update(
    _i1.Session session,
    List<Eula> rows, {
    _i1.ColumnSelections<EulaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Eula>(
      rows,
      columns: columns?.call(Eula.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Eula]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Eula> updateRow(
    _i1.Session session,
    Eula row, {
    _i1.ColumnSelections<EulaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Eula>(
      row,
      columns: columns?.call(Eula.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Eula] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Eula?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<EulaUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Eula>(
      id,
      columnValues: columnValues(Eula.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Eula]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Eula>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<EulaUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<EulaTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EulaTable>? orderBy,
    _i1.OrderByListBuilder<EulaTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Eula>(
      columnValues: columnValues(Eula.t.updateTable),
      where: where(Eula.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Eula.t),
      orderByList: orderByList?.call(Eula.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Eula]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Eula>> delete(
    _i1.Session session,
    List<Eula> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Eula>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Eula].
  Future<Eula> deleteRow(
    _i1.Session session,
    Eula row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Eula>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Eula>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EulaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Eula>(
      where: where(Eula.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EulaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Eula>(
      where: where?.call(Eula.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
