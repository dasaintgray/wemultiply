/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class SaleItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SaleItem._({
    this.id,
    required this.saleId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.lineTotal,
  }) : _saleSalesitemsSaleId = null;

  factory SaleItem({
    int? id,
    required int saleId,
    required int productId,
    required String productName,
    required int quantity,
    required double price,
    required double lineTotal,
  }) = _SaleItemImpl;

  factory SaleItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return SaleItemImplicit._(
      id: jsonSerialization['id'] as int?,
      saleId: jsonSerialization['saleId'] as int,
      productId: jsonSerialization['productId'] as int,
      productName: jsonSerialization['productName'] as String,
      quantity: jsonSerialization['quantity'] as int,
      price: (jsonSerialization['price'] as num).toDouble(),
      lineTotal: (jsonSerialization['lineTotal'] as num).toDouble(),
      $_saleSalesitemsSaleId:
          jsonSerialization['_saleSalesitemsSaleId'] as int?,
    );
  }

  static final t = SaleItemTable();

  static const db = SaleItemRepository._();

  @override
  int? id;

  int saleId;

  int productId;

  String productName;

  int quantity;

  double price;

  double lineTotal;

  final int? _saleSalesitemsSaleId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SaleItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SaleItem copyWith({
    int? id,
    int? saleId,
    int? productId,
    String? productName,
    int? quantity,
    double? price,
    double? lineTotal,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SaleItem',
      if (id != null) 'id': id,
      'saleId': saleId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'lineTotal': lineTotal,
      if (_saleSalesitemsSaleId != null)
        '_saleSalesitemsSaleId': _saleSalesitemsSaleId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SaleItem',
      if (id != null) 'id': id,
      'saleId': saleId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'lineTotal': lineTotal,
    };
  }

  static SaleItemInclude include() {
    return SaleItemInclude._();
  }

  static SaleItemIncludeList includeList({
    _i1.WhereExpressionBuilder<SaleItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SaleItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaleItemTable>? orderByList,
    SaleItemInclude? include,
  }) {
    return SaleItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SaleItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SaleItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SaleItemImpl extends SaleItem {
  _SaleItemImpl({
    int? id,
    required int saleId,
    required int productId,
    required String productName,
    required int quantity,
    required double price,
    required double lineTotal,
  }) : super._(
         id: id,
         saleId: saleId,
         productId: productId,
         productName: productName,
         quantity: quantity,
         price: price,
         lineTotal: lineTotal,
       );

  /// Returns a shallow copy of this [SaleItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SaleItem copyWith({
    Object? id = _Undefined,
    int? saleId,
    int? productId,
    String? productName,
    int? quantity,
    double? price,
    double? lineTotal,
  }) {
    return SaleItemImplicit._(
      id: id is int? ? id : this.id,
      saleId: saleId ?? this.saleId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      lineTotal: lineTotal ?? this.lineTotal,
      $_saleSalesitemsSaleId: this._saleSalesitemsSaleId,
    );
  }
}

class SaleItemImplicit extends _SaleItemImpl {
  SaleItemImplicit._({
    int? id,
    required int saleId,
    required int productId,
    required String productName,
    required int quantity,
    required double price,
    required double lineTotal,
    int? $_saleSalesitemsSaleId,
  }) : _saleSalesitemsSaleId = $_saleSalesitemsSaleId,
       super(
         id: id,
         saleId: saleId,
         productId: productId,
         productName: productName,
         quantity: quantity,
         price: price,
         lineTotal: lineTotal,
       );

  factory SaleItemImplicit(
    SaleItem saleItem, {
    int? $_saleSalesitemsSaleId,
  }) {
    return SaleItemImplicit._(
      id: saleItem.id,
      saleId: saleItem.saleId,
      productId: saleItem.productId,
      productName: saleItem.productName,
      quantity: saleItem.quantity,
      price: saleItem.price,
      lineTotal: saleItem.lineTotal,
      $_saleSalesitemsSaleId: $_saleSalesitemsSaleId,
    );
  }

  @override
  final int? _saleSalesitemsSaleId;
}

class SaleItemUpdateTable extends _i1.UpdateTable<SaleItemTable> {
  SaleItemUpdateTable(super.table);

  _i1.ColumnValue<int, int> saleId(int value) => _i1.ColumnValue(
    table.saleId,
    value,
  );

