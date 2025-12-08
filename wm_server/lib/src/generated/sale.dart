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
import 'sale_items.dart' as _i2;

abstract class Sale implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Sale._({
    this.id,
    required this.saleNumber,
    required this.saleDate,
    required this.buyerId,
    required this.packageId,
    required this.saleType,
    required this.amount,
    required this.status,
    this.salesItems,
  });

  factory Sale({
    int? id,
    required String saleNumber,
    required DateTime saleDate,
    required int buyerId,
    required int packageId,
    required String saleType,
    required double amount,
    required String status,
    List<_i2.SaleItem>? salesItems,
  }) = _SaleImpl;

  factory Sale.fromJson(Map<String, dynamic> jsonSerialization) {
    return Sale(
      id: jsonSerialization['id'] as int?,
      saleNumber: jsonSerialization['saleNumber'] as String,
      saleDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['saleDate']),
      buyerId: jsonSerialization['buyerId'] as int,
      packageId: jsonSerialization['packageId'] as int,
      saleType: jsonSerialization['saleType'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      status: jsonSerialization['status'] as String,
      salesItems: (jsonSerialization['salesItems'] as List?)
          ?.map((e) => _i2.SaleItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = SaleTable();

  static const db = SaleRepository._();

  @override
  int? id;

  String saleNumber;

  DateTime saleDate;

  int buyerId;

  int packageId;

  String saleType;

  double amount;

  String status;

  List<_i2.SaleItem>? salesItems;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Sale]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Sale copyWith({
    int? id,
    String? saleNumber,
    DateTime? saleDate,
    int? buyerId,
    int? packageId,
    String? saleType,
    double? amount,
    String? status,
    List<_i2.SaleItem>? salesItems,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'saleNumber': saleNumber,
      'saleDate': saleDate.toJson(),
      'buyerId': buyerId,
      'packageId': packageId,
      'saleType': saleType,
      'amount': amount,
      'status': status,
      if (salesItems != null)
        'salesItems': salesItems?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'saleNumber': saleNumber,
      'saleDate': saleDate.toJson(),
      'buyerId': buyerId,
      'packageId': packageId,
      'saleType': saleType,
      'amount': amount,
      'status': status,
      if (salesItems != null)
        'salesItems':
            salesItems?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static SaleInclude include({_i2.SaleItemIncludeList? salesItems}) {
    return SaleInclude._(salesItems: salesItems);
  }

  static SaleIncludeList includeList({
    _i1.WhereExpressionBuilder<SaleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SaleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaleTable>? orderByList,
    SaleInclude? include,
  }) {
    return SaleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Sale.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Sale.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SaleImpl extends Sale {
  _SaleImpl({
    int? id,
    required String saleNumber,
    required DateTime saleDate,
    required int buyerId,
    required int packageId,
    required String saleType,
    required double amount,
    required String status,
    List<_i2.SaleItem>? salesItems,
  }) : super._(
          id: id,
          saleNumber: saleNumber,
          saleDate: saleDate,
          buyerId: buyerId,
          packageId: packageId,
          saleType: saleType,
          amount: amount,
          status: status,
          salesItems: salesItems,
        );

  /// Returns a shallow copy of this [Sale]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Sale copyWith({
    Object? id = _Undefined,
    String? saleNumber,
    DateTime? saleDate,
    int? buyerId,
    int? packageId,
    String? saleType,
    double? amount,
    String? status,
    Object? salesItems = _Undefined,
  }) {
    return Sale(
      id: id is int? ? id : this.id,
      saleNumber: saleNumber ?? this.saleNumber,
      saleDate: saleDate ?? this.saleDate,
      buyerId: buyerId ?? this.buyerId,
      packageId: packageId ?? this.packageId,
      saleType: saleType ?? this.saleType,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      salesItems: salesItems is List<_i2.SaleItem>?
          ? salesItems
          : this.salesItems?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class SaleTable extends _i1.Table<int?> {
  SaleTable({super.tableRelation}) : super(tableName: 'sale') {
    saleNumber = _i1.ColumnString(
      'saleNumber',
      this,
    );
    saleDate = _i1.ColumnDateTime(
      'saleDate',
      this,
    );
    buyerId = _i1.ColumnInt(
      'buyerId',
      this,
    );
    packageId = _i1.ColumnInt(
      'packageId',
      this,
    );
    saleType = _i1.ColumnString(
      'saleType',
      this,
    );
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
  }

  late final _i1.ColumnString saleNumber;

  late final _i1.ColumnDateTime saleDate;

  late final _i1.ColumnInt buyerId;

  late final _i1.ColumnInt packageId;

  late final _i1.ColumnString saleType;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString status;

  _i2.SaleItemTable? ___salesItems;

  _i1.ManyRelation<_i2.SaleItemTable>? _salesItems;

  _i2.SaleItemTable get __salesItems {
    if (___salesItems != null) return ___salesItems!;
    ___salesItems = _i1.createRelationTable(
      relationFieldName: '__salesItems',
      field: Sale.t.id,
      foreignField: _i2.SaleItem.t.$_saleSalesitemsSaleId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SaleItemTable(tableRelation: foreignTableRelation),
    );
    return ___salesItems!;
  }

  _i1.ManyRelation<_i2.SaleItemTable> get salesItems {
    if (_salesItems != null) return _salesItems!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'salesItems',
      field: Sale.t.id,
      foreignField: _i2.SaleItem.t.$_saleSalesitemsSaleId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SaleItemTable(tableRelation: foreignTableRelation),
    );
    _salesItems = _i1.ManyRelation<_i2.SaleItemTable>(
      tableWithRelations: relationTable,
      table: _i2.SaleItemTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _salesItems!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        saleNumber,
        saleDate,
        buyerId,
        packageId,
        saleType,
        amount,
        status,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'salesItems') {
      return __salesItems;
    }
    return null;
  }
}

class SaleInclude extends _i1.IncludeObject {
  SaleInclude._({_i2.SaleItemIncludeList? salesItems}) {
    _salesItems = salesItems;
  }

  _i2.SaleItemIncludeList? _salesItems;

  @override
  Map<String, _i1.Include?> get includes => {'salesItems': _salesItems};

  @override
  _i1.Table<int?> get table => Sale.t;
}

class SaleIncludeList extends _i1.IncludeList {
  SaleIncludeList._({
    _i1.WhereExpressionBuilder<SaleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Sale.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Sale.t;
}

class SaleRepository {
  const SaleRepository._();

  final attach = const SaleAttachRepository._();

  final attachRow = const SaleAttachRowRepository._();

  final detach = const SaleDetachRepository._();

  final detachRow = const SaleDetachRowRepository._();

  /// Returns a list of [Sale]s matching the given query parameters.
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
  Future<List<Sale>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SaleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaleTable>? orderByList,
    _i1.Transaction? transaction,
    SaleInclude? include,
  }) async {
    return session.db.find<Sale>(
      where: where?.call(Sale.t),
      orderBy: orderBy?.call(Sale.t),
      orderByList: orderByList?.call(Sale.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Sale] matching the given query parameters.
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
  Future<Sale?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaleTable>? where,
    int? offset,
    _i1.OrderByBuilder<SaleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaleTable>? orderByList,
    _i1.Transaction? transaction,
    SaleInclude? include,
  }) async {
    return session.db.findFirstRow<Sale>(
      where: where?.call(Sale.t),
      orderBy: orderBy?.call(Sale.t),
      orderByList: orderByList?.call(Sale.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Sale] by its [id] or null if no such row exists.
  Future<Sale?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SaleInclude? include,
  }) async {
    return session.db.findById<Sale>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Sale]s in the list and returns the inserted rows.
  ///
  /// The returned [Sale]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Sale>> insert(
    _i1.Session session,
    List<Sale> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Sale>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Sale] and returns the inserted row.
  ///
  /// The returned [Sale] will have its `id` field set.
  Future<Sale> insertRow(
    _i1.Session session,
    Sale row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Sale>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Sale]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Sale>> update(
    _i1.Session session,
    List<Sale> rows, {
    _i1.ColumnSelections<SaleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Sale>(
      rows,
      columns: columns?.call(Sale.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Sale]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Sale> updateRow(
    _i1.Session session,
    Sale row, {
    _i1.ColumnSelections<SaleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Sale>(
      row,
      columns: columns?.call(Sale.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Sale]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Sale>> delete(
    _i1.Session session,
    List<Sale> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Sale>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Sale].
  Future<Sale> deleteRow(
    _i1.Session session,
    Sale row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Sale>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Sale>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SaleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Sale>(
      where: where(Sale.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Sale>(
      where: where?.call(Sale.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SaleAttachRepository {
  const SaleAttachRepository._();

  /// Creates a relation between this [Sale] and the given [SaleItem]s
  /// by setting each [SaleItem]'s foreign key `_saleSalesitemsSaleId` to refer to this [Sale].
  Future<void> salesItems(
    _i1.Session session,
    Sale sale,
    List<_i2.SaleItem> saleItem, {
    _i1.Transaction? transaction,
  }) async {
    if (saleItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('saleItem.id');
    }
    if (sale.id == null) {
      throw ArgumentError.notNull('sale.id');
    }

    var $saleItem = saleItem
        .map((e) => _i2.SaleItemImplicit(
              e,
              $_saleSalesitemsSaleId: sale.id,
            ))
        .toList();
    await session.db.update<_i2.SaleItem>(
      $saleItem,
      columns: [_i2.SaleItem.t.$_saleSalesitemsSaleId],
      transaction: transaction,
    );
  }
}

class SaleAttachRowRepository {
  const SaleAttachRowRepository._();

  /// Creates a relation between this [Sale] and the given [SaleItem]
  /// by setting the [SaleItem]'s foreign key `_saleSalesitemsSaleId` to refer to this [Sale].
  Future<void> salesItems(
    _i1.Session session,
    Sale sale,
    _i2.SaleItem saleItem, {
    _i1.Transaction? transaction,
  }) async {
    if (saleItem.id == null) {
      throw ArgumentError.notNull('saleItem.id');
    }
    if (sale.id == null) {
      throw ArgumentError.notNull('sale.id');
    }

    var $saleItem = _i2.SaleItemImplicit(
      saleItem,
      $_saleSalesitemsSaleId: sale.id,
    );
    await session.db.updateRow<_i2.SaleItem>(
      $saleItem,
      columns: [_i2.SaleItem.t.$_saleSalesitemsSaleId],
      transaction: transaction,
    );
  }
}

class SaleDetachRepository {
  const SaleDetachRepository._();

  /// Detaches the relation between this [Sale] and the given [SaleItem]
  /// by setting the [SaleItem]'s foreign key `_saleSalesitemsSaleId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salesItems(
    _i1.Session session,
    List<_i2.SaleItem> saleItem, {
    _i1.Transaction? transaction,
  }) async {
    if (saleItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('saleItem.id');
    }

    var $saleItem = saleItem
        .map((e) => _i2.SaleItemImplicit(
              e,
              $_saleSalesitemsSaleId: null,
            ))
        .toList();
    await session.db.update<_i2.SaleItem>(
      $saleItem,
      columns: [_i2.SaleItem.t.$_saleSalesitemsSaleId],
      transaction: transaction,
    );
  }
}

class SaleDetachRowRepository {
  const SaleDetachRowRepository._();

  /// Detaches the relation between this [Sale] and the given [SaleItem]
  /// by setting the [SaleItem]'s foreign key `_saleSalesitemsSaleId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salesItems(
    _i1.Session session,
    _i2.SaleItem saleItem, {
    _i1.Transaction? transaction,
  }) async {
    if (saleItem.id == null) {
      throw ArgumentError.notNull('saleItem.id');
    }

    var $saleItem = _i2.SaleItemImplicit(
      saleItem,
      $_saleSalesitemsSaleId: null,
    );
    await session.db.updateRow<_i2.SaleItem>(
      $saleItem,
      columns: [_i2.SaleItem.t.$_saleSalesitemsSaleId],
      transaction: transaction,
    );
  }
}
