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

abstract class MenuItems
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MenuItems._({
    this.id,
    required this.menuId,
    required this.menuItemDesc,
    required this.menuItemImage,
    required this.isActive,
    required this.createdAt,
    required this.productID,
    required this.productDesc,
    required this.price,
  }) : _menuMenuitemsMenuId = null;

  factory MenuItems({
    int? id,
    required int menuId,
    required String menuItemDesc,
    required String menuItemImage,
    required bool isActive,
    required DateTime createdAt,
    required int productID,
    required String productDesc,
    required double price,
  }) = _MenuItemsImpl;

  factory MenuItems.fromJson(Map<String, dynamic> jsonSerialization) {
    return MenuItemsImplicit._(
      id: jsonSerialization['id'] as int?,
      menuId: jsonSerialization['menuId'] as int,
      menuItemDesc: jsonSerialization['menuItemDesc'] as String,
      menuItemImage: jsonSerialization['menuItemImage'] as String,
      isActive: jsonSerialization['isActive'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      productID: jsonSerialization['productID'] as int,
      productDesc: jsonSerialization['productDesc'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      $_menuMenuitemsMenuId: jsonSerialization['_menuMenuitemsMenuId'] as int?,
    );
  }

  static final t = MenuItemsTable();

  static const db = MenuItemsRepository._();

  @override
  int? id;

  int menuId;

  String menuItemDesc;

  String menuItemImage;

  bool isActive;

  DateTime createdAt;

  int productID;

  String productDesc;

  double price;

  final int? _menuMenuitemsMenuId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MenuItems]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MenuItems copyWith({
    int? id,
    int? menuId,
    String? menuItemDesc,
    String? menuItemImage,
    bool? isActive,
    DateTime? createdAt,
    int? productID,
    String? productDesc,
    double? price,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MenuItems',
      if (id != null) 'id': id,
      'menuId': menuId,
      'menuItemDesc': menuItemDesc,
      'menuItemImage': menuItemImage,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'productID': productID,
      'productDesc': productDesc,
      'price': price,
      if (_menuMenuitemsMenuId != null)
        '_menuMenuitemsMenuId': _menuMenuitemsMenuId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MenuItems',
      if (id != null) 'id': id,
      'menuId': menuId,
      'menuItemDesc': menuItemDesc,
      'menuItemImage': menuItemImage,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'productID': productID,
      'productDesc': productDesc,
      'price': price,
    };
  }

  static MenuItemsInclude include() {
    return MenuItemsInclude._();
  }

  static MenuItemsIncludeList includeList({
    _i1.WhereExpressionBuilder<MenuItemsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MenuItemsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MenuItemsTable>? orderByList,
    MenuItemsInclude? include,
  }) {
    return MenuItemsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MenuItems.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MenuItems.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MenuItemsImpl extends MenuItems {
  _MenuItemsImpl({
    int? id,
    required int menuId,
    required String menuItemDesc,
    required String menuItemImage,
    required bool isActive,
    required DateTime createdAt,
    required int productID,
    required String productDesc,
    required double price,
  }) : super._(
         id: id,
         menuId: menuId,
         menuItemDesc: menuItemDesc,
         menuItemImage: menuItemImage,
         isActive: isActive,
         createdAt: createdAt,
         productID: productID,
         productDesc: productDesc,
         price: price,
       );

  /// Returns a shallow copy of this [MenuItems]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MenuItems copyWith({
    Object? id = _Undefined,
    int? menuId,
    String? menuItemDesc,
    String? menuItemImage,
    bool? isActive,
    DateTime? createdAt,
    int? productID,
    String? productDesc,
    double? price,
  }) {
    return MenuItemsImplicit._(
      id: id is int? ? id : this.id,
      menuId: menuId ?? this.menuId,
      menuItemDesc: menuItemDesc ?? this.menuItemDesc,
      menuItemImage: menuItemImage ?? this.menuItemImage,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      productID: productID ?? this.productID,
      productDesc: productDesc ?? this.productDesc,
      price: price ?? this.price,
      $_menuMenuitemsMenuId: this._menuMenuitemsMenuId,
    );
  }
}

class MenuItemsImplicit extends _MenuItemsImpl {
  MenuItemsImplicit._({
    int? id,
    required int menuId,
    required String menuItemDesc,
    required String menuItemImage,
    required bool isActive,
    required DateTime createdAt,
    required int productID,
    required String productDesc,
    required double price,
    int? $_menuMenuitemsMenuId,
  }) : _menuMenuitemsMenuId = $_menuMenuitemsMenuId,
       super(
         id: id,
         menuId: menuId,
         menuItemDesc: menuItemDesc,
         menuItemImage: menuItemImage,
         isActive: isActive,
         createdAt: createdAt,
         productID: productID,
         productDesc: productDesc,
         price: price,
       );

  factory MenuItemsImplicit(
    MenuItems menuItems, {
    int? $_menuMenuitemsMenuId,
  }) {
    return MenuItemsImplicit._(
      id: menuItems.id,
      menuId: menuItems.menuId,
      menuItemDesc: menuItems.menuItemDesc,
      menuItemImage: menuItems.menuItemImage,
      isActive: menuItems.isActive,
      createdAt: menuItems.createdAt,
      productID: menuItems.productID,
      productDesc: menuItems.productDesc,
      price: menuItems.price,
      $_menuMenuitemsMenuId: $_menuMenuitemsMenuId,
    );
  }

