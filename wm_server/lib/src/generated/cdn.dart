/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Cdnconfig
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Cdnconfig._({
    this.id,
    required this.type,
    required this.domain,
    required this.urlpath,
  });

  factory Cdnconfig({
    int? id,
    required String type,
    required String domain,
    required String urlpath,
  }) = _CdnconfigImpl;

  factory Cdnconfig.fromJson(Map<String, dynamic> jsonSerialization) {
    return Cdnconfig(
      id: jsonSerialization['id'] as int?,
      type: jsonSerialization['type'] as String,
      domain: jsonSerialization['domain'] as String,
      urlpath: jsonSerialization['urlpath'] as String,
    );
  }

  static final t = CdnconfigTable();

  static const db = CdnconfigRepository._();

  @override
  int? id;

  String type;

  String domain;

  String urlpath;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Cdnconfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Cdnconfig copyWith({
    int? id,
    String? type,
    String? domain,
    String? urlpath,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type,
      'domain': domain,
      'urlpath': urlpath,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type,
      'domain': domain,
      'urlpath': urlpath,
    };
  }

  static CdnconfigInclude include() {
    return CdnconfigInclude._();
  }

  static CdnconfigIncludeList includeList({
    _i1.WhereExpressionBuilder<CdnconfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CdnconfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CdnconfigTable>? orderByList,
    CdnconfigInclude? include,
  }) {
    return CdnconfigIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Cdnconfig.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Cdnconfig.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CdnconfigImpl extends Cdnconfig {
  _CdnconfigImpl({
    int? id,
    required String type,
    required String domain,
    required String urlpath,
  }) : super._(
          id: id,
          type: type,
          domain: domain,
          urlpath: urlpath,
        );

  /// Returns a shallow copy of this [Cdnconfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Cdnconfig copyWith({
    Object? id = _Undefined,
    String? type,
    String? domain,
    String? urlpath,
  }) {
    return Cdnconfig(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      domain: domain ?? this.domain,
      urlpath: urlpath ?? this.urlpath,
    );
  }
}

class CdnconfigTable extends _i1.Table<int?> {
  CdnconfigTable({super.tableRelation}) : super(tableName: 'cdnconfig') {
    type = _i1.ColumnString(
      'type',
      this,
    );
    domain = _i1.ColumnString(
      'domain',
      this,
    );
    urlpath = _i1.ColumnString(
      'urlpath',
      this,
    );
  }

  late final _i1.ColumnString type;

  late final _i1.ColumnString domain;

  late final _i1.ColumnString urlpath;

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        domain,
        urlpath,
      ];
}

class CdnconfigInclude extends _i1.IncludeObject {
  CdnconfigInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Cdnconfig.t;
}

class CdnconfigIncludeList extends _i1.IncludeList {
  CdnconfigIncludeList._({
    _i1.WhereExpressionBuilder<CdnconfigTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Cdnconfig.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Cdnconfig.t;
}

class CdnconfigRepository {
  const CdnconfigRepository._();

  /// Returns a list of [Cdnconfig]s matching the given query parameters.
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
  Future<List<Cdnconfig>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CdnconfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CdnconfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CdnconfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Cdnconfig>(
      where: where?.call(Cdnconfig.t),
      orderBy: orderBy?.call(Cdnconfig.t),
      orderByList: orderByList?.call(Cdnconfig.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Cdnconfig] matching the given query parameters.
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
  Future<Cdnconfig?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CdnconfigTable>? where,
    int? offset,
    _i1.OrderByBuilder<CdnconfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CdnconfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Cdnconfig>(
      where: where?.call(Cdnconfig.t),
      orderBy: orderBy?.call(Cdnconfig.t),
      orderByList: orderByList?.call(Cdnconfig.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Cdnconfig] by its [id] or null if no such row exists.
  Future<Cdnconfig?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Cdnconfig>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Cdnconfig]s in the list and returns the inserted rows.
  ///
  /// The returned [Cdnconfig]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Cdnconfig>> insert(
    _i1.Session session,
    List<Cdnconfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Cdnconfig>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Cdnconfig] and returns the inserted row.
  ///
  /// The returned [Cdnconfig] will have its `id` field set.
  Future<Cdnconfig> insertRow(
    _i1.Session session,
    Cdnconfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Cdnconfig>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Cdnconfig]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Cdnconfig>> update(
    _i1.Session session,
    List<Cdnconfig> rows, {
    _i1.ColumnSelections<CdnconfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Cdnconfig>(
      rows,
      columns: columns?.call(Cdnconfig.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Cdnconfig]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Cdnconfig> updateRow(
    _i1.Session session,
    Cdnconfig row, {
    _i1.ColumnSelections<CdnconfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Cdnconfig>(
      row,
      columns: columns?.call(Cdnconfig.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Cdnconfig]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Cdnconfig>> delete(
    _i1.Session session,
    List<Cdnconfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Cdnconfig>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Cdnconfig].
  Future<Cdnconfig> deleteRow(
    _i1.Session session,
    Cdnconfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Cdnconfig>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Cdnconfig>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CdnconfigTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Cdnconfig>(
      where: where(Cdnconfig.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CdnconfigTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Cdnconfig>(
      where: where?.call(Cdnconfig.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
