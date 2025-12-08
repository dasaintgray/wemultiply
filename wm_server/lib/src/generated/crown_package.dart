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

abstract class CrownPackage
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CrownPackage._({
    this.id,
    required this.packageId,
    required this.cashBack,
    required this.netProfit,
    required this.profitToWeMultiply,
    required this.profitToCEO,
    required this.profitToFounders,
    required this.profitToMembers,
    required this.profitToTithes,
  });

  factory CrownPackage({
    int? id,
    required int packageId,
    required double cashBack,
    required double netProfit,
    required double profitToWeMultiply,
    required double profitToCEO,
    required double profitToFounders,
    required double profitToMembers,
    required double profitToTithes,
  }) = _CrownPackageImpl;

  factory CrownPackage.fromJson(Map<String, dynamic> jsonSerialization) {
    return CrownPackage(
      id: jsonSerialization['id'] as int?,
      packageId: jsonSerialization['packageId'] as int,
      cashBack: (jsonSerialization['cashBack'] as num).toDouble(),
      netProfit: (jsonSerialization['netProfit'] as num).toDouble(),
      profitToWeMultiply:
          (jsonSerialization['profitToWeMultiply'] as num).toDouble(),
      profitToCEO: (jsonSerialization['profitToCEO'] as num).toDouble(),
      profitToFounders:
          (jsonSerialization['profitToFounders'] as num).toDouble(),
      profitToMembers: (jsonSerialization['profitToMembers'] as num).toDouble(),
      profitToTithes: (jsonSerialization['profitToTithes'] as num).toDouble(),
    );
  }

  static final t = CrownPackageTable();

  static const db = CrownPackageRepository._();

  @override
  int? id;

  int packageId;

  double cashBack;

  double netProfit;

  double profitToWeMultiply;

  double profitToCEO;

  double profitToFounders;

  double profitToMembers;

  double profitToTithes;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CrownPackage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CrownPackage copyWith({
    int? id,
    int? packageId,
    double? cashBack,
    double? netProfit,
    double? profitToWeMultiply,
    double? profitToCEO,
    double? profitToFounders,
    double? profitToMembers,
    double? profitToTithes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'packageId': packageId,
      'cashBack': cashBack,
      'netProfit': netProfit,
      'profitToWeMultiply': profitToWeMultiply,
      'profitToCEO': profitToCEO,
      'profitToFounders': profitToFounders,
      'profitToMembers': profitToMembers,
      'profitToTithes': profitToTithes,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'packageId': packageId,
      'cashBack': cashBack,
      'netProfit': netProfit,
      'profitToWeMultiply': profitToWeMultiply,
      'profitToCEO': profitToCEO,
      'profitToFounders': profitToFounders,
      'profitToMembers': profitToMembers,
      'profitToTithes': profitToTithes,
    };
  }

  static CrownPackageInclude include() {
    return CrownPackageInclude._();
  }

  static CrownPackageIncludeList includeList({
    _i1.WhereExpressionBuilder<CrownPackageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CrownPackageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CrownPackageTable>? orderByList,
    CrownPackageInclude? include,
  }) {
    return CrownPackageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CrownPackage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CrownPackage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CrownPackageImpl extends CrownPackage {
  _CrownPackageImpl({
    int? id,
    required int packageId,
    required double cashBack,
    required double netProfit,
    required double profitToWeMultiply,
    required double profitToCEO,
    required double profitToFounders,
    required double profitToMembers,
    required double profitToTithes,
  }) : super._(
          id: id,
          packageId: packageId,
          cashBack: cashBack,
          netProfit: netProfit,
          profitToWeMultiply: profitToWeMultiply,
          profitToCEO: profitToCEO,
          profitToFounders: profitToFounders,
          profitToMembers: profitToMembers,
          profitToTithes: profitToTithes,
        );

  /// Returns a shallow copy of this [CrownPackage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CrownPackage copyWith({
    Object? id = _Undefined,
    int? packageId,
    double? cashBack,
    double? netProfit,
    double? profitToWeMultiply,
    double? profitToCEO,
    double? profitToFounders,
    double? profitToMembers,
    double? profitToTithes,
  }) {
    return CrownPackage(
      id: id is int? ? id : this.id,
      packageId: packageId ?? this.packageId,
      cashBack: cashBack ?? this.cashBack,
      netProfit: netProfit ?? this.netProfit,
      profitToWeMultiply: profitToWeMultiply ?? this.profitToWeMultiply,
      profitToCEO: profitToCEO ?? this.profitToCEO,
      profitToFounders: profitToFounders ?? this.profitToFounders,
      profitToMembers: profitToMembers ?? this.profitToMembers,
      profitToTithes: profitToTithes ?? this.profitToTithes,
    );
  }
}

