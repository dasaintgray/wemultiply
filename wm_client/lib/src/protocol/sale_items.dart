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

abstract class SaleItem implements _i1.SerializableModel {
  SaleItem._({
    this.id,
    required this.saleId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.lineTotal,
  });

  factory SaleItem({
    int? id,
    required int saleId,
    required int productId,
    required String productName,
    required int quantity,
    required double price,
    required double lineTotal,
  }) = _SaleItemImpl;

  factory SaleItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return SaleItem(
      id: jsonSerialization['id'] as int?,
      saleId: jsonSerialization['saleId'] as int,
      productId: jsonSerialization['productId'] as int,
      productName: jsonSerialization['productName'] as String,
      quantity: jsonSerialization['quantity'] as int,
      price: (jsonSerialization['price'] as num).toDouble(),
      lineTotal: (jsonSerialization['lineTotal'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int saleId;

  int productId;

  String productName;

  int quantity;

  double price;

  double lineTotal;

  /// Returns a shallow copy of this [SaleItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SaleItem copyWith({
    int? id,
    int? saleId,
    int? productId,
    String? productName,
    int? quantity,
    double? price,
    double? lineTotal,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SaleItem',
      if (id != null) 'id': id,
      'saleId': saleId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'lineTotal': lineTotal,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SaleItemImpl extends SaleItem {
  _SaleItemImpl({
    int? id,
    required int saleId,
    required int productId,
    required String productName,
    required int quantity,
    required double price,
    required double lineTotal,
  }) : super._(
         id: id,
         saleId: saleId,
         productId: productId,
         productName: productName,
         quantity: quantity,
         price: price,
         lineTotal: lineTotal,
       );

  /// Returns a shallow copy of this [SaleItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SaleItem copyWith({
    Object? id = _Undefined,
    int? saleId,
    int? productId,
    String? productName,
    int? quantity,
    double? price,
    double? lineTotal,
  }) {
    return SaleItem(
      id: id is int? ? id : this.id,
      saleId: saleId ?? this.saleId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      lineTotal: lineTotal ?? this.lineTotal,
    );
  }
}
