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

abstract class Product implements _i1.SerializableModel {
  Product._({
    this.id,
    required this.productName,
    required this.description,
    required this.price,
    required this.stock,
    required this.imageName,
    required this.imageURL,
    required this.isActive,
    required this.createdAt,
    required this.createdBy,
    required this.updatedat,
    required this.updatedBy,
  });

  factory Product({
    int? id,
    required String productName,
    required String description,
    required double price,
    required int stock,
    required String imageName,
    required String imageURL,
    required bool isActive,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedat,
    required String updatedBy,
  }) = _ProductImpl;

  factory Product.fromJson(Map<String, dynamic> jsonSerialization) {
    return Product(
      id: jsonSerialization['id'] as int?,
      productName: jsonSerialization['productName'] as String,
      description: jsonSerialization['description'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      stock: jsonSerialization['stock'] as int,
      imageName: jsonSerialization['imageName'] as String,
      imageURL: jsonSerialization['imageURL'] as String,
      isActive: jsonSerialization['isActive'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      createdBy: jsonSerialization['createdBy'] as String,
      updatedat: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedat'],
      ),
      updatedBy: jsonSerialization['updatedBy'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String productName;

  String description;

  double price;

  int stock;

  String imageName;

  String imageURL;

  bool isActive;

  DateTime createdAt;

  String createdBy;

  DateTime updatedat;

  String updatedBy;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Product copyWith({
    int? id,
    String? productName,
    String? description,
    double? price,
    int? stock,
    String? imageName,
    String? imageURL,
    bool? isActive,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedat,
    String? updatedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Product',
      if (id != null) 'id': id,
      'productName': productName,
      'description': description,
      'price': price,
      'stock': stock,
      'imageName': imageName,
      'imageURL': imageURL,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'createdBy': createdBy,
      'updatedat': updatedat.toJson(),
      'updatedBy': updatedBy,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductImpl extends Product {
  _ProductImpl({
    int? id,
    required String productName,
    required String description,
    required double price,
    required int stock,
    required String imageName,
    required String imageURL,
    required bool isActive,
    required DateTime createdAt,
    required String createdBy,
    required DateTime updatedat,
    required String updatedBy,
  }) : super._(
         id: id,
         productName: productName,
         description: description,
         price: price,
         stock: stock,
         imageName: imageName,
         imageURL: imageURL,
         isActive: isActive,
         createdAt: createdAt,
         createdBy: createdBy,
         updatedat: updatedat,
         updatedBy: updatedBy,
       );

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Product copyWith({
    Object? id = _Undefined,
    String? productName,
    String? description,
    double? price,
    int? stock,
    String? imageName,
    String? imageURL,
    bool? isActive,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedat,
    String? updatedBy,
  }) {
    return Product(
      id: id is int? ? id : this.id,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      imageName: imageName ?? this.imageName,
      imageURL: imageURL ?? this.imageURL,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      updatedat: updatedat ?? this.updatedat,
      updatedBy: updatedBy ?? this.updatedBy,
    );
  }
}
