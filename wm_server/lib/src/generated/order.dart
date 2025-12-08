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
import 'order_items.dart' as _i2;

abstract class Order implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Order._({
    this.id,
    required this.userID,
    required this.cartId,
    required this.status,
    required this.currency,
    required this.subtotal,
    required this.taxTotal,
    required this.shippingTotal,
    required this.discountTotal,
    required this.grandTotal,
    required this.paymentMethod,
    required this.createdAt,
    required this.updatedAt,
    this.orderItems,
  });

  factory Order({
    int? id,
    required int userID,
    required int cartId,
    required String status,
    required String currency,
    required double subtotal,
    required double taxTotal,
    required double shippingTotal,
    required double discountTotal,
    required double grandTotal,
    required String paymentMethod,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i2.OrderItem>? orderItems,
  }) = _OrderImpl;

  factory Order.fromJson(Map<String, dynamic> jsonSerialization) {
    return Order(
      id: jsonSerialization['id'] as int?,
      userID: jsonSerialization['userID'] as int,
      cartId: jsonSerialization['cartId'] as int,
      status: jsonSerialization['status'] as String,
      currency: jsonSerialization['currency'] as String,
      subtotal: (jsonSerialization['subtotal'] as num).toDouble(),
      taxTotal: (jsonSerialization['taxTotal'] as num).toDouble(),
      shippingTotal: (jsonSerialization['shippingTotal'] as num).toDouble(),
      discountTotal: (jsonSerialization['discountTotal'] as num).toDouble(),
      grandTotal: (jsonSerialization['grandTotal'] as num).toDouble(),
      paymentMethod: jsonSerialization['paymentMethod'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      orderItems: (jsonSerialization['orderItems'] as List?)
          ?.map((e) => _i2.OrderItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = OrderTable();

  static const db = OrderRepository._();

  @override
  int? id;

  int userID;

  int cartId;

  String status;

  String currency;

  double subtotal;

  double taxTotal;

  double shippingTotal;

  double discountTotal;

  double grandTotal;

  String paymentMethod;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i2.OrderItem>? orderItems;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Order copyWith({
    int? id,
    int? userID,
    int? cartId,
    String? status,
    String? currency,
    double? subtotal,
    double? taxTotal,
    double? shippingTotal,
    double? discountTotal,
    double? grandTotal,
    String? paymentMethod,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.OrderItem>? orderItems,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userID': userID,
      'cartId': cartId,
      'status': status,
      'currency': currency,
      'subtotal': subtotal,
      'taxTotal': taxTotal,
      'shippingTotal': shippingTotal,
      'discountTotal': discountTotal,
      'grandTotal': grandTotal,
      'paymentMethod': paymentMethod,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (orderItems != null)
        'orderItems': orderItems?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userID': userID,
      'cartId': cartId,
      'status': status,
      'currency': currency,
      'subtotal': subtotal,
      'taxTotal': taxTotal,
      'shippingTotal': shippingTotal,
      'discountTotal': discountTotal,
      'grandTotal': grandTotal,
      'paymentMethod': paymentMethod,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (orderItems != null)
        'orderItems':
            orderItems?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static OrderInclude include({_i2.OrderItemIncludeList? orderItems}) {
    return OrderInclude._(orderItems: orderItems);
  }

  static OrderIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    OrderInclude? include,
  }) {
    return OrderIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Order.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Order.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderImpl extends Order {
  _OrderImpl({
    int? id,
    required int userID,
    required int cartId,
    required String status,
    required String currency,
    required double subtotal,
    required double taxTotal,
    required double shippingTotal,
    required double discountTotal,
    required double grandTotal,
    required String paymentMethod,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i2.OrderItem>? orderItems,
  }) : super._(
          id: id,
          userID: userID,
          cartId: cartId,
          status: status,
          currency: currency,
          subtotal: subtotal,
          taxTotal: taxTotal,
          shippingTotal: shippingTotal,
          discountTotal: discountTotal,
          grandTotal: grandTotal,
          paymentMethod: paymentMethod,
          createdAt: createdAt,
          updatedAt: updatedAt,
          orderItems: orderItems,
        );

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Order copyWith({
    Object? id = _Undefined,
    int? userID,
    int? cartId,
    String? status,
    String? currency,
    double? subtotal,
    double? taxTotal,
    double? shippingTotal,
    double? discountTotal,
    double? grandTotal,
    String? paymentMethod,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? orderItems = _Undefined,
  }) {
    return Order(
      id: id is int? ? id : this.id,
      userID: userID ?? this.userID,
      cartId: cartId ?? this.cartId,
      status: status ?? this.status,
      currency: currency ?? this.currency,
      subtotal: subtotal ?? this.subtotal,
      taxTotal: taxTotal ?? this.taxTotal,
      shippingTotal: shippingTotal ?? this.shippingTotal,
      discountTotal: discountTotal ?? this.discountTotal,
      grandTotal: grandTotal ?? this.grandTotal,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      orderItems: orderItems is List<_i2.OrderItem>?
          ? orderItems
          : this.orderItems?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class OrderTable extends _i1.Table<int?> {
  OrderTable({super.tableRelation}) : super(tableName: 'orders') {
    userID = _i1.ColumnInt(
      'userID',
      this,
    );
    cartId = _i1.ColumnInt(
      'cartId',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
    );
    subtotal = _i1.ColumnDouble(
      'subtotal',
      this,
    );
    taxTotal = _i1.ColumnDouble(
      'taxTotal',
      this,
    );
    shippingTotal = _i1.ColumnDouble(
      'shippingTotal',
      this,
    );
    discountTotal = _i1.ColumnDouble(
      'discountTotal',
      this,
    );
    grandTotal = _i1.ColumnDouble(
      'grandTotal',
      this,
    );
    paymentMethod = _i1.ColumnString(
      'paymentMethod',
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

  late final _i1.ColumnInt userID;

  late final _i1.ColumnInt cartId;

  late final _i1.ColumnString status;

  late final _i1.ColumnString currency;

  late final _i1.ColumnDouble subtotal;

  late final _i1.ColumnDouble taxTotal;

  late final _i1.ColumnDouble shippingTotal;

  late final _i1.ColumnDouble discountTotal;

  late final _i1.ColumnDouble grandTotal;

  late final _i1.ColumnString paymentMethod;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.OrderItemTable? ___orderItems;

  _i1.ManyRelation<_i2.OrderItemTable>? _orderItems;

  _i2.OrderItemTable get __orderItems {
    if (___orderItems != null) return ___orderItems!;
    ___orderItems = _i1.createRelationTable(
      relationFieldName: '__orderItems',
      field: Order.t.id,
      foreignField: _i2.OrderItem.t.$_ordersOrderitemsOrdersId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OrderItemTable(tableRelation: foreignTableRelation),
    );
    return ___orderItems!;
  }

  _i1.ManyRelation<_i2.OrderItemTable> get orderItems {
    if (_orderItems != null) return _orderItems!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'orderItems',
      field: Order.t.id,
      foreignField: _i2.OrderItem.t.$_ordersOrderitemsOrdersId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OrderItemTable(tableRelation: foreignTableRelation),
    );
    _orderItems = _i1.ManyRelation<_i2.OrderItemTable>(
      tableWithRelations: relationTable,
      table: _i2.OrderItemTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _orderItems!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userID,
        cartId,
        status,
        currency,
        subtotal,
        taxTotal,
        shippingTotal,
        discountTotal,
        grandTotal,
        paymentMethod,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'orderItems') {
      return __orderItems;
    }
    return null;
  }
}

class OrderInclude extends _i1.IncludeObject {
  OrderInclude._({_i2.OrderItemIncludeList? orderItems}) {
    _orderItems = orderItems;
  }

  _i2.OrderItemIncludeList? _orderItems;

  @override
  Map<String, _i1.Include?> get includes => {'orderItems': _orderItems};

  @override
  _i1.Table<int?> get table => Order.t;
}

class OrderIncludeList extends _i1.IncludeList {
  OrderIncludeList._({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Order.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Order.t;
}

class OrderRepository {
  const OrderRepository._();

  final attach = const OrderAttachRepository._();

  final attachRow = const OrderAttachRowRepository._();

  final detach = const OrderDetachRepository._();

  final detachRow = const OrderDetachRowRepository._();

  /// Returns a list of [Order]s matching the given query parameters.
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
  Future<List<Order>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.find<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Order] matching the given query parameters.
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
  Future<Order?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.findFirstRow<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Order] by its [id] or null if no such row exists.
  Future<Order?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.findById<Order>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Order]s in the list and returns the inserted rows.
  ///
  /// The returned [Order]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Order>> insert(
    _i1.Session session,
    List<Order> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Order>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Order] and returns the inserted row.
  ///
  /// The returned [Order] will have its `id` field set.
  Future<Order> insertRow(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Order]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Order>> update(
    _i1.Session session,
    List<Order> rows, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Order>(
      rows,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Order]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Order> updateRow(
    _i1.Session session,
    Order row, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Order>(
      row,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Order]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Order>> delete(
    _i1.Session session,
    List<Order> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Order>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Order].
  Future<Order> deleteRow(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Order>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OrderTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Order>(
      where: where(Order.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Order>(
      where: where?.call(Order.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OrderAttachRepository {
  const OrderAttachRepository._();

  /// Creates a relation between this [Order] and the given [OrderItem]s
  /// by setting each [OrderItem]'s foreign key `_ordersOrderitemsOrdersId` to refer to this [Order].
  Future<void> orderItems(
    _i1.Session session,
    Order order,
    List<_i2.OrderItem> orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderItem = orderItem
        .map((e) => _i2.OrderItemImplicit(
              e,
              $_ordersOrderitemsOrdersId: order.id,
            ))
        .toList();
    await session.db.update<_i2.OrderItem>(
      $orderItem,
      columns: [_i2.OrderItem.t.$_ordersOrderitemsOrdersId],
      transaction: transaction,
    );
  }
}

class OrderAttachRowRepository {
  const OrderAttachRowRepository._();

  /// Creates a relation between this [Order] and the given [OrderItem]
  /// by setting the [OrderItem]'s foreign key `_ordersOrderitemsOrdersId` to refer to this [Order].
  Future<void> orderItems(
    _i1.Session session,
    Order order,
    _i2.OrderItem orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderItem = _i2.OrderItemImplicit(
      orderItem,
      $_ordersOrderitemsOrdersId: order.id,
    );
    await session.db.updateRow<_i2.OrderItem>(
      $orderItem,
      columns: [_i2.OrderItem.t.$_ordersOrderitemsOrdersId],
      transaction: transaction,
    );
  }
}

class OrderDetachRepository {
  const OrderDetachRepository._();

  /// Detaches the relation between this [Order] and the given [OrderItem]
  /// by setting the [OrderItem]'s foreign key `_ordersOrderitemsOrdersId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> orderItems(
    _i1.Session session,
    List<_i2.OrderItem> orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('orderItem.id');
    }

    var $orderItem = orderItem
        .map((e) => _i2.OrderItemImplicit(
              e,
              $_ordersOrderitemsOrdersId: null,
            ))
        .toList();
    await session.db.update<_i2.OrderItem>(
      $orderItem,
      columns: [_i2.OrderItem.t.$_ordersOrderitemsOrdersId],
      transaction: transaction,
    );
  }
}

class OrderDetachRowRepository {
  const OrderDetachRowRepository._();

  /// Detaches the relation between this [Order] and the given [OrderItem]
  /// by setting the [OrderItem]'s foreign key `_ordersOrderitemsOrdersId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> orderItems(
    _i1.Session session,
    _i2.OrderItem orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }

    var $orderItem = _i2.OrderItemImplicit(
      orderItem,
      $_ordersOrderitemsOrdersId: null,
    );
    await session.db.updateRow<_i2.OrderItem>(
      $orderItem,
      columns: [_i2.OrderItem.t.$_ordersOrderitemsOrdersId],
      transaction: transaction,
    );
  }
}
