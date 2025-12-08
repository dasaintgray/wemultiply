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
import 'cart_items.dart' as _i2;

abstract class Cart implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Cart._({
    this.id,
    required this.userID,
    required this.status,
    required this.currency,
    required this.totalItems,
    required this.subtotal,
    required this.discountTotal,
    required this.taxTotal,
    required this.shippingTotal,
    required this.grandTotal,
    required this.couponCode,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
    required this.notes,
    required this.isActive,
    this.cartItems,
  });

  factory Cart({
    int? id,
    required int userID,
    required String status,
    required String currency,
    required double totalItems,
    required double subtotal,
    required double discountTotal,
    required double taxTotal,
    required double shippingTotal,
    required double grandTotal,
    required String couponCode,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime expiresAt,
    required String notes,
    required bool isActive,
    List<_i2.CartItem>? cartItems,
  }) = _CartImpl;

  factory Cart.fromJson(Map<String, dynamic> jsonSerialization) {
    return Cart(
      id: jsonSerialization['id'] as int?,
      userID: jsonSerialization['userID'] as int,
      status: jsonSerialization['status'] as String,
      currency: jsonSerialization['currency'] as String,
      totalItems: (jsonSerialization['totalItems'] as num).toDouble(),
      subtotal: (jsonSerialization['subtotal'] as num).toDouble(),
      discountTotal: (jsonSerialization['discountTotal'] as num).toDouble(),
      taxTotal: (jsonSerialization['taxTotal'] as num).toDouble(),
      shippingTotal: (jsonSerialization['shippingTotal'] as num).toDouble(),
      grandTotal: (jsonSerialization['grandTotal'] as num).toDouble(),
      couponCode: jsonSerialization['couponCode'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      expiresAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      notes: jsonSerialization['notes'] as String,
      isActive: jsonSerialization['isActive'] as bool,
      cartItems: (jsonSerialization['cartItems'] as List?)
          ?.map((e) => _i2.CartItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = CartTable();

  static const db = CartRepository._();

  @override
  int? id;

  int userID;

  String status;

  String currency;

  double totalItems;

  double subtotal;

  double discountTotal;

  double taxTotal;

  double shippingTotal;

  double grandTotal;

  String couponCode;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime expiresAt;

  String notes;

  bool isActive;

  List<_i2.CartItem>? cartItems;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Cart]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Cart copyWith({
    int? id,
    int? userID,
    String? status,
    String? currency,
    double? totalItems,
    double? subtotal,
    double? discountTotal,
    double? taxTotal,
    double? shippingTotal,
    double? grandTotal,
    String? couponCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
    String? notes,
    bool? isActive,
    List<_i2.CartItem>? cartItems,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userID': userID,
      'status': status,
      'currency': currency,
      'totalItems': totalItems,
      'subtotal': subtotal,
      'discountTotal': discountTotal,
      'taxTotal': taxTotal,
      'shippingTotal': shippingTotal,
      'grandTotal': grandTotal,
      'couponCode': couponCode,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'expiresAt': expiresAt.toJson(),
      'notes': notes,
      'isActive': isActive,
      if (cartItems != null)
        'cartItems': cartItems?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userID': userID,
      'status': status,
      'currency': currency,
      'totalItems': totalItems,
      'subtotal': subtotal,
      'discountTotal': discountTotal,
      'taxTotal': taxTotal,
      'shippingTotal': shippingTotal,
      'grandTotal': grandTotal,
      'couponCode': couponCode,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'expiresAt': expiresAt.toJson(),
      'notes': notes,
      'isActive': isActive,
      if (cartItems != null)
        'cartItems':
            cartItems?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static CartInclude include({_i2.CartItemIncludeList? cartItems}) {
    return CartInclude._(cartItems: cartItems);
  }

  static CartIncludeList includeList({
    _i1.WhereExpressionBuilder<CartTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartTable>? orderByList,
    CartInclude? include,
  }) {
    return CartIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Cart.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Cart.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CartImpl extends Cart {
  _CartImpl({
    int? id,
    required int userID,
    required String status,
    required String currency,
    required double totalItems,
    required double subtotal,
    required double discountTotal,
    required double taxTotal,
    required double shippingTotal,
    required double grandTotal,
    required String couponCode,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime expiresAt,
    required String notes,
    required bool isActive,
    List<_i2.CartItem>? cartItems,
  }) : super._(
          id: id,
          userID: userID,
          status: status,
          currency: currency,
          totalItems: totalItems,
          subtotal: subtotal,
          discountTotal: discountTotal,
          taxTotal: taxTotal,
          shippingTotal: shippingTotal,
          grandTotal: grandTotal,
          couponCode: couponCode,
          createdAt: createdAt,
          updatedAt: updatedAt,
          expiresAt: expiresAt,
          notes: notes,
          isActive: isActive,
          cartItems: cartItems,
        );

  /// Returns a shallow copy of this [Cart]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Cart copyWith({
    Object? id = _Undefined,
    int? userID,
    String? status,
    String? currency,
    double? totalItems,
    double? subtotal,
    double? discountTotal,
    double? taxTotal,
    double? shippingTotal,
    double? grandTotal,
    String? couponCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
    String? notes,
    bool? isActive,
    Object? cartItems = _Undefined,
  }) {
    return Cart(
      id: id is int? ? id : this.id,
      userID: userID ?? this.userID,
      status: status ?? this.status,
      currency: currency ?? this.currency,
      totalItems: totalItems ?? this.totalItems,
      subtotal: subtotal ?? this.subtotal,
      discountTotal: discountTotal ?? this.discountTotal,
      taxTotal: taxTotal ?? this.taxTotal,
      shippingTotal: shippingTotal ?? this.shippingTotal,
      grandTotal: grandTotal ?? this.grandTotal,
      couponCode: couponCode ?? this.couponCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      cartItems: cartItems is List<_i2.CartItem>?
          ? cartItems
          : this.cartItems?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class CartTable extends _i1.Table<int?> {
  CartTable({super.tableRelation}) : super(tableName: 'cart') {
    userID = _i1.ColumnInt(
      'userID',
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
    totalItems = _i1.ColumnDouble(
      'totalItems',
      this,
    );
    subtotal = _i1.ColumnDouble(
      'subtotal',
      this,
    );
    discountTotal = _i1.ColumnDouble(
      'discountTotal',
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
    grandTotal = _i1.ColumnDouble(
      'grandTotal',
      this,
    );
    couponCode = _i1.ColumnString(
      'couponCode',
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
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    notes = _i1.ColumnString(
      'notes',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
  }

  late final _i1.ColumnInt userID;

  late final _i1.ColumnString status;

  late final _i1.ColumnString currency;

  late final _i1.ColumnDouble totalItems;

  late final _i1.ColumnDouble subtotal;

  late final _i1.ColumnDouble discountTotal;

  late final _i1.ColumnDouble taxTotal;

  late final _i1.ColumnDouble shippingTotal;

  late final _i1.ColumnDouble grandTotal;

  late final _i1.ColumnString couponCode;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnString notes;

  late final _i1.ColumnBool isActive;

  _i2.CartItemTable? ___cartItems;

  _i1.ManyRelation<_i2.CartItemTable>? _cartItems;

  _i2.CartItemTable get __cartItems {
    if (___cartItems != null) return ___cartItems!;
    ___cartItems = _i1.createRelationTable(
      relationFieldName: '__cartItems',
      field: Cart.t.id,
      foreignField: _i2.CartItem.t.$_cartCartitemsCartId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CartItemTable(tableRelation: foreignTableRelation),
    );
    return ___cartItems!;
  }

  _i1.ManyRelation<_i2.CartItemTable> get cartItems {
    if (_cartItems != null) return _cartItems!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'cartItems',
      field: Cart.t.id,
      foreignField: _i2.CartItem.t.$_cartCartitemsCartId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CartItemTable(tableRelation: foreignTableRelation),
    );
    _cartItems = _i1.ManyRelation<_i2.CartItemTable>(
      tableWithRelations: relationTable,
      table: _i2.CartItemTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _cartItems!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userID,
        status,
        currency,
        totalItems,
        subtotal,
        discountTotal,
        taxTotal,
        shippingTotal,
        grandTotal,
        couponCode,
        createdAt,
        updatedAt,
        expiresAt,
        notes,
        isActive,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'cartItems') {
      return __cartItems;
    }
    return null;
  }
}

class CartInclude extends _i1.IncludeObject {
  CartInclude._({_i2.CartItemIncludeList? cartItems}) {
    _cartItems = cartItems;
  }

  _i2.CartItemIncludeList? _cartItems;

  @override
  Map<String, _i1.Include?> get includes => {'cartItems': _cartItems};

  @override
  _i1.Table<int?> get table => Cart.t;
}

class CartIncludeList extends _i1.IncludeList {
  CartIncludeList._({
    _i1.WhereExpressionBuilder<CartTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Cart.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Cart.t;
}

class CartRepository {
  const CartRepository._();

  final attach = const CartAttachRepository._();

  final attachRow = const CartAttachRowRepository._();

  final detach = const CartDetachRepository._();

  final detachRow = const CartDetachRowRepository._();

  /// Returns a list of [Cart]s matching the given query parameters.
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
  Future<List<Cart>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartTable>? orderByList,
    _i1.Transaction? transaction,
    CartInclude? include,
  }) async {
    return session.db.find<Cart>(
      where: where?.call(Cart.t),
      orderBy: orderBy?.call(Cart.t),
      orderByList: orderByList?.call(Cart.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Cart] matching the given query parameters.
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
  Future<Cart?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartTable>? where,
    int? offset,
    _i1.OrderByBuilder<CartTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartTable>? orderByList,
    _i1.Transaction? transaction,
    CartInclude? include,
  }) async {
    return session.db.findFirstRow<Cart>(
      where: where?.call(Cart.t),
      orderBy: orderBy?.call(Cart.t),
      orderByList: orderByList?.call(Cart.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Cart] by its [id] or null if no such row exists.
  Future<Cart?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CartInclude? include,
  }) async {
    return session.db.findById<Cart>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Cart]s in the list and returns the inserted rows.
  ///
  /// The returned [Cart]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Cart>> insert(
    _i1.Session session,
    List<Cart> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Cart>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Cart] and returns the inserted row.
  ///
  /// The returned [Cart] will have its `id` field set.
  Future<Cart> insertRow(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Cart>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Cart]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Cart>> update(
    _i1.Session session,
    List<Cart> rows, {
    _i1.ColumnSelections<CartTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Cart>(
      rows,
      columns: columns?.call(Cart.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Cart]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Cart> updateRow(
    _i1.Session session,
    Cart row, {
    _i1.ColumnSelections<CartTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Cart>(
      row,
      columns: columns?.call(Cart.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Cart]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Cart>> delete(
    _i1.Session session,
    List<Cart> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Cart>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Cart].
  Future<Cart> deleteRow(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Cart>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Cart>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CartTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Cart>(
      where: where(Cart.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Cart>(
      where: where?.call(Cart.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CartAttachRepository {
  const CartAttachRepository._();

  /// Creates a relation between this [Cart] and the given [CartItem]s
  /// by setting each [CartItem]'s foreign key `_cartCartitemsCartId` to refer to this [Cart].
  Future<void> cartItems(
    _i1.Session session,
    Cart cart,
    List<_i2.CartItem> cartItem, {
    _i1.Transaction? transaction,
  }) async {
    if (cartItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('cartItem.id');
    }
    if (cart.id == null) {
      throw ArgumentError.notNull('cart.id');
    }

    var $cartItem = cartItem
        .map((e) => _i2.CartItemImplicit(
              e,
              $_cartCartitemsCartId: cart.id,
            ))
        .toList();
    await session.db.update<_i2.CartItem>(
      $cartItem,
      columns: [_i2.CartItem.t.$_cartCartitemsCartId],
      transaction: transaction,
    );
  }
}

class CartAttachRowRepository {
  const CartAttachRowRepository._();

  /// Creates a relation between this [Cart] and the given [CartItem]
  /// by setting the [CartItem]'s foreign key `_cartCartitemsCartId` to refer to this [Cart].
  Future<void> cartItems(
    _i1.Session session,
    Cart cart,
    _i2.CartItem cartItem, {
    _i1.Transaction? transaction,
  }) async {
    if (cartItem.id == null) {
      throw ArgumentError.notNull('cartItem.id');
    }
    if (cart.id == null) {
      throw ArgumentError.notNull('cart.id');
    }

    var $cartItem = _i2.CartItemImplicit(
      cartItem,
      $_cartCartitemsCartId: cart.id,
    );
    await session.db.updateRow<_i2.CartItem>(
      $cartItem,
      columns: [_i2.CartItem.t.$_cartCartitemsCartId],
      transaction: transaction,
    );
  }
}

class CartDetachRepository {
  const CartDetachRepository._();

  /// Detaches the relation between this [Cart] and the given [CartItem]
  /// by setting the [CartItem]'s foreign key `_cartCartitemsCartId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> cartItems(
    _i1.Session session,
    List<_i2.CartItem> cartItem, {
    _i1.Transaction? transaction,
  }) async {
    if (cartItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('cartItem.id');
    }

    var $cartItem = cartItem
        .map((e) => _i2.CartItemImplicit(
              e,
              $_cartCartitemsCartId: null,
            ))
        .toList();
    await session.db.update<_i2.CartItem>(
      $cartItem,
      columns: [_i2.CartItem.t.$_cartCartitemsCartId],
      transaction: transaction,
    );
  }
}

class CartDetachRowRepository {
  const CartDetachRowRepository._();

  /// Detaches the relation between this [Cart] and the given [CartItem]
  /// by setting the [CartItem]'s foreign key `_cartCartitemsCartId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> cartItems(
    _i1.Session session,
    _i2.CartItem cartItem, {
    _i1.Transaction? transaction,
  }) async {
    if (cartItem.id == null) {
      throw ArgumentError.notNull('cartItem.id');
    }

    var $cartItem = _i2.CartItemImplicit(
      cartItem,
      $_cartCartitemsCartId: null,
    );
    await session.db.updateRow<_i2.CartItem>(
      $cartItem,
      columns: [_i2.CartItem.t.$_cartCartitemsCartId],
      transaction: transaction,
    );
  }
}
