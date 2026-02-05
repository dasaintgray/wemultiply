/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'menu_items.dart' as _i2;
import 'eula.dart' as _i3;
import 'package:wm_server/src/generated/protocol.dart' as _i4;

abstract class Menu implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Menu._({
    this.id,
    required this.menuName,
    required this.menuImagePath,
    required this.createdAt,
    required this.isActive,
    this.menuItems,
    this.eulaItems,
  });

  factory Menu({
    int? id,
    required String menuName,
    required String menuImagePath,
    required DateTime createdAt,
    required bool isActive,
    List<_i2.MenuItems>? menuItems,
    List<_i3.Eula>? eulaItems,
  }) = _MenuImpl;

  factory Menu.fromJson(Map<String, dynamic> jsonSerialization) {
    return Menu(
      id: jsonSerialization['id'] as int?,
      menuName: jsonSerialization['menuName'] as String,
      menuImagePath: jsonSerialization['menuImagePath'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      isActive: jsonSerialization['isActive'] as bool,
      menuItems: jsonSerialization['menuItems'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i2.MenuItems>>(
              jsonSerialization['menuItems'],
            ),
      eulaItems: jsonSerialization['eulaItems'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.Eula>>(
              jsonSerialization['eulaItems'],
            ),
    );
  }

  static final t = MenuTable();

  static const db = MenuRepository._();

  @override
  int? id;

  String menuName;

  String menuImagePath;

  DateTime createdAt;

  bool isActive;

  List<_i2.MenuItems>? menuItems;

  List<_i3.Eula>? eulaItems;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Menu]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Menu copyWith({
    int? id,
    String? menuName,
    String? menuImagePath,
    DateTime? createdAt,
    bool? isActive,
    List<_i2.MenuItems>? menuItems,
    List<_i3.Eula>? eulaItems,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Menu',
      if (id != null) 'id': id,
      'menuName': menuName,
      'menuImagePath': menuImagePath,
      'createdAt': createdAt.toJson(),
      'isActive': isActive,
      if (menuItems != null)
        'menuItems': menuItems?.toJson(valueToJson: (v) => v.toJson()),
      if (eulaItems != null)
        'eulaItems': eulaItems?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Menu',
      if (id != null) 'id': id,
      'menuName': menuName,
      'menuImagePath': menuImagePath,
      'createdAt': createdAt.toJson(),
      'isActive': isActive,
      if (menuItems != null)
        'menuItems': menuItems?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (eulaItems != null)
        'eulaItems': eulaItems?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static MenuInclude include({
    _i2.MenuItemsIncludeList? menuItems,
    _i3.EulaIncludeList? eulaItems,
  }) {
    return MenuInclude._(
      menuItems: menuItems,
      eulaItems: eulaItems,
    );
  }

  static MenuIncludeList includeList({
    _i1.WhereExpressionBuilder<MenuTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MenuTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MenuTable>? orderByList,
    MenuInclude? include,
  }) {
    return MenuIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Menu.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Menu.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MenuImpl extends Menu {
  _MenuImpl({
    int? id,
    required String menuName,
    required String menuImagePath,
    required DateTime createdAt,
    required bool isActive,
    List<_i2.MenuItems>? menuItems,
    List<_i3.Eula>? eulaItems,
  }) : super._(
         id: id,
         menuName: menuName,
         menuImagePath: menuImagePath,
         createdAt: createdAt,
         isActive: isActive,
         menuItems: menuItems,
         eulaItems: eulaItems,
       );

  /// Returns a shallow copy of this [Menu]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Menu copyWith({
    Object? id = _Undefined,
    String? menuName,
    String? menuImagePath,
    DateTime? createdAt,
    bool? isActive,
    Object? menuItems = _Undefined,
    Object? eulaItems = _Undefined,
  }) {
    return Menu(
      id: id is int? ? id : this.id,
      menuName: menuName ?? this.menuName,
      menuImagePath: menuImagePath ?? this.menuImagePath,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      menuItems: menuItems is List<_i2.MenuItems>?
          ? menuItems
          : this.menuItems?.map((e0) => e0.copyWith()).toList(),
      eulaItems: eulaItems is List<_i3.Eula>?
          ? eulaItems
          : this.eulaItems?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class MenuUpdateTable extends _i1.UpdateTable<MenuTable> {
  MenuUpdateTable(super.table);

  _i1.ColumnValue<String, String> menuName(String value) => _i1.ColumnValue(
    table.menuName,
    value,
  );

  _i1.ColumnValue<String, String> menuImagePath(String value) =>
      _i1.ColumnValue(
        table.menuImagePath,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );
}

class MenuTable extends _i1.Table<int?> {
  MenuTable({super.tableRelation}) : super(tableName: 'menu') {
    updateTable = MenuUpdateTable(this);
    menuName = _i1.ColumnString(
      'menuName',
      this,
    );
    menuImagePath = _i1.ColumnString(
      'menuImagePath',
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

  late final MenuUpdateTable updateTable;

  late final _i1.ColumnString menuName;

  late final _i1.ColumnString menuImagePath;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnBool isActive;

  _i2.MenuItemsTable? ___menuItems;

  _i1.ManyRelation<_i2.MenuItemsTable>? _menuItems;

  _i3.EulaTable? ___eulaItems;

  _i1.ManyRelation<_i3.EulaTable>? _eulaItems;

  _i2.MenuItemsTable get __menuItems {
    if (___menuItems != null) return ___menuItems!;
    ___menuItems = _i1.createRelationTable(
      relationFieldName: '__menuItems',
      field: Menu.t.id,
      foreignField: _i2.MenuItems.t.$_menuMenuitemsMenuId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MenuItemsTable(tableRelation: foreignTableRelation),
    );
    return ___menuItems!;
  }

  _i3.EulaTable get __eulaItems {
    if (___eulaItems != null) return ___eulaItems!;
    ___eulaItems = _i1.createRelationTable(
      relationFieldName: '__eulaItems',
      field: Menu.t.id,
      foreignField: _i3.Eula.t.$_menuEulaitemsMenuId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.EulaTable(tableRelation: foreignTableRelation),
    );
    return ___eulaItems!;
  }

  _i1.ManyRelation<_i2.MenuItemsTable> get menuItems {
    if (_menuItems != null) return _menuItems!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'menuItems',
      field: Menu.t.id,
      foreignField: _i2.MenuItems.t.$_menuMenuitemsMenuId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MenuItemsTable(tableRelation: foreignTableRelation),
    );
    _menuItems = _i1.ManyRelation<_i2.MenuItemsTable>(
      tableWithRelations: relationTable,
      table: _i2.MenuItemsTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _menuItems!;
  }

  _i1.ManyRelation<_i3.EulaTable> get eulaItems {
    if (_eulaItems != null) return _eulaItems!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'eulaItems',
      field: Menu.t.id,
      foreignField: _i3.Eula.t.$_menuEulaitemsMenuId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.EulaTable(tableRelation: foreignTableRelation),
    );
    _eulaItems = _i1.ManyRelation<_i3.EulaTable>(
      tableWithRelations: relationTable,
      table: _i3.EulaTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _eulaItems!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    menuName,
    menuImagePath,
    createdAt,
    isActive,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'menuItems') {
      return __menuItems;
    }
    if (relationField == 'eulaItems') {
      return __eulaItems;
    }
    return null;
  }
}

class MenuInclude extends _i1.IncludeObject {
  MenuInclude._({
    _i2.MenuItemsIncludeList? menuItems,
    _i3.EulaIncludeList? eulaItems,
  }) {
    _menuItems = menuItems;
    _eulaItems = eulaItems;
  }

  _i2.MenuItemsIncludeList? _menuItems;

  _i3.EulaIncludeList? _eulaItems;

  @override
  Map<String, _i1.Include?> get includes => {
    'menuItems': _menuItems,
    'eulaItems': _eulaItems,
  };

  @override
  _i1.Table<int?> get table => Menu.t;
}

class MenuIncludeList extends _i1.IncludeList {
  MenuIncludeList._({
    _i1.WhereExpressionBuilder<MenuTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Menu.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Menu.t;
}

class MenuRepository {
  const MenuRepository._();

  final attach = const MenuAttachRepository._();

  final attachRow = const MenuAttachRowRepository._();

  final detach = const MenuDetachRepository._();

  final detachRow = const MenuDetachRowRepository._();

  /// Returns a list of [Menu]s matching the given query parameters.
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
  Future<List<Menu>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MenuTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MenuTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MenuTable>? orderByList,
    _i1.Transaction? transaction,
    MenuInclude? include,
  }) async {
    return session.db.find<Menu>(
      where: where?.call(Menu.t),
      orderBy: orderBy?.call(Menu.t),
      orderByList: orderByList?.call(Menu.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Menu] matching the given query parameters.
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
  Future<Menu?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MenuTable>? where,
    int? offset,
    _i1.OrderByBuilder<MenuTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MenuTable>? orderByList,
    _i1.Transaction? transaction,
    MenuInclude? include,
  }) async {
    return session.db.findFirstRow<Menu>(
      where: where?.call(Menu.t),
      orderBy: orderBy?.call(Menu.t),
      orderByList: orderByList?.call(Menu.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Menu] by its [id] or null if no such row exists.
  Future<Menu?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MenuInclude? include,
  }) async {
    return session.db.findById<Menu>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Menu]s in the list and returns the inserted rows.
  ///
  /// The returned [Menu]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Menu>> insert(
    _i1.Session session,
    List<Menu> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Menu>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Menu] and returns the inserted row.
  ///
  /// The returned [Menu] will have its `id` field set.
  Future<Menu> insertRow(
    _i1.Session session,
    Menu row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Menu>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Menu]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Menu>> update(
    _i1.Session session,
    List<Menu> rows, {
    _i1.ColumnSelections<MenuTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Menu>(
      rows,
      columns: columns?.call(Menu.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Menu]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Menu> updateRow(
    _i1.Session session,
    Menu row, {
    _i1.ColumnSelections<MenuTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Menu>(
      row,
      columns: columns?.call(Menu.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Menu] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Menu?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MenuUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Menu>(
      id,
      columnValues: columnValues(Menu.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Menu]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Menu>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MenuUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MenuTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MenuTable>? orderBy,
    _i1.OrderByListBuilder<MenuTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Menu>(
      columnValues: columnValues(Menu.t.updateTable),
      where: where(Menu.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Menu.t),
      orderByList: orderByList?.call(Menu.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Menu]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Menu>> delete(
    _i1.Session session,
    List<Menu> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Menu>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Menu].
  Future<Menu> deleteRow(
    _i1.Session session,
    Menu row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Menu>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Menu>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MenuTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Menu>(
      where: where(Menu.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MenuTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Menu>(
      where: where?.call(Menu.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MenuAttachRepository {
  const MenuAttachRepository._();

  /// Creates a relation between this [Menu] and the given [MenuItems]s
  /// by setting each [MenuItems]'s foreign key `_menuMenuitemsMenuId` to refer to this [Menu].
  Future<void> menuItems(
    _i1.Session session,
    Menu menu,
    List<_i2.MenuItems> menuItems, {
    _i1.Transaction? transaction,
  }) async {
    if (menuItems.any((e) => e.id == null)) {
      throw ArgumentError.notNull('menuItems.id');
    }
    if (menu.id == null) {
      throw ArgumentError.notNull('menu.id');
    }

    var $menuItems = menuItems
        .map(
          (e) => _i2.MenuItemsImplicit(
            e,
            $_menuMenuitemsMenuId: menu.id,
          ),
        )
        .toList();
    await session.db.update<_i2.MenuItems>(
      $menuItems,
      columns: [_i2.MenuItems.t.$_menuMenuitemsMenuId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Menu] and the given [Eula]s
  /// by setting each [Eula]'s foreign key `_menuEulaitemsMenuId` to refer to this [Menu].
  Future<void> eulaItems(
    _i1.Session session,
    Menu menu,
    List<_i3.Eula> eula, {
    _i1.Transaction? transaction,
  }) async {
    if (eula.any((e) => e.id == null)) {
      throw ArgumentError.notNull('eula.id');
    }
    if (menu.id == null) {
      throw ArgumentError.notNull('menu.id');
    }

    var $eula = eula
        .map(
          (e) => _i3.EulaImplicit(
            e,
            $_menuEulaitemsMenuId: menu.id,
          ),
        )
        .toList();
    await session.db.update<_i3.Eula>(
      $eula,
      columns: [_i3.Eula.t.$_menuEulaitemsMenuId],
      transaction: transaction,
    );
  }
}

class MenuAttachRowRepository {
  const MenuAttachRowRepository._();

  /// Creates a relation between this [Menu] and the given [MenuItems]
  /// by setting the [MenuItems]'s foreign key `_menuMenuitemsMenuId` to refer to this [Menu].
  Future<void> menuItems(
    _i1.Session session,
    Menu menu,
    _i2.MenuItems menuItems, {
    _i1.Transaction? transaction,
  }) async {
    if (menuItems.id == null) {
      throw ArgumentError.notNull('menuItems.id');
    }
    if (menu.id == null) {
      throw ArgumentError.notNull('menu.id');
    }

    var $menuItems = _i2.MenuItemsImplicit(
      menuItems,
      $_menuMenuitemsMenuId: menu.id,
    );
    await session.db.updateRow<_i2.MenuItems>(
      $menuItems,
      columns: [_i2.MenuItems.t.$_menuMenuitemsMenuId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Menu] and the given [Eula]
  /// by setting the [Eula]'s foreign key `_menuEulaitemsMenuId` to refer to this [Menu].
  Future<void> eulaItems(
    _i1.Session session,
    Menu menu,
    _i3.Eula eula, {
    _i1.Transaction? transaction,
  }) async {
    if (eula.id == null) {
      throw ArgumentError.notNull('eula.id');
    }
    if (menu.id == null) {
      throw ArgumentError.notNull('menu.id');
    }

    var $eula = _i3.EulaImplicit(
      eula,
      $_menuEulaitemsMenuId: menu.id,
    );
    await session.db.updateRow<_i3.Eula>(
      $eula,
      columns: [_i3.Eula.t.$_menuEulaitemsMenuId],
      transaction: transaction,
    );
  }
}

class MenuDetachRepository {
  const MenuDetachRepository._();

  /// Detaches the relation between this [Menu] and the given [MenuItems]
  /// by setting the [MenuItems]'s foreign key `_menuMenuitemsMenuId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> menuItems(
    _i1.Session session,
    List<_i2.MenuItems> menuItems, {
    _i1.Transaction? transaction,
  }) async {
    if (menuItems.any((e) => e.id == null)) {
      throw ArgumentError.notNull('menuItems.id');
    }

    var $menuItems = menuItems
        .map(
          (e) => _i2.MenuItemsImplicit(
            e,
            $_menuMenuitemsMenuId: null,
          ),
        )
        .toList();
    await session.db.update<_i2.MenuItems>(
      $menuItems,
      columns: [_i2.MenuItems.t.$_menuMenuitemsMenuId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Menu] and the given [Eula]
  /// by setting the [Eula]'s foreign key `_menuEulaitemsMenuId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> eulaItems(
    _i1.Session session,
    List<_i3.Eula> eula, {
    _i1.Transaction? transaction,
  }) async {
    if (eula.any((e) => e.id == null)) {
      throw ArgumentError.notNull('eula.id');
    }

    var $eula = eula
        .map(
          (e) => _i3.EulaImplicit(
            e,
            $_menuEulaitemsMenuId: null,
          ),
        )
        .toList();
    await session.db.update<_i3.Eula>(
      $eula,
      columns: [_i3.Eula.t.$_menuEulaitemsMenuId],
      transaction: transaction,
    );
  }
}

class MenuDetachRowRepository {
  const MenuDetachRowRepository._();

  /// Detaches the relation between this [Menu] and the given [MenuItems]
  /// by setting the [MenuItems]'s foreign key `_menuMenuitemsMenuId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> menuItems(
    _i1.Session session,
    _i2.MenuItems menuItems, {
    _i1.Transaction? transaction,
  }) async {
    if (menuItems.id == null) {
      throw ArgumentError.notNull('menuItems.id');
    }

    var $menuItems = _i2.MenuItemsImplicit(
      menuItems,
      $_menuMenuitemsMenuId: null,
    );
    await session.db.updateRow<_i2.MenuItems>(
      $menuItems,
      columns: [_i2.MenuItems.t.$_menuMenuitemsMenuId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Menu] and the given [Eula]
  /// by setting the [Eula]'s foreign key `_menuEulaitemsMenuId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> eulaItems(
    _i1.Session session,
    _i3.Eula eula, {
    _i1.Transaction? transaction,
  }) async {
    if (eula.id == null) {
      throw ArgumentError.notNull('eula.id');
    }

    var $eula = _i3.EulaImplicit(
      eula,
      $_menuEulaitemsMenuId: null,
    );
    await session.db.updateRow<_i3.Eula>(
      $eula,
      columns: [_i3.Eula.t.$_menuEulaitemsMenuId],
      transaction: transaction,
    );
  }
}
