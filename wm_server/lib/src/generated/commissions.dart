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

abstract class Commissions
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Commissions._({
    this.id,
    required this.saleId,
    required this.recipientId,
    required this.sourceLevel,
    required this.commissionType,
    required this.commissionAmount,
    required this.isPaid,
    this.paidAt,
    required this.createdAt,
  });

  factory Commissions({
    int? id,
    required int saleId,
    required int recipientId,
    required int sourceLevel,
    required String commissionType,
    required double commissionAmount,
    required bool isPaid,
    DateTime? paidAt,
    required DateTime createdAt,
  }) = _CommissionsImpl;

  factory Commissions.fromJson(Map<String, dynamic> jsonSerialization) {
    return Commissions(
      id: jsonSerialization['id'] as int?,
      saleId: jsonSerialization['saleId'] as int,
      recipientId: jsonSerialization['recipientId'] as int,
      sourceLevel: jsonSerialization['sourceLevel'] as int,
      commissionType: jsonSerialization['commissionType'] as String,
      commissionAmount:
          (jsonSerialization['commissionAmount'] as num).toDouble(),
      isPaid: jsonSerialization['isPaid'] as bool,
      paidAt: jsonSerialization['paidAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['paidAt']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = CommissionsTable();

  static const db = CommissionsRepository._();

  @override
  int? id;

  int saleId;

  int recipientId;

  int sourceLevel;

  String commissionType;

  double commissionAmount;

  bool isPaid;

  DateTime? paidAt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Commissions]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Commissions copyWith({
    int? id,
    int? saleId,
    int? recipientId,
    int? sourceLevel,
    String? commissionType,
    double? commissionAmount,
    bool? isPaid,
    DateTime? paidAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'saleId': saleId,
      'recipientId': recipientId,
      'sourceLevel': sourceLevel,
      'commissionType': commissionType,
      'commissionAmount': commissionAmount,
      'isPaid': isPaid,
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'saleId': saleId,
      'recipientId': recipientId,
      'sourceLevel': sourceLevel,
      'commissionType': commissionType,
      'commissionAmount': commissionAmount,
      'isPaid': isPaid,
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static CommissionsInclude include() {
    return CommissionsInclude._();
  }

  static CommissionsIncludeList includeList({
    _i1.WhereExpressionBuilder<CommissionsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommissionsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommissionsTable>? orderByList,
    CommissionsInclude? include,
  }) {
    return CommissionsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Commissions.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Commissions.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommissionsImpl extends Commissions {
  _CommissionsImpl({
    int? id,
    required int saleId,
    required int recipientId,
    required int sourceLevel,
    required String commissionType,
    required double commissionAmount,
    required bool isPaid,
    DateTime? paidAt,
    required DateTime createdAt,
  }) : super._(
          id: id,
          saleId: saleId,
          recipientId: recipientId,
          sourceLevel: sourceLevel,
          commissionType: commissionType,
          commissionAmount: commissionAmount,
          isPaid: isPaid,
          paidAt: paidAt,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Commissions]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Commissions copyWith({
    Object? id = _Undefined,
    int? saleId,
    int? recipientId,
    int? sourceLevel,
    String? commissionType,
    double? commissionAmount,
    bool? isPaid,
    Object? paidAt = _Undefined,
    DateTime? createdAt,
  }) {
    return Commissions(
      id: id is int? ? id : this.id,
      saleId: saleId ?? this.saleId,
      recipientId: recipientId ?? this.recipientId,
      sourceLevel: sourceLevel ?? this.sourceLevel,
      commissionType: commissionType ?? this.commissionType,
      commissionAmount: commissionAmount ?? this.commissionAmount,
      isPaid: isPaid ?? this.isPaid,
      paidAt: paidAt is DateTime? ? paidAt : this.paidAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CommissionsTable extends _i1.Table<int?> {
  CommissionsTable({super.tableRelation}) : super(tableName: 'commissions') {
    saleId = _i1.ColumnInt(
      'saleId',
      this,
    );
    recipientId = _i1.ColumnInt(
      'recipientId',
      this,
    );
    sourceLevel = _i1.ColumnInt(
      'sourceLevel',
      this,
    );
    commissionType = _i1.ColumnString(
      'commissionType',
      this,
    );
    commissionAmount = _i1.ColumnDouble(
      'commissionAmount',
      this,
    );
    isPaid = _i1.ColumnBool(
      'isPaid',
      this,
    );
    paidAt = _i1.ColumnDateTime(
      'paidAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnInt saleId;

  late final _i1.ColumnInt recipientId;

  late final _i1.ColumnInt sourceLevel;

  late final _i1.ColumnString commissionType;

  late final _i1.ColumnDouble commissionAmount;

  late final _i1.ColumnBool isPaid;

  late final _i1.ColumnDateTime paidAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        saleId,
        recipientId,
        sourceLevel,
        commissionType,
        commissionAmount,
        isPaid,
        paidAt,
        createdAt,
      ];
}

class CommissionsInclude extends _i1.IncludeObject {
  CommissionsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Commissions.t;
}

class CommissionsIncludeList extends _i1.IncludeList {
  CommissionsIncludeList._({
    _i1.WhereExpressionBuilder<CommissionsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Commissions.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Commissions.t;
}

class CommissionsRepository {
  const CommissionsRepository._();

  /// Returns a list of [Commissions]s matching the given query parameters.
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
  Future<List<Commissions>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommissionsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommissionsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommissionsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Commissions>(
      where: where?.call(Commissions.t),
      orderBy: orderBy?.call(Commissions.t),
      orderByList: orderByList?.call(Commissions.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Commissions] matching the given query parameters.
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
  Future<Commissions?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommissionsTable>? where,
    int? offset,
    _i1.OrderByBuilder<CommissionsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommissionsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Commissions>(
      where: where?.call(Commissions.t),
      orderBy: orderBy?.call(Commissions.t),
      orderByList: orderByList?.call(Commissions.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Commissions] by its [id] or null if no such row exists.
  Future<Commissions?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Commissions>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Commissions]s in the list and returns the inserted rows.
  ///
  /// The returned [Commissions]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Commissions>> insert(
    _i1.Session session,
    List<Commissions> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Commissions>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Commissions] and returns the inserted row.
  ///
  /// The returned [Commissions] will have its `id` field set.
  Future<Commissions> insertRow(
    _i1.Session session,
    Commissions row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Commissions>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Commissions]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Commissions>> update(
    _i1.Session session,
    List<Commissions> rows, {
    _i1.ColumnSelections<CommissionsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Commissions>(
      rows,
      columns: columns?.call(Commissions.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Commissions]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Commissions> updateRow(
    _i1.Session session,
    Commissions row, {
    _i1.ColumnSelections<CommissionsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Commissions>(
      row,
      columns: columns?.call(Commissions.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Commissions]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Commissions>> delete(
    _i1.Session session,
    List<Commissions> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Commissions>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Commissions].
  Future<Commissions> deleteRow(
    _i1.Session session,
    Commissions row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Commissions>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Commissions>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CommissionsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Commissions>(
      where: where(Commissions.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommissionsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Commissions>(
      where: where?.call(Commissions.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
