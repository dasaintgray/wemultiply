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

abstract class PioneerAccounts
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PioneerAccounts._({
    this.id,
    required this.gsID,
    required this.userId,
    required this.pioneerCode,
    required this.createdAt,
    required this.isRedeemed,
    this.redeemedAt,
  });

  factory PioneerAccounts({
    int? id,
    required int gsID,
    required int userId,
    required String pioneerCode,
    required DateTime createdAt,
    required bool isRedeemed,
    DateTime? redeemedAt,
  }) = _PioneerAccountsImpl;

  factory PioneerAccounts.fromJson(Map<String, dynamic> jsonSerialization) {
    return PioneerAccounts(
      id: jsonSerialization['id'] as int?,
      gsID: jsonSerialization['gsID'] as int,
      userId: jsonSerialization['userId'] as int,
      pioneerCode: jsonSerialization['pioneerCode'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      isRedeemed: jsonSerialization['isRedeemed'] as bool,
      redeemedAt: jsonSerialization['redeemedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['redeemedAt']),
    );
  }

  static final t = PioneerAccountsTable();

  static const db = PioneerAccountsRepository._();

  @override
  int? id;

  int gsID;

  int userId;

  String pioneerCode;

  DateTime createdAt;

  bool isRedeemed;

  DateTime? redeemedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PioneerAccounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PioneerAccounts copyWith({
    int? id,
    int? gsID,
    int? userId,
    String? pioneerCode,
    DateTime? createdAt,
    bool? isRedeemed,
    DateTime? redeemedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gsID': gsID,
      'userId': userId,
      'pioneerCode': pioneerCode,
      'createdAt': createdAt.toJson(),
      'isRedeemed': isRedeemed,
      if (redeemedAt != null) 'redeemedAt': redeemedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gsID': gsID,
      'userId': userId,
      'pioneerCode': pioneerCode,
      'createdAt': createdAt.toJson(),
      'isRedeemed': isRedeemed,
      if (redeemedAt != null) 'redeemedAt': redeemedAt?.toJson(),
    };
  }

  static PioneerAccountsInclude include() {
    return PioneerAccountsInclude._();
  }

  static PioneerAccountsIncludeList includeList({
    _i1.WhereExpressionBuilder<PioneerAccountsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PioneerAccountsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PioneerAccountsTable>? orderByList,
    PioneerAccountsInclude? include,
  }) {
    return PioneerAccountsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PioneerAccounts.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PioneerAccounts.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PioneerAccountsImpl extends PioneerAccounts {
  _PioneerAccountsImpl({
    int? id,
    required int gsID,
    required int userId,
    required String pioneerCode,
    required DateTime createdAt,
    required bool isRedeemed,
    DateTime? redeemedAt,
  }) : super._(
          id: id,
          gsID: gsID,
          userId: userId,
          pioneerCode: pioneerCode,
          createdAt: createdAt,
          isRedeemed: isRedeemed,
          redeemedAt: redeemedAt,
        );

  /// Returns a shallow copy of this [PioneerAccounts]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PioneerAccounts copyWith({
    Object? id = _Undefined,
    int? gsID,
    int? userId,
    String? pioneerCode,
    DateTime? createdAt,
    bool? isRedeemed,
    Object? redeemedAt = _Undefined,
  }) {
    return PioneerAccounts(
      id: id is int? ? id : this.id,
      gsID: gsID ?? this.gsID,
      userId: userId ?? this.userId,
      pioneerCode: pioneerCode ?? this.pioneerCode,
      createdAt: createdAt ?? this.createdAt,
      isRedeemed: isRedeemed ?? this.isRedeemed,
      redeemedAt: redeemedAt is DateTime? ? redeemedAt : this.redeemedAt,
    );
  }
}

class PioneerAccountsTable extends _i1.Table<int?> {
  PioneerAccountsTable({super.tableRelation})
      : super(tableName: 'pioneer_accounts') {
    gsID = _i1.ColumnInt(
      'gsID',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    pioneerCode = _i1.ColumnString(
      'pioneerCode',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    isRedeemed = _i1.ColumnBool(
      'isRedeemed',
      this,
    );
    redeemedAt = _i1.ColumnDateTime(
      'redeemedAt',
      this,
    );
  }

  late final _i1.ColumnInt gsID;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString pioneerCode;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnBool isRedeemed;

  late final _i1.ColumnDateTime redeemedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        gsID,
        userId,
        pioneerCode,
        createdAt,
        isRedeemed,
        redeemedAt,
      ];
}

class PioneerAccountsInclude extends _i1.IncludeObject {
  PioneerAccountsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => PioneerAccounts.t;
}

class PioneerAccountsIncludeList extends _i1.IncludeList {
  PioneerAccountsIncludeList._({
    _i1.WhereExpressionBuilder<PioneerAccountsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PioneerAccounts.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PioneerAccounts.t;
}

class PioneerAccountsRepository {
  const PioneerAccountsRepository._();

  /// Returns a list of [PioneerAccounts]s matching the given query parameters.
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
  Future<List<PioneerAccounts>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PioneerAccountsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PioneerAccountsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PioneerAccountsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PioneerAccounts>(
      where: where?.call(PioneerAccounts.t),
      orderBy: orderBy?.call(PioneerAccounts.t),
      orderByList: orderByList?.call(PioneerAccounts.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [PioneerAccounts] matching the given query parameters.
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
  Future<PioneerAccounts?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PioneerAccountsTable>? where,
    int? offset,
    _i1.OrderByBuilder<PioneerAccountsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PioneerAccountsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<PioneerAccounts>(
      where: where?.call(PioneerAccounts.t),
      orderBy: orderBy?.call(PioneerAccounts.t),
      orderByList: orderByList?.call(PioneerAccounts.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [PioneerAccounts] by its [id] or null if no such row exists.
  Future<PioneerAccounts?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<PioneerAccounts>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [PioneerAccounts]s in the list and returns the inserted rows.
  ///
  /// The returned [PioneerAccounts]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PioneerAccounts>> insert(
    _i1.Session session,
    List<PioneerAccounts> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PioneerAccounts>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PioneerAccounts] and returns the inserted row.
  ///
  /// The returned [PioneerAccounts] will have its `id` field set.
  Future<PioneerAccounts> insertRow(
    _i1.Session session,
    PioneerAccounts row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PioneerAccounts>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PioneerAccounts]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PioneerAccounts>> update(
    _i1.Session session,
    List<PioneerAccounts> rows, {
    _i1.ColumnSelections<PioneerAccountsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PioneerAccounts>(
      rows,
      columns: columns?.call(PioneerAccounts.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PioneerAccounts]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PioneerAccounts> updateRow(
    _i1.Session session,
    PioneerAccounts row, {
    _i1.ColumnSelections<PioneerAccountsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PioneerAccounts>(
      row,
      columns: columns?.call(PioneerAccounts.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PioneerAccounts]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PioneerAccounts>> delete(
    _i1.Session session,
    List<PioneerAccounts> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PioneerAccounts>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PioneerAccounts].
  Future<PioneerAccounts> deleteRow(
    _i1.Session session,
    PioneerAccounts row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PioneerAccounts>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PioneerAccounts>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PioneerAccountsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PioneerAccounts>(
      where: where(PioneerAccounts.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PioneerAccountsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PioneerAccounts>(
      where: where?.call(PioneerAccounts.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
