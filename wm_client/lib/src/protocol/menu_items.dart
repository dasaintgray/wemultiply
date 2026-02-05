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

abstract class MenuItems implements _i1.SerializableModel {
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
  });

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
    return MenuItems(
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
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int menuId;

  String menuItemDesc;

  String menuItemImage;

  bool isActive;

  DateTime createdAt;

  int productID;

  String productDesc;

  double price;

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
    };
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
    return MenuItems(
      id: id is int? ? id : this.id,
      menuId: menuId ?? this.menuId,
      menuItemDesc: menuItemDesc ?? this.menuItemDesc,
      menuItemImage: menuItemImage ?? this.menuItemImage,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      productID: productID ?? this.productID,
      productDesc: productDesc ?? this.productDesc,
      price: price ?? this.price,
    );
  }
}
