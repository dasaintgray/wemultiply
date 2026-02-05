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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'menu_items.dart' as _i2;
import 'eula.dart' as _i3;
import 'package:wm_client/src/protocol/protocol.dart' as _i4;

abstract class Menu implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String menuName;

  String menuImagePath;

  DateTime createdAt;

  bool isActive;

  List<_i2.MenuItems>? menuItems;

  List<_i3.Eula>? eulaItems;

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
