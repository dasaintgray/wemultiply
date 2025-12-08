/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'reaper_commissions.dart' as _i2;

abstract class Package
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Package._({
    this.id,
    required this.packageName,
    required this.packageDescription,
    required this.membershipFee,
    required this.productId,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    required this.isActive,
    this.packageId,
  });

  factory Package({
    int? id,
    required String packageName,
    required String packageDescription,
    required double membershipFee,
    required int productId,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
    required bool isActive,
    List<_i2.ReaperCommission>? packageId,
  }) = _PackageImpl;

  factory Package.fromJson(Map<String, dynamic> jsonSerialization) {
    return Package(
      id: jsonSerialization['id'] as int?,
      packageName: jsonSerialization['packageName'] as String,
      packageDescription: jsonSerialization['packageDescription'] as String,
      membershipFee: (jsonSerialization['membershipFee'] as num).toDouble(),
      productId: jsonSerialization['productId'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdBy: jsonSerialization['createdBy'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      updatedBy: jsonSerialization['updatedBy'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      packageId: (jsonSerialization['packageId'] as List?)
          ?.map(
              (e) => _i2.ReaperCommission.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = PackageTable();

  static const db = PackageRepository._();

  @override
  int? id;

  String packageName;

  String packageDescription;

  double membershipFee;

  int productId;

  DateTime? createdAt;

  String? createdBy;

  DateTime? updatedAt;

  String? updatedBy;

  bool isActive;

  List<_i2.ReaperCommission>? packageId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Package]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Package copyWith({
    int? id,
    String? packageName,
    String? packageDescription,
    double? membershipFee,
    int? productId,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
    bool? isActive,
    List<_i2.ReaperCommission>? packageId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'packageName': packageName,
      'packageDescription': packageDescription,
      'membershipFee': membershipFee,
      'productId': productId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (createdBy != null) 'createdBy': createdBy,
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy,
      'isActive': isActive,
      if (packageId != null)
        'packageId': packageId?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'packageName': packageName,
      'packageDescription': packageDescription,
      'membershipFee': membershipFee,
      'productId': productId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (createdBy != null) 'createdBy': createdBy,
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy,
      'isActive': isActive,
      if (packageId != null)
        'packageId':
            packageId?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static PackageInclude include({_i2.ReaperCommissionIncludeList? packageId}) {
    return PackageInclude._(packageId: packageId);
  }

  static PackageIncludeList includeList({
    _i1.WhereExpressionBuilder<PackageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PackageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PackageTable>? orderByList,
    PackageInclude? include,
  }) {
    return PackageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Package.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Package.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PackageImpl extends Package {
  _PackageImpl({
    int? id,
    required String packageName,
    required String packageDescription,
    required double membershipFee,
    required int productId,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
    required bool isActive,
    List<_i2.ReaperCommission>? packageId,
  }) : super._(
          id: id,
          packageName: packageName,
          packageDescription: packageDescription,
          membershipFee: membershipFee,
          productId: productId,
          createdAt: createdAt,
          createdBy: createdBy,
          updatedAt: updatedAt,
          updatedBy: updatedBy,
          isActive: isActive,
          packageId: packageId,
        );

  /// Returns a shallow copy of this [Package]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Package copyWith({
    Object? id = _Undefined,
    String? packageName,
    String? packageDescription,
    double? membershipFee,
    int? productId,
    Object? createdAt = _Undefined,
    Object? createdBy = _Undefined,
    Object? updatedAt = _Undefined,
    Object? updatedBy = _Undefined,
    bool? isActive,
    Object? packageId = _Undefined,
  }) {
    return Package(
      id: id is int? ? id : this.id,
      packageName: packageName ?? this.packageName,
      packageDescription: packageDescription ?? this.packageDescription,
      membershipFee: membershipFee ?? this.membershipFee,
      productId: productId ?? this.productId,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      createdBy: createdBy is String? ? createdBy : this.createdBy,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      updatedBy: updatedBy is String? ? updatedBy : this.updatedBy,
      isActive: isActive ?? this.isActive,
      packageId: packageId is List<_i2.ReaperCommission>?
          ? packageId
          : this.packageId?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class PackageTable extends _i1.Table<int?> {
  PackageTable({super.tableRelation}) : super(tableName: 'packages') {
    packageName = _i1.ColumnString(
      'packageName',
      this,
    );
    packageDescription = _i1.ColumnString(
      'packageDescription',
      this,
    );
    membershipFee = _i1.ColumnDouble(
      'membershipFee',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    createdBy = _i1.ColumnString(
      'createdBy',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    updatedBy = _i1.ColumnString(
      'updatedBy',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
  }

  late final _i1.ColumnString packageName;

  late final _i1.ColumnString packageDescription;

  late final _i1.ColumnDouble membershipFee;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnString createdBy;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnString updatedBy;

  late final _i1.ColumnBool isActive;

  _i2.ReaperCommissionTable? ___packageId;

  _i1.ManyRelation<_i2.ReaperCommissionTable>? _packageId;

  _i2.ReaperCommissionTable get __packageId {
    if (___packageId != null) return ___packageId!;
    ___packageId = _i1.createRelationTable(
      relationFieldName: '__packageId',
      field: Package.t.id,
      foreignField: _i2.ReaperCommission.t.$_packagesPackageidPackagesId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ReaperCommissionTable(tableRelation: foreignTableRelation),
    );
    return ___packageId!;
  }

  _i1.ManyRelation<_i2.ReaperCommissionTable> get packageId {
    if (_packageId != null) return _packageId!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'packageId',
      field: Package.t.id,
      foreignField: _i2.ReaperCommission.t.$_packagesPackageidPackagesId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ReaperCommissionTable(tableRelation: foreignTableRelation),
    );
    _packageId = _i1.ManyRelation<_i2.ReaperCommissionTable>(
      tableWithRelations: relationTable,
      table: _i2.ReaperCommissionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _packageId!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        packageName,
        packageDescription,
        membershipFee,
        productId,
        createdAt,
        createdBy,
        updatedAt,
        updatedBy,
        isActive,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'packageId') {
      return __packageId;
    }
    return null;
  }
}

class PackageInclude extends _i1.IncludeObject {
  PackageInclude._({_i2.ReaperCommissionIncludeList? packageId}) {
    _packageId = packageId;
  }

  _i2.ReaperCommissionIncludeList? _packageId;

  @override
  Map<String, _i1.Include?> get includes => {'packageId': _packageId};

  @override
  _i1.Table<int?> get table => Package.t;
}

class PackageIncludeList extends _i1.IncludeList {
  PackageIncludeList._({
    _i1.WhereExpressionBuilder<PackageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Package.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Package.t;
}

class PackageRepository {
  const PackageRepository._();

  final attach = const PackageAttachRepository._();

  final attachRow = const PackageAttachRowRepository._();

  final detach = const PackageDetachRepository._();

  final detachRow = const PackageDetachRowRepository._();

  /// Returns a list of [Package]s matching the given query parameters.
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
  Future<List<Package>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PackageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PackageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PackageTable>? orderByList,
    _i1.Transaction? transaction,
    PackageInclude? include,
  }) async {
    return session.db.find<Package>(
      where: where?.call(Package.t),
      orderBy: orderBy?.call(Package.t),
      orderByList: orderByList?.call(Package.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Package] matching the given query parameters.
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
  Future<Package?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PackageTable>? where,
    int? offset,
    _i1.OrderByBuilder<PackageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PackageTable>? orderByList,
    _i1.Transaction? transaction,
    PackageInclude? include,
  }) async {
    return session.db.findFirstRow<Package>(
      where: where?.call(Package.t),
      orderBy: orderBy?.call(Package.t),
      orderByList: orderByList?.call(Package.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Package] by its [id] or null if no such row exists.
  Future<Package?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PackageInclude? include,
  }) async {
    return session.db.findById<Package>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Package]s in the list and returns the inserted rows.
  ///
  /// The returned [Package]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Package>> insert(
    _i1.Session session,
    List<Package> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Package>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Package] and returns the inserted row.
  ///
  /// The returned [Package] will have its `id` field set.
  Future<Package> insertRow(
    _i1.Session session,
    Package row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Package>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Package]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Package>> update(
    _i1.Session session,
    List<Package> rows, {
    _i1.ColumnSelections<PackageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Package>(
      rows,
      columns: columns?.call(Package.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Package]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Package> updateRow(
    _i1.Session session,
    Package row, {
    _i1.ColumnSelections<PackageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Package>(
      row,
      columns: columns?.call(Package.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Package]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Package>> delete(
    _i1.Session session,
    List<Package> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Package>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Package].
  Future<Package> deleteRow(
    _i1.Session session,
    Package row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Package>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Package>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PackageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Package>(
      where: where(Package.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PackageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Package>(
      where: where?.call(Package.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PackageAttachRepository {
  const PackageAttachRepository._();

  /// Creates a relation between this [Package] and the given [ReaperCommission]s
  /// by setting each [ReaperCommission]'s foreign key `_packagesPackageidPackagesId` to refer to this [Package].
  Future<void> packageId(
    _i1.Session session,
    Package package,
    List<_i2.ReaperCommission> reaperCommission, {
    _i1.Transaction? transaction,
  }) async {
    if (reaperCommission.any((e) => e.id == null)) {
      throw ArgumentError.notNull('reaperCommission.id');
    }
    if (package.id == null) {
      throw ArgumentError.notNull('package.id');
    }

    var $reaperCommission = reaperCommission
        .map((e) => _i2.ReaperCommissionImplicit(
              e,
              $_packagesPackageidPackagesId: package.id,
            ))
        .toList();
    await session.db.update<_i2.ReaperCommission>(
      $reaperCommission,
      columns: [_i2.ReaperCommission.t.$_packagesPackageidPackagesId],
      transaction: transaction,
    );
  }
}

class PackageAttachRowRepository {
  const PackageAttachRowRepository._();

  /// Creates a relation between this [Package] and the given [ReaperCommission]
  /// by setting the [ReaperCommission]'s foreign key `_packagesPackageidPackagesId` to refer to this [Package].
  Future<void> packageId(
    _i1.Session session,
    Package package,
    _i2.ReaperCommission reaperCommission, {
    _i1.Transaction? transaction,
  }) async {
    if (reaperCommission.id == null) {
      throw ArgumentError.notNull('reaperCommission.id');
    }
    if (package.id == null) {
      throw ArgumentError.notNull('package.id');
    }

    var $reaperCommission = _i2.ReaperCommissionImplicit(
      reaperCommission,
      $_packagesPackageidPackagesId: package.id,
    );
    await session.db.updateRow<_i2.ReaperCommission>(
      $reaperCommission,
      columns: [_i2.ReaperCommission.t.$_packagesPackageidPackagesId],
      transaction: transaction,
    );
  }
}

class PackageDetachRepository {
  const PackageDetachRepository._();

  /// Detaches the relation between this [Package] and the given [ReaperCommission]
  /// by setting the [ReaperCommission]'s foreign key `_packagesPackageidPackagesId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> packageId(
    _i1.Session session,
    List<_i2.ReaperCommission> reaperCommission, {
    _i1.Transaction? transaction,
  }) async {
    if (reaperCommission.any((e) => e.id == null)) {
      throw ArgumentError.notNull('reaperCommission.id');
    }

    var $reaperCommission = reaperCommission
        .map((e) => _i2.ReaperCommissionImplicit(
              e,
              $_packagesPackageidPackagesId: null,
            ))
        .toList();
    await session.db.update<_i2.ReaperCommission>(
      $reaperCommission,
      columns: [_i2.ReaperCommission.t.$_packagesPackageidPackagesId],
      transaction: transaction,
    );
  }
}

class PackageDetachRowRepository {
  const PackageDetachRowRepository._();

  /// Detaches the relation between this [Package] and the given [ReaperCommission]
  /// by setting the [ReaperCommission]'s foreign key `_packagesPackageidPackagesId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> packageId(
    _i1.Session session,
    _i2.ReaperCommission reaperCommission, {
    _i1.Transaction? transaction,
  }) async {
    if (reaperCommission.id == null) {
      throw ArgumentError.notNull('reaperCommission.id');
    }

    var $reaperCommission = _i2.ReaperCommissionImplicit(
      reaperCommission,
      $_packagesPackageidPackagesId: null,
    );
    await session.db.updateRow<_i2.ReaperCommission>(
      $reaperCommission,
      columns: [_i2.ReaperCommission.t.$_packagesPackageidPackagesId],
      transaction: transaction,
    );
  }
}