  _i1.ColumnValue<int, int> productId(int value) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<String, String> productName(String value) => _i1.ColumnValue(
    table.productName,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );

  _i1.ColumnValue<double, double> lineTotal(double value) => _i1.ColumnValue(
    table.lineTotal,
    value,
  );

  _i1.ColumnValue<int, int> $_saleSalesitemsSaleId(int? value) =>
      _i1.ColumnValue(
        table.$_saleSalesitemsSaleId,
        value,
      );
}

class SaleItemTable extends _i1.Table<int?> {
  SaleItemTable({super.tableRelation}) : super(tableName: 'sale_items') {
    updateTable = SaleItemUpdateTable(this);
    saleId = _i1.ColumnInt(
      'saleId',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    productName = _i1.ColumnString(
      'productName',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    lineTotal = _i1.ColumnDouble(
      'lineTotal',
      this,
    );
    $_saleSalesitemsSaleId = _i1.ColumnInt(
      '_saleSalesitemsSaleId',
      this,
    );
  }

  late final SaleItemUpdateTable updateTable;

  late final _i1.ColumnInt saleId;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnString productName;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnDouble lineTotal;

  late final _i1.ColumnInt $_saleSalesitemsSaleId;

  @override
  List<_i1.Column> get columns => [
    id,
    saleId,
    productId,
    productName,
    quantity,
    price,
    lineTotal,
    $_saleSalesitemsSaleId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    saleId,
    productId,
    productName,
    quantity,
    price,
    lineTotal,
  ];
}

class SaleItemInclude extends _i1.IncludeObject {
  SaleItemInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => SaleItem.t;
}

class SaleItemIncludeList extends _i1.IncludeList {
  SaleItemIncludeList._({
    _i1.WhereExpressionBuilder<SaleItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SaleItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SaleItem.t;
}

class SaleItemRepository {
  const SaleItemRepository._();

  /// Returns a list of [SaleItem]s matching the given query parameters.
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
  Future<List<SaleItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaleItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SaleItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaleItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SaleItem>(
      where: where?.call(SaleItem.t),
      orderBy: orderBy?.call(SaleItem.t),
      orderByList: orderByList?.call(SaleItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [SaleItem] matching the given query parameters.
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
  Future<SaleItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaleItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<SaleItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaleItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<SaleItem>(
      where: where?.call(SaleItem.t),
      orderBy: orderBy?.call(SaleItem.t),
      orderByList: orderByList?.call(SaleItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [SaleItem] by its [id] or null if no such row exists.
  Future<SaleItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<SaleItem>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [SaleItem]s in the list and returns the inserted rows.
  ///
  /// The returned [SaleItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SaleItem>> insert(
    _i1.Session session,
    List<SaleItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SaleItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SaleItem] and returns the inserted row.
  ///
  /// The returned [SaleItem] will have its `id` field set.
  Future<SaleItem> insertRow(
    _i1.Session session,
    SaleItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SaleItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SaleItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SaleItem>> update(
    _i1.Session session,
    List<SaleItem> rows, {
    _i1.ColumnSelections<SaleItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SaleItem>(
      rows,
      columns: columns?.call(SaleItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SaleItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SaleItem> updateRow(
    _i1.Session session,
    SaleItem row, {
    _i1.ColumnSelections<SaleItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SaleItem>(
      row,
      columns: columns?.call(SaleItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SaleItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SaleItem?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<SaleItemUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SaleItem>(
      id,
      columnValues: columnValues(SaleItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SaleItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SaleItem>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<SaleItemUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SaleItemTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SaleItemTable>? orderBy,
    _i1.OrderByListBuilder<SaleItemTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SaleItem>(
      columnValues: columnValues(SaleItem.t.updateTable),
      where: where(SaleItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SaleItem.t),
      orderByList: orderByList?.call(SaleItem.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SaleItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SaleItem>> delete(
    _i1.Session session,
    List<SaleItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SaleItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SaleItem].
  Future<SaleItem> deleteRow(
    _i1.Session session,
    SaleItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SaleItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SaleItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SaleItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SaleItem>(
      where: where(SaleItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaleItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SaleItem>(
      where: where?.call(SaleItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
