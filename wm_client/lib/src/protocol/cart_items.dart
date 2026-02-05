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

abstract class CartItem implements _i1.SerializableModel {
  CartItem._({
    this.id,
    required this.cartId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
  });

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
    return CartItem(
      id: jsonSerialization['id'] as int?,
      cartId: jsonSerialization['cartId'] as int,
      productId: jsonSerialization['productId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      totalPrice: (jsonSerialization['totalPrice'] as num).toDouble(),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int cartId;

  int productId;

  int quantity;

  double unitPrice;

  double totalPrice;

  DateTime createdAt;

  DateTime updatedAt;

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
      '__className__': 'CartItem',
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
    return CartItem(
      id: id is int? ? id : this.id,
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
