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

abstract class CartItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CartItem._({
    this.id,
    required this.cartId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
  }) : _cartCartitemsCartId = null;

  factory CartItem({
    int? id,
    required int cartId,
    required int productId,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CartItemImpl;

  factory CartItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return CartItemImplicit._(
      id: jsonSerialization['id'] as int?,
      cartId: jsonSerialization['cartId'] as int,
      productId: jsonSerialization['productId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      totalPrice: (jsonSerialization['totalPrice'] as num).toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      $_cartCartitemsCartId: jsonSerialization['_cartCartitemsCartId'] as int?,
    );
  }

  static final t = CartItemTable();

  static const db = CartItemRepository._();

  @override
  int? id;

  int cartId;

  int productId;

  int quantity;

  double unitPrice;

  double totalPrice;

  DateTime createdAt;

  DateTime updatedAt;

  final int? _cartCartitemsCartId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CartItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CartItem copyWith({
    int? id,
    int? cartId,
    int? productId,
    int? quantity,
    double? unitPrice,
    double? totalPrice,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'cartId': cartId,
      'productId': productId,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'totalPrice': totalPrice,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (_cartCartitemsCartId != null)
        '_cartCartitemsCartId': _cartCartitemsCartId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'cartId': cartId,
      'productId': productId,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'totalPrice': totalPrice,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static CartItemInclude include() {
    return CartItemInclude._();
  }

  static CartItemIncludeList includeList({
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    CartItemInclude? include,
  }) {
    return CartItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CartItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CartItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CartItemImpl extends CartItem {
  _CartItemImpl({
    int? id,
    required int cartId,
    required int productId,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          cartId: cartId,
          productId: productId,
          quantity: quantity,
          unitPrice: unitPrice,
          totalPrice: totalPrice,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [CartItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CartItem copyWith({
    Object? id = _Undefined,
    int? cartId,
    int? productId,
    int? quantity,
    double? unitPrice,
    double? totalPrice,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CartItemImplicit._(
      id: id is int? ? id : this.id,
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      $_cartCartitemsCartId: this._cartCartitemsCartId,
    );
  }
}

class CartItemImplicit extends _CartItemImpl {
  CartItemImplicit._({
    int? id,
    required int cartId,
    required int productId,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? $_cartCartitemsCartId,
  })  : _cartCartitemsCartId = $_cartCartitemsCartId,
        super(
          id: id,
          cartId: cartId,
          productId: productId,
          quantity: quantity,
          unitPrice: unitPrice,
          totalPrice: totalPrice,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory CartItemImplicit(
    CartItem cartItem, {
    int? $_cartCartitemsCartId,
  }) {
    return CartItemImplicit._(
      id: cartItem.id,
      cartId: cartItem.cartId,
      productId: cartItem.productId,
      quantity: cartItem.quantity,
      unitPrice: cartItem.unitPrice,
      totalPrice: cartItem.totalPrice,
      createdAt: cartItem.createdAt,
      updatedAt: cartItem.updatedAt,
      $_cartCartitemsCartId: $_cartCartitemsCartId,
    );
  }

  @override
  final int? _cartCartitemsCartId;
}

class CartItemTable extends _i1.Table<int?> {
  CartItemTable({super.tableRelation}) : super(tableName: 'cart_items') {
    cartId = _i1.ColumnInt(
      'cartId',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
    );
    unitPrice = _i1.ColumnDouble(
      'unitPrice',
      this,
    );
    totalPrice = _i1.ColumnDouble(
      'totalPrice',
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
    $_cartCartitemsCartId = _i1.ColumnInt(
      '_cartCartitemsCartId',
      this,
    );
  }

  late final _i1.ColumnInt cartId;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnDouble unitPrice;

  late final _i1.ColumnDouble totalPrice;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt $_cartCartitemsCartId;

  @override
  List<_i1.Column> get columns => [
        id,
        cartId,
        productId,
        quantity,
        unitPrice,
        totalPrice,
        createdAt,
        updatedAt,
        $_cartCartitemsCartId,
      ];

  @override
  List<_i1.Column> get managedColumns => [
        id,
        cartId,
        productId,
        quantity,
        unitPrice,
        totalPrice,
        createdAt,
        updatedAt,
      ];
}

class CartItemInclude extends _i1.IncludeObject {
  CartItemInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CartItem.t;
}

class CartItemIncludeList extends _i1.IncludeList {
  CartItemIncludeList._({
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CartItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CartItem.t;
}

class CartItemRepository {
  const CartItemRepository._();

  /// Returns a list of [CartItem]s matching the given query parameters.
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
  Future<List<CartItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CartItem>(
      where: where?.call(CartItem.t),
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CartItem] matching the given query parameters.
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
  Future<CartItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CartItem>(
      where: where?.call(CartItem.t),
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CartItem] by its [id] or null if no such row exists.
  Future<CartItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CartItem>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CartItem]s in the list and returns the inserted rows.
  ///
  /// The returned [CartItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CartItem>> insert(
    _i1.Session session,
    List<CartItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CartItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CartItem] and returns the inserted row.
  ///
  /// The returned [CartItem] will have its `id` field set.
  Future<CartItem> insertRow(
    _i1.Session session,
    CartItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CartItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CartItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CartItem>> update(
    _i1.Session session,
    List<CartItem> rows, {
    _i1.ColumnSelections<CartItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CartItem>(
      rows,
      columns: columns?.call(CartItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CartItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CartItem> updateRow(
    _i1.Session session,
    CartItem row, {
    _i1.ColumnSelections<CartItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CartItem>(
      row,
      columns: columns?.call(CartItem.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CartItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CartItem>> delete(
    _i1.Session session,
    List<CartItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CartItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CartItem].
  Future<CartItem> deleteRow(
    _i1.Session session,
    CartItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CartItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CartItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CartItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CartItem>(
      where: where(CartItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CartItem>(
      where: where?.call(CartItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
