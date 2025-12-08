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

abstract class RankCategory
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RankCategory._({
    this.id,
    required this.rankName,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RankCategory({
    int? id,
    required String rankName,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RankCategoryImpl;

  factory RankCategory.fromJson(Map<String, dynamic> jsonSerialization) {
    return RankCategory(
      id: jsonSerialization['id'] as int?,
      rankName: jsonSerialization['rankName'] as String,
      description: jsonSerialization['description'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = RankCategoryTable();

  static const db = RankCategoryRepository._();

  @override
  int? id;

  String rankName;

  String description;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RankCategory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RankCategory copyWith({
    int? id,
    String? rankName,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'rankName': rankName,
      'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'rankName': rankName,
      'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static RankCategoryInclude include() {
    return RankCategoryInclude._();
  }

  static RankCategoryIncludeList includeList({
    _i1.WhereExpressionBuilder<RankCategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RankCategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RankCategoryTable>? orderByList,
    RankCategoryInclude? include,
  }) {
    return RankCategoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RankCategory.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RankCategory.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RankCategoryImpl extends RankCategory {
  _RankCategoryImpl({
    int? id,
    required String rankName,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          rankName: rankName,
          description: description,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [RankCategory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RankCategory copyWith({
    Object? id = _Undefined,
    String? rankName,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RankCategory(
      id: id is int? ? id : this.id,
      rankName: rankName ?? this.rankName,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class RankCategoryTable extends _i1.Table<int?> {
  RankCategoryTable({super.tableRelation}) : super(tableName: 'rank_category') {
    rankName = _i1.ColumnString(
      'rankName',
      this,
    );
    description = _i1.ColumnString(
      'description',
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

  late final _i1.ColumnString rankName;

  late final _i1.ColumnString description;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        rankName,
        description,
        createdAt,
        updatedAt,
      ];
}

class RankCategoryInclude extends _i1.IncludeObject {
  RankCategoryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RankCategory.t;
}

class RankCategoryIncludeList extends _i1.IncludeList {
  RankCategoryIncludeList._({
    _i1.WhereExpressionBuilder<RankCategoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RankCategory.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RankCategory.t;
}

class RankCategoryRepository {
  const RankCategoryRepository._();

  /// Returns a list of [RankCategory]s matching the given query parameters.
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
  Future<List<RankCategory>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RankCategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RankCategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RankCategoryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RankCategory>(
      where: where?.call(RankCategory.t),
      orderBy: orderBy?.call(RankCategory.t),
      orderByList: orderByList?.call(RankCategory.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RankCategory] matching the given query parameters.
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
  Future<RankCategory?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RankCategoryTable>? where,
    int? offset,
    _i1.OrderByBuilder<RankCategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RankCategoryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RankCategory>(
      where: where?.call(RankCategory.t),
      orderBy: orderBy?.call(RankCategory.t),
      orderByList: orderByList?.call(RankCategory.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RankCategory] by its [id] or null if no such row exists.
  Future<RankCategory?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RankCategory>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RankCategory]s in the list and returns the inserted rows.
  ///
  /// The returned [RankCategory]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RankCategory>> insert(
    _i1.Session session,
    List<RankCategory> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RankCategory>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RankCategory] and returns the inserted row.
  ///
  /// The returned [RankCategory] will have its `id` field set.
  Future<RankCategory> insertRow(
    _i1.Session session,
    RankCategory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RankCategory>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RankCategory]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RankCategory>> update(
    _i1.Session session,
    List<RankCategory> rows, {
    _i1.ColumnSelections<RankCategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RankCategory>(
      rows,
      columns: columns?.call(RankCategory.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RankCategory]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RankCategory> updateRow(
    _i1.Session session,
    RankCategory row, {
    _i1.ColumnSelections<RankCategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RankCategory>(
      row,
      columns: columns?.call(RankCategory.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RankCategory]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RankCategory>> delete(
    _i1.Session session,
    List<RankCategory> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RankCategory>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RankCategory].
  Future<RankCategory> deleteRow(
    _i1.Session session,
    RankCategory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RankCategory>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RankCategory>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RankCategoryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RankCategory>(
      where: where(RankCategory.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RankCategoryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RankCategory>(
      where: where?.call(RankCategory.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
