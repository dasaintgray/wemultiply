/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'cart_items.dart' as _i2;

abstract class Cart implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
