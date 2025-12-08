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
import 'sale_items.dart' as _i2;

abstract class Sale implements _i1.SerializableModel {
  Sale._({
    this.id,
    required this.saleNumber,
    required this.saleDate,
    required this.buyerId,
    required this.packageId,
    required this.saleType,
    required this.amount,
    required this.status,
    this.salesItems,
  });

  factory Sale({
    int? id,
    required String saleNumber,
    required DateTime saleDate,
    required int buyerId,
    required int packageId,
    required String saleType,
    required double amount,
    required String status,
    List<_i2.SaleItem>? salesItems,
  }) = _SaleImpl;

  factory Sale.fromJson(Map<String, dynamic> jsonSerialization) {
    return Sale(
      id: jsonSerialization['id'] as int?,
      saleNumber: jsonSerialization['saleNumber'] as String,
      saleDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['saleDate']),
      buyerId: jsonSerialization['buyerId'] as int,
      packageId: jsonSerialization['packageId'] as int,
      saleType: jsonSerialization['saleType'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      status: jsonSerialization['status'] as String,
      salesItems: (jsonSerialization['salesItems'] as List?)
          ?.map((e) => _i2.SaleItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String saleNumber;

  DateTime saleDate;

  int buyerId;

  int packageId;

  String saleType;

  double amount;

  String status;

  List<_i2.SaleItem>? salesItems;

  /// Returns a shallow copy of this [Sale]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Sale copyWith({
    int? id,
    String? saleNumber,
    DateTime? saleDate,
    int? buyerId,
    int? packageId,
    String? saleType,
    double? amount,
    String? status,
    List<_i2.SaleItem>? salesItems,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'saleNumber': saleNumber,
      'saleDate': saleDate.toJson(),
      'buyerId': buyerId,
      'packageId': packageId,
      'saleType': saleType,
      'amount': amount,
      'status': status,
      if (salesItems != null)
        'salesItems': salesItems?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SaleImpl extends Sale {
  _SaleImpl({
    int? id,
    required String saleNumber,
    required DateTime saleDate,
    required int buyerId,
    required int packageId,
    required String saleType,
    required double amount,
    required String status,
    List<_i2.SaleItem>? salesItems,
  }) : super._(
          id: id,
          saleNumber: saleNumber,
          saleDate: saleDate,
          buyerId: buyerId,
          packageId: packageId,
          saleType: saleType,
          amount: amount,
          status: status,
          salesItems: salesItems,
        );

  /// Returns a shallow copy of this [Sale]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Sale copyWith({
    Object? id = _Undefined,
    String? saleNumber,
    DateTime? saleDate,
    int? buyerId,
    int? packageId,
    String? saleType,
    double? amount,
    String? status,
    Object? salesItems = _Undefined,
  }) {
    return Sale(
      id: id is int? ? id : this.id,
      saleNumber: saleNumber ?? this.saleNumber,
      saleDate: saleDate ?? this.saleDate,
      buyerId: buyerId ?? this.buyerId,
      packageId: packageId ?? this.packageId,
      saleType: saleType ?? this.saleType,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      salesItems: salesItems is List<_i2.SaleItem>?
          ? salesItems
          : this.salesItems?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