class CrownPackageTable extends _i1.Table<int?> {
  CrownPackageTable({super.tableRelation})
      : super(tableName: 'crown_packages') {
    packageId = _i1.ColumnInt(
      'packageId',
      this,
    );
    cashBack = _i1.ColumnDouble(
      'cashBack',
      this,
    );
    netProfit = _i1.ColumnDouble(
      'netProfit',
      this,
    );
    profitToWeMultiply = _i1.ColumnDouble(
      'profitToWeMultiply',
      this,
    );
    profitToCEO = _i1.ColumnDouble(
      'profitToCEO',
      this,
    );
    profitToFounders = _i1.ColumnDouble(
      'profitToFounders',
      this,
    );
    profitToMembers = _i1.ColumnDouble(
      'profitToMembers',
      this,
    );
    profitToTithes = _i1.ColumnDouble(
      'profitToTithes',
      this,
    );
  }

  late final _i1.ColumnInt packageId;

  late final _i1.ColumnDouble cashBack;

  late final _i1.ColumnDouble netProfit;

  late final _i1.ColumnDouble profitToWeMultiply;

  late final _i1.ColumnDouble profitToCEO;

  late final _i1.ColumnDouble profitToFounders;

  late final _i1.ColumnDouble profitToMembers;

  late final _i1.ColumnDouble profitToTithes;

  @override
  List<_i1.Column> get columns => [
        id,
        packageId,
        cashBack,
        netProfit,
        profitToWeMultiply,
        profitToCEO,
        profitToFounders,
        profitToMembers,
        profitToTithes,
      ];
}

class CrownPackageInclude extends _i1.IncludeObject {
  CrownPackageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CrownPackage.t;
}

class CrownPackageIncludeList extends _i1.IncludeList {
  CrownPackageIncludeList._({
    _i1.WhereExpressionBuilder<CrownPackageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CrownPackage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CrownPackage.t;
}

class CrownPackageRepository {
  const CrownPackageRepository._();

  /// Returns a list of [CrownPackage]s matching the given query parameters.
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
  Future<List<CrownPackage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CrownPackageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CrownPackageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CrownPackageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CrownPackage>(
      where: where?.call(CrownPackage.t),
      orderBy: orderBy?.call(CrownPackage.t),
      orderByList: orderByList?.call(CrownPackage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CrownPackage] matching the given query parameters.
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
  Future<CrownPackage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CrownPackageTable>? where,
    int? offset,
    _i1.OrderByBuilder<CrownPackageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CrownPackageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CrownPackage>(
      where: where?.call(CrownPackage.t),
      orderBy: orderBy?.call(CrownPackage.t),
      orderByList: orderByList?.call(CrownPackage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CrownPackage] by its [id] or null if no such row exists.
  Future<CrownPackage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CrownPackage>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CrownPackage]s in the list and returns the inserted rows.
  ///
  /// The returned [CrownPackage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CrownPackage>> insert(
    _i1.Session session,
    List<CrownPackage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CrownPackage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CrownPackage] and returns the inserted row.
  ///
  /// The returned [CrownPackage] will have its `id` field set.
  Future<CrownPackage> insertRow(
    _i1.Session session,
    CrownPackage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CrownPackage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CrownPackage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CrownPackage>> update(
    _i1.Session session,
    List<CrownPackage> rows, {
    _i1.ColumnSelections<CrownPackageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CrownPackage>(
      rows,
      columns: columns?.call(CrownPackage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CrownPackage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CrownPackage> updateRow(
    _i1.Session session,
    CrownPackage row, {
    _i1.ColumnSelections<CrownPackageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CrownPackage>(
      row,
      columns: columns?.call(CrownPackage.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CrownPackage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CrownPackage>> delete(
    _i1.Session session,
    List<CrownPackage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CrownPackage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CrownPackage].
  Future<CrownPackage> deleteRow(
    _i1.Session session,
    CrownPackage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CrownPackage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CrownPackage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CrownPackageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CrownPackage>(
      where: where(CrownPackage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CrownPackageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CrownPackage>(
      where: where?.call(CrownPackage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