  @override
  final int? _menuMenuitemsMenuId;
}

class MenuItemsUpdateTable extends _i1.UpdateTable<MenuItemsTable> {
  MenuItemsUpdateTable(super.table);

  _i1.ColumnValue<int, int> menuId(int value) => _i1.ColumnValue(
    table.menuId,
    value,
  );

  _i1.ColumnValue<String, String> menuItemDesc(String value) => _i1.ColumnValue(
    table.menuItemDesc,
    value,
  );

  _i1.ColumnValue<String, String> menuItemImage(String value) =>
      _i1.ColumnValue(
        table.menuItemImage,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<int, int> productID(int value) => _i1.ColumnValue(
    table.productID,
    value,
  );

  _i1.ColumnValue<String, String> productDesc(String value) => _i1.ColumnValue(
    table.productDesc,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );

  _i1.ColumnValue<int, int> $_menuMenuitemsMenuId(int? value) =>
      _i1.ColumnValue(
        table.$_menuMenuitemsMenuId,
        value,
      );
}

class MenuItemsTable extends _i1.Table<int?> {
  MenuItemsTable({super.tableRelation}) : super(tableName: 'menu_items') {
    updateTable = MenuItemsUpdateTable(this);
    menuId = _i1.ColumnInt(
      'menuId',
      this,
    );
    menuItemDesc = _i1.ColumnString(
      'menuItemDesc',
      this,
    );
    menuItemImage = _i1.ColumnString(
      'menuItemImage',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    productID = _i1.ColumnInt(
      'productID',
      this,
    );
    productDesc = _i1.ColumnString(
      'productDesc',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    $_menuMenuitemsMenuId = _i1.ColumnInt(
      '_menuMenuitemsMenuId',
      this,
    );
  }

  late final MenuItemsUpdateTable updateTable;

  late final _i1.ColumnInt menuId;

  late final _i1.ColumnString menuItemDesc;

  late final _i1.ColumnString menuItemImage;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt productID;

  late final _i1.ColumnString productDesc;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnInt $_menuMenuitemsMenuId;

  @override
  List<_i1.Column> get columns => [
    id,
    menuId,
    menuItemDesc,
    menuItemImage,
    isActive,
    createdAt,
    productID,
    productDesc,
    price,
    $_menuMenuitemsMenuId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    menuId,
    menuItemDesc,
    menuItemImage,
    isActive,
    createdAt,
    productID,
    productDesc,
    price,
  ];
}

class MenuItemsInclude extends _i1.IncludeObject {
  MenuItemsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MenuItems.t;
}

class MenuItemsIncludeList extends _i1.IncludeList {
  MenuItemsIncludeList._({
    _i1.WhereExpressionBuilder<MenuItemsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MenuItems.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MenuItems.t;
}

class MenuItemsRepository {
  const MenuItemsRepository._();

  /// Returns a list of [MenuItems]s matching the given query parameters.
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
  Future<List<MenuItems>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MenuItemsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MenuItemsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MenuItemsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MenuItems>(
      where: where?.call(MenuItems.t),
      orderBy: orderBy?.call(MenuItems.t),
      orderByList: orderByList?.call(MenuItems.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MenuItems] matching the given query parameters.
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
  Future<MenuItems?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MenuItemsTable>? where,
    int? offset,
    _i1.OrderByBuilder<MenuItemsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MenuItemsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MenuItems>(
      where: where?.call(MenuItems.t),
      orderBy: orderBy?.call(MenuItems.t),
      orderByList: orderByList?.call(MenuItems.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MenuItems] by its [id] or null if no such row exists.
  Future<MenuItems?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MenuItems>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MenuItems]s in the list and returns the inserted rows.
  ///
  /// The returned [MenuItems]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MenuItems>> insert(
    _i1.Session session,
    List<MenuItems> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MenuItems>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MenuItems] and returns the inserted row.
  ///
  /// The returned [MenuItems] will have its `id` field set.
  Future<MenuItems> insertRow(
    _i1.Session session,
    MenuItems row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MenuItems>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MenuItems]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MenuItems>> update(
    _i1.Session session,
    List<MenuItems> rows, {
    _i1.ColumnSelections<MenuItemsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MenuItems>(
      rows,
      columns: columns?.call(MenuItems.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MenuItems]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MenuItems> updateRow(
    _i1.Session session,
    MenuItems row, {
    _i1.ColumnSelections<MenuItemsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MenuItems>(
      row,
      columns: columns?.call(MenuItems.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MenuItems] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MenuItems?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MenuItemsUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MenuItems>(
      id,
      columnValues: columnValues(MenuItems.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MenuItems]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MenuItems>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MenuItemsUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MenuItemsTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MenuItemsTable>? orderBy,
    _i1.OrderByListBuilder<MenuItemsTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MenuItems>(
      columnValues: columnValues(MenuItems.t.updateTable),
      where: where(MenuItems.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MenuItems.t),
      orderByList: orderByList?.call(MenuItems.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MenuItems]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MenuItems>> delete(
    _i1.Session session,
    List<MenuItems> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MenuItems>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MenuItems].
  Future<MenuItems> deleteRow(
    _i1.Session session,
    MenuItems row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MenuItems>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MenuItems>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MenuItemsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MenuItems>(
      where: where(MenuItems.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MenuItemsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MenuItems>(
      where: where?.call(MenuItems.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
