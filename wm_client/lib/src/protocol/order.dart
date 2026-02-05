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
import 'order_items.dart' as _i2;
import 'package:wm_client/src/protocol/protocol.dart' as _i3;

abstract class Order implements _i1.SerializableModel {
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
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      orderItems: jsonSerialization['orderItems'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.OrderItem>>(
              jsonSerialization['orderItems'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
      '__className__': 'Order',
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
