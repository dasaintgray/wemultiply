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

abstract class ReaperCommission
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ReaperCommission._({
    this.id,
    required this.packageId,
    required this.level,
    required this.productId,
    required this.netPerMember,
    required this.repeatOrderNet,
    this.ronDescription,
    required this.isActive,
    required this.createdBy,
    required this.createdAt,
    this.updatedBy,
    this.updatedAt,
  }) : _packagesPackageidPackagesId = null;

  factory ReaperCommission({
    int? id,
    required int packageId,
    required int level,
    required int productId,
    required double netPerMember,
    required double repeatOrderNet,
    String? ronDescription,
    required bool isActive,
    required String createdBy,
    required DateTime createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  }) = _ReaperCommissionImpl;

  factory ReaperCommission.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReaperCommissionImplicit._(
      id: jsonSerialization['id'] as int?,
      packageId: jsonSerialization['packageId'] as int,
      level: jsonSerialization['level'] as int,
      productId: jsonSerialization['productId'] as int,
      netPerMember: (jsonSerialization['netPerMember'] as num).toDouble(),
      repeatOrderNet: (jsonSerialization['repeatOrderNet'] as num).toDouble(),
      ronDescription: jsonSerialization['ronDescription'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      createdBy: jsonSerialization['createdBy'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedBy: jsonSerialization['updatedBy'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      $_packagesPackageidPackagesId:
          jsonSerialization['_packagesPackageidPackagesId'] as int?,
    );
  }

  static final t = ReaperCommissionTable();

  static const db = ReaperCommissionRepository._();

  @override
  int? id;

  int packageId;

  int level;

  int productId;

  double netPerMember;

  double repeatOrderNet;

  String? ronDescription;

  bool isActive;

  String createdBy;

  DateTime createdAt;

  String? updatedBy;

  DateTime? updatedAt;

  final int? _packagesPackageidPackagesId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ReaperCommission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReaperCommission copyWith({
    int? id,
    int? packageId,
    int? level,
    int? productId,
    double? netPerMember,
    double? repeatOrderNet,
    String? ronDescription,
    bool? isActive,
    String? createdBy,
    DateTime? createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'packageId': packageId,
      'level': level,
      'productId': productId,
      'netPerMember': netPerMember,
      'repeatOrderNet': repeatOrderNet,
      if (ronDescription != null) 'ronDescription': ronDescription,
      'isActive': isActive,
      'createdBy': createdBy,
      'createdAt': createdAt.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (_packagesPackageidPackagesId != null)
        '_packagesPackageidPackagesId': _packagesPackageidPackagesId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'packageId': packageId,
      'level': level,
      'productId': productId,
      'netPerMember': netPerMember,
      'repeatOrderNet': repeatOrderNet,
      if (ronDescription != null) 'ronDescription': ronDescription,
      'isActive': isActive,
      'createdBy': createdBy,
      'createdAt': createdAt.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  static ReaperCommissionInclude include() {
    return ReaperCommissionInclude._();
  }

  static ReaperCommissionIncludeList includeList({
    _i1.WhereExpressionBuilder<ReaperCommissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReaperCommissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReaperCommissionTable>? orderByList,
    ReaperCommissionInclude? include,
  }) {
    return ReaperCommissionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ReaperCommission.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ReaperCommission.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReaperCommissionImpl extends ReaperCommission {
  _ReaperCommissionImpl({
    int? id,
    required int packageId,
    required int level,
    required int productId,
    required double netPerMember,
    required double repeatOrderNet,
    String? ronDescription,
    required bool isActive,
    required String createdBy,
    required DateTime createdAt,
    String? updatedBy,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          packageId: packageId,
          level: level,
          productId: productId,
          netPerMember: netPerMember,
          repeatOrderNet: repeatOrderNet,
          ronDescription: ronDescription,
          isActive: isActive,
          createdBy: createdBy,
          createdAt: createdAt,
          updatedBy: updatedBy,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [ReaperCommission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReaperCommission copyWith({
    Object? id = _Undefined,
    int? packageId,
    int? level,
    int? productId,
    double? netPerMember,
    double? repeatOrderNet,
    Object? ronDescription = _Undefined,
    bool? isActive,
    String? createdBy,
    DateTime? createdAt,
    Object? updatedBy = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return ReaperCommissionImplicit._(
      id: id is int? ? id : this.id,
      packageId: packageId ?? this.packageId,
      level: level ?? this.level,
      productId: productId ?? this.productId,
      netPerMember: netPerMember ?? this.netPerMember,
      repeatOrderNet: repeatOrderNet ?? this.repeatOrderNet,
      ronDescription:
          ronDescription is String? ? ronDescription : this.ronDescription,
      isActive: isActive ?? this.isActive,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedBy: updatedBy is String? ? updatedBy : this.updatedBy,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      $_packagesPackageidPackagesId: this._packagesPackageidPackagesId,
    );
  }
}

class ReaperCommissionImplicit extends _ReaperCommissionImpl {
  ReaperCommissionImplicit._({
    int? id,
    required int packageId,
    required int level,
    required int productId,
    required double netPerMember,
    required double repeatOrderNet,
    String? ronDescription,
    required bool isActive,
    required String createdBy,
    required DateTime createdAt,
    String? updatedBy,
    DateTime? updatedAt,
    int? $_packagesPackageidPackagesId,
  })  : _packagesPackageidPackagesId = $_packagesPackageidPackagesId,
        super(
          id: id,
          packageId: packageId,
          level: level,
          productId: productId,
          netPerMember: netPerMember,
          repeatOrderNet: repeatOrderNet,
          ronDescription: ronDescription,
          isActive: isActive,
          createdBy: createdBy,
          createdAt: createdAt,
          updatedBy: updatedBy,
          updatedAt: updatedAt,
        );

  factory ReaperCommissionImplicit(
    ReaperCommission reaperCommission, {
    int? $_packagesPackageidPackagesId,
  }) {
    return ReaperCommissionImplicit._(
      id: reaperCommission.id,
      packageId: reaperCommission.packageId,
      level: reaperCommission.level,
      productId: reaperCommission.productId,
      netPerMember: reaperCommission.netPerMember,
      repeatOrderNet: reaperCommission.repeatOrderNet,
      ronDescription: reaperCommission.ronDescription,
      isActive: reaperCommission.isActive,
      createdBy: reaperCommission.createdBy,
      createdAt: reaperCommission.createdAt,
      updatedBy: reaperCommission.updatedBy,
      updatedAt: reaperCommission.updatedAt,
      $_packagesPackageidPackagesId: $_packagesPackageidPackagesId,
    );
  }

  @override
  final int? _packagesPackageidPackagesId;
}

class ReaperCommissionTable extends _i1.Table<int?> {
  ReaperCommissionTable({super.tableRelation})
      : super(tableName: 'reaper_commissions') {
    packageId = _i1.ColumnInt(
      'packageId',
      this,
    );
    level = _i1.ColumnInt(
      'level',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    netPerMember = _i1.ColumnDouble(
      'netPerMember',
      this,
    );
    repeatOrderNet = _i1.ColumnDouble(
      'repeatOrderNet',
      this,
    );
    ronDescription = _i1.ColumnString(
      'ronDescription',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    createdBy = _i1.ColumnString(
      'createdBy',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedBy = _i1.ColumnString(
      'updatedBy',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    $_packagesPackageidPackagesId = _i1.ColumnInt(
      '_packagesPackageidPackagesId',
      this,
    );
  }

  late final _i1.ColumnInt packageId;

  late final _i1.ColumnInt level;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnDouble netPerMember;

  late final _i1.ColumnDouble repeatOrderNet;

  late final _i1.ColumnString ronDescription;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnString createdBy;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnString updatedBy;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt $_packagesPackageidPackagesId;

  @override
  List<_i1.Column> get columns => [
        id,
        packageId,
        level,
        productId,
        netPerMember,
        repeatOrderNet,
        ronDescription,
        isActive,
        createdBy,
        createdAt,
        updatedBy,
        updatedAt,
        $_packagesPackageidPackagesId,
      ];

  @override
  List<_i1.Column> get managedColumns => [
        id,
        packageId,
        level,
        productId,
        netPerMember,
        repeatOrderNet,
        ronDescription,
        isActive,
        createdBy,
        createdAt,
        updatedBy,
        updatedAt,
      ];
}

class ReaperCommissionInclude extends _i1.IncludeObject {
  ReaperCommissionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ReaperCommission.t;
}

class ReaperCommissionIncludeList extends _i1.IncludeList {
  ReaperCommissionIncludeList._({
    _i1.WhereExpressionBuilder<ReaperCommissionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ReaperCommission.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ReaperCommission.t;
}

class ReaperCommissionRepository {
  const ReaperCommissionRepository._();

  /// Returns a list of [ReaperCommission]s matching the given query parameters.
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
  Future<List<ReaperCommission>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReaperCommissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReaperCommissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReaperCommissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ReaperCommission>(
      where: where?.call(ReaperCommission.t),
      orderBy: orderBy?.call(ReaperCommission.t),
      orderByList: orderByList?.call(ReaperCommission.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ReaperCommission] matching the given query parameters.
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
  Future<ReaperCommission?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReaperCommissionTable>? where,
    int? offset,
    _i1.OrderByBuilder<ReaperCommissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReaperCommissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ReaperCommission>(
      where: where?.call(ReaperCommission.t),
      orderBy: orderBy?.call(ReaperCommission.t),
      orderByList: orderByList?.call(ReaperCommission.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ReaperCommission] by its [id] or null if no such row exists.
  Future<ReaperCommission?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ReaperCommission>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ReaperCommission]s in the list and returns the inserted rows.
  ///
  /// The returned [ReaperCommission]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ReaperCommission>> insert(
    _i1.Session session,
    List<ReaperCommission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ReaperCommission>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ReaperCommission] and returns the inserted row.
  ///
  /// The returned [ReaperCommission] will have its `id` field set.
  Future<ReaperCommission> insertRow(
    _i1.Session session,
    ReaperCommission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ReaperCommission>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ReaperCommission]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ReaperCommission>> update(
    _i1.Session session,
    List<ReaperCommission> rows, {
    _i1.ColumnSelections<ReaperCommissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ReaperCommission>(
      rows,
      columns: columns?.call(ReaperCommission.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ReaperCommission]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ReaperCommission> updateRow(
    _i1.Session session,
    ReaperCommission row, {
    _i1.ColumnSelections<ReaperCommissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ReaperCommission>(
      row,
      columns: columns?.call(ReaperCommission.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ReaperCommission]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ReaperCommission>> delete(
    _i1.Session session,
    List<ReaperCommission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ReaperCommission>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ReaperCommission].
  Future<ReaperCommission> deleteRow(
    _i1.Session session,
    ReaperCommission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ReaperCommission>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ReaperCommission>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ReaperCommissionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ReaperCommission>(
      where: where(ReaperCommission.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReaperCommissionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ReaperCommission>(
      where: where?.call(ReaperCommission.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
