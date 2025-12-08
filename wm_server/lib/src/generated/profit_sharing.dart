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

abstract class ProfitSharing
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProfitSharing._({
    this.id,
    required this.profitType,
    required this.percentage,
    required this.effectiveDate,
    required this.createdAt,
    required this.isActive,
  });

  factory ProfitSharing({
    int? id,
    required String profitType,
    required double percentage,
    required DateTime effectiveDate,
    required DateTime createdAt,
    required bool isActive,
  }) = _ProfitSharingImpl;

  factory ProfitSharing.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProfitSharing(
      id: jsonSerialization['id'] as int?,
      profitType: jsonSerialization['profitType'] as String,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
      effectiveDate: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['effectiveDate']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      isActive: jsonSerialization['isActive'] as bool,
    );
  }

  static final t = ProfitSharingTable();

  static const db = ProfitSharingRepository._();

  @override
  int? id;

  String profitType;

  double percentage;

  DateTime effectiveDate;

  DateTime createdAt;

  bool isActive;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProfitSharing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProfitSharing copyWith({
    int? id,
    String? profitType,
    double? percentage,
    DateTime? effectiveDate,
    DateTime? createdAt,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'profitType': profitType,
      'percentage': percentage,
      'effectiveDate': effectiveDate.toJson(),
      'createdAt': createdAt.toJson(),
      'isActive': isActive,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'profitType': profitType,
      'percentage': percentage,
      'effectiveDate': effectiveDate.toJson(),
      'createdAt': createdAt.toJson(),
      'isActive': isActive,
    };
  }

  static ProfitSharingInclude include() {
    return ProfitSharingInclude._();
  }

  static ProfitSharingIncludeList includeList({
    _i1.WhereExpressionBuilder<ProfitSharingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProfitSharingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfitSharingTable>? orderByList,
    ProfitSharingInclude? include,
  }) {
    return ProfitSharingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProfitSharing.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProfitSharing.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProfitSharingImpl extends ProfitSharing {
  _ProfitSharingImpl({
    int? id,
    required String profitType,
    required double percentage,
    required DateTime effectiveDate,
    required DateTime createdAt,
    required bool isActive,
  }) : super._(
          id: id,
          profitType: profitType,
          percentage: percentage,
          effectiveDate: effectiveDate,
          createdAt: createdAt,
          isActive: isActive,
        );

  /// Returns a shallow copy of this [ProfitSharing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProfitSharing copyWith({
    Object? id = _Undefined,
    String? profitType,
    double? percentage,
    DateTime? effectiveDate,
    DateTime? createdAt,
    bool? isActive,
  }) {
    return ProfitSharing(
      id: id is int? ? id : this.id,
      profitType: profitType ?? this.profitType,
      percentage: percentage ?? this.percentage,
      effectiveDate: effectiveDate ?? this.effectiveDate,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }
}

class ProfitSharingTable extends _i1.Table<int?> {
  ProfitSharingTable({super.tableRelation})
      : super(tableName: 'profit_sharing') {
    profitType = _i1.ColumnString(
      'profitType',
      this,
    );
    percentage = _i1.ColumnDouble(
      'percentage',
      this,
    );
    effectiveDate = _i1.ColumnDateTime(
      'effectiveDate',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
  }

  late final _i1.ColumnString profitType;

  late final _i1.ColumnDouble percentage;

  late final _i1.ColumnDateTime effectiveDate;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnBool isActive;

  @override
  List<_i1.Column> get columns => [
        id,
        profitType,
        percentage,
        effectiveDate,
        createdAt,
        isActive,
      ];
}

class ProfitSharingInclude extends _i1.IncludeObject {
  ProfitSharingInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ProfitSharing.t;
}

class ProfitSharingIncludeList extends _i1.IncludeList {
  ProfitSharingIncludeList._({
    _i1.WhereExpressionBuilder<ProfitSharingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProfitSharing.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProfitSharing.t;
}

class ProfitSharingRepository {
  const ProfitSharingRepository._();

  /// Returns a list of [ProfitSharing]s matching the given query parameters.
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
  Future<List<ProfitSharing>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfitSharingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProfitSharingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfitSharingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ProfitSharing>(
      where: where?.call(ProfitSharing.t),
      orderBy: orderBy?.call(ProfitSharing.t),
      orderByList: orderByList?.call(ProfitSharing.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ProfitSharing] matching the given query parameters.
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
  Future<ProfitSharing?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfitSharingTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProfitSharingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfitSharingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ProfitSharing>(
      where: where?.call(ProfitSharing.t),
      orderBy: orderBy?.call(ProfitSharing.t),
      orderByList: orderByList?.call(ProfitSharing.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ProfitSharing] by its [id] or null if no such row exists.
  Future<ProfitSharing?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ProfitSharing>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ProfitSharing]s in the list and returns the inserted rows.
  ///
  /// The returned [ProfitSharing]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProfitSharing>> insert(
    _i1.Session session,
    List<ProfitSharing> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProfitSharing>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProfitSharing] and returns the inserted row.
  ///
  /// The returned [ProfitSharing] will have its `id` field set.
  Future<ProfitSharing> insertRow(
    _i1.Session session,
    ProfitSharing row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProfitSharing>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProfitSharing]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProfitSharing>> update(
    _i1.Session session,
    List<ProfitSharing> rows, {
    _i1.ColumnSelections<ProfitSharingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProfitSharing>(
      rows,
      columns: columns?.call(ProfitSharing.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProfitSharing]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProfitSharing> updateRow(
    _i1.Session session,
    ProfitSharing row, {
    _i1.ColumnSelections<ProfitSharingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProfitSharing>(
      row,
      columns: columns?.call(ProfitSharing.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ProfitSharing]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProfitSharing>> delete(
    _i1.Session session,
    List<ProfitSharing> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProfitSharing>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProfitSharing].
  Future<ProfitSharing> deleteRow(
    _i1.Session session,
    ProfitSharing row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProfitSharing>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProfitSharing>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProfitSharingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProfitSharing>(
      where: where(ProfitSharing.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfitSharingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProfitSharing>(
      where: where?.call(ProfitSharing.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
