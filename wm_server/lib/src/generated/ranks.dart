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

abstract class Ranks implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Ranks._({
    this.id,
    required this.rankName,
    required this.rankCategoryID,
    required this.minPersonalSalesTarget,
    required this.minGroupSalesTarget,
    required this.minDirectRecruits,
  });

  factory Ranks({
    int? id,
    required String rankName,
    required int rankCategoryID,
    required int minPersonalSalesTarget,
    required int minGroupSalesTarget,
    required int minDirectRecruits,
  }) = _RanksImpl;

  factory Ranks.fromJson(Map<String, dynamic> jsonSerialization) {
    return Ranks(
      id: jsonSerialization['id'] as int?,
      rankName: jsonSerialization['rankName'] as String,
      rankCategoryID: jsonSerialization['rankCategoryID'] as int,
      minPersonalSalesTarget:
          jsonSerialization['minPersonalSalesTarget'] as int,
      minGroupSalesTarget: jsonSerialization['minGroupSalesTarget'] as int,
      minDirectRecruits: jsonSerialization['minDirectRecruits'] as int,
    );
  }

  static final t = RanksTable();

  static const db = RanksRepository._();

  @override
  int? id;

  String rankName;

  int rankCategoryID;

  int minPersonalSalesTarget;

  int minGroupSalesTarget;

  int minDirectRecruits;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Ranks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Ranks copyWith({
    int? id,
    String? rankName,
    int? rankCategoryID,
    int? minPersonalSalesTarget,
    int? minGroupSalesTarget,
    int? minDirectRecruits,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'rankName': rankName,
      'rankCategoryID': rankCategoryID,
      'minPersonalSalesTarget': minPersonalSalesTarget,
      'minGroupSalesTarget': minGroupSalesTarget,
      'minDirectRecruits': minDirectRecruits,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'rankName': rankName,
      'rankCategoryID': rankCategoryID,
      'minPersonalSalesTarget': minPersonalSalesTarget,
      'minGroupSalesTarget': minGroupSalesTarget,
      'minDirectRecruits': minDirectRecruits,
    };
  }

  static RanksInclude include() {
    return RanksInclude._();
  }

  static RanksIncludeList includeList({
    _i1.WhereExpressionBuilder<RanksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RanksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RanksTable>? orderByList,
    RanksInclude? include,
  }) {
    return RanksIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Ranks.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Ranks.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RanksImpl extends Ranks {
  _RanksImpl({
    int? id,
    required String rankName,
    required int rankCategoryID,
    required int minPersonalSalesTarget,
    required int minGroupSalesTarget,
    required int minDirectRecruits,
  }) : super._(
          id: id,
          rankName: rankName,
          rankCategoryID: rankCategoryID,
          minPersonalSalesTarget: minPersonalSalesTarget,
          minGroupSalesTarget: minGroupSalesTarget,
          minDirectRecruits: minDirectRecruits,
        );

  /// Returns a shallow copy of this [Ranks]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Ranks copyWith({
    Object? id = _Undefined,
    String? rankName,
    int? rankCategoryID,
    int? minPersonalSalesTarget,
    int? minGroupSalesTarget,
    int? minDirectRecruits,
  }) {
    return Ranks(
      id: id is int? ? id : this.id,
      rankName: rankName ?? this.rankName,
      rankCategoryID: rankCategoryID ?? this.rankCategoryID,
      minPersonalSalesTarget:
          minPersonalSalesTarget ?? this.minPersonalSalesTarget,
      minGroupSalesTarget: minGroupSalesTarget ?? this.minGroupSalesTarget,
      minDirectRecruits: minDirectRecruits ?? this.minDirectRecruits,
    );
  }
}

class RanksTable extends _i1.Table<int?> {
  RanksTable({super.tableRelation}) : super(tableName: 'ranks') {
    rankName = _i1.ColumnString(
      'rankName',
      this,
    );
    rankCategoryID = _i1.ColumnInt(
      'rankCategoryID',
      this,
    );
    minPersonalSalesTarget = _i1.ColumnInt(
      'minPersonalSalesTarget',
      this,
    );
    minGroupSalesTarget = _i1.ColumnInt(
      'minGroupSalesTarget',
      this,
    );
    minDirectRecruits = _i1.ColumnInt(
      'minDirectRecruits',
      this,
    );
  }

  late final _i1.ColumnString rankName;

  late final _i1.ColumnInt rankCategoryID;

  late final _i1.ColumnInt minPersonalSalesTarget;

  late final _i1.ColumnInt minGroupSalesTarget;

  late final _i1.ColumnInt minDirectRecruits;

  @override
  List<_i1.Column> get columns => [
        id,
        rankName,
        rankCategoryID,
        minPersonalSalesTarget,
        minGroupSalesTarget,
        minDirectRecruits,
      ];
}

class RanksInclude extends _i1.IncludeObject {
  RanksInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Ranks.t;
}

class RanksIncludeList extends _i1.IncludeList {
  RanksIncludeList._({
    _i1.WhereExpressionBuilder<RanksTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Ranks.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Ranks.t;
}

class RanksRepository {
  const RanksRepository._();

  /// Returns a list of [Ranks]s matching the given query parameters.
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
  Future<List<Ranks>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RanksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RanksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RanksTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Ranks>(
      where: where?.call(Ranks.t),
      orderBy: orderBy?.call(Ranks.t),
      orderByList: orderByList?.call(Ranks.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Ranks] matching the given query parameters.
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
  Future<Ranks?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RanksTable>? where,
    int? offset,
    _i1.OrderByBuilder<RanksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RanksTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Ranks>(
      where: where?.call(Ranks.t),
      orderBy: orderBy?.call(Ranks.t),
      orderByList: orderByList?.call(Ranks.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Ranks] by its [id] or null if no such row exists.
  Future<Ranks?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Ranks>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Ranks]s in the list and returns the inserted rows.
  ///
  /// The returned [Ranks]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Ranks>> insert(
    _i1.Session session,
    List<Ranks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Ranks>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Ranks] and returns the inserted row.
  ///
  /// The returned [Ranks] will have its `id` field set.
  Future<Ranks> insertRow(
    _i1.Session session,
    Ranks row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Ranks>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Ranks]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Ranks>> update(
    _i1.Session session,
    List<Ranks> rows, {
    _i1.ColumnSelections<RanksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Ranks>(
      rows,
      columns: columns?.call(Ranks.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Ranks]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Ranks> updateRow(
    _i1.Session session,
    Ranks row, {
    _i1.ColumnSelections<RanksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Ranks>(
      row,
      columns: columns?.call(Ranks.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Ranks]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Ranks>> delete(
    _i1.Session session,
    List<Ranks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Ranks>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Ranks].
  Future<Ranks> deleteRow(
    _i1.Session session,
    Ranks row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Ranks>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Ranks>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RanksTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Ranks>(
      where: where(Ranks.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RanksTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Ranks>(
      where: where?.call(Ranks.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
