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

abstract class MembershipPackage implements _i1.SerializableModel {
  MembershipPackage._({
    this.id,
    required this.name,
    required this.price,
    required this.bottlesIncluded,
    this.cashback,
    this.description,
  });

  factory MembershipPackage({
    int? id,
    required String name,
    required double price,
    required int bottlesIncluded,
    double? cashback,
    String? description,
  }) = _MembershipPackageImpl;

  factory MembershipPackage.fromJson(Map<String, dynamic> jsonSerialization) {
    return MembershipPackage(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      bottlesIncluded: jsonSerialization['bottlesIncluded'] as int,
      cashback: (jsonSerialization['cashback'] as num?)?.toDouble(),
      description: jsonSerialization['description'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  double price;

  int bottlesIncluded;

  double? cashback;

  String? description;

  /// Returns a shallow copy of this [MembershipPackage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MembershipPackage copyWith({
    int? id,
    String? name,
    double? price,
    int? bottlesIncluded,
    double? cashback,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MembershipPackage',
      if (id != null) 'id': id,
      'name': name,
      'price': price,
      'bottlesIncluded': bottlesIncluded,
      if (cashback != null) 'cashback': cashback,
      if (description != null) 'description': description,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MembershipPackageImpl extends MembershipPackage {
  _MembershipPackageImpl({
    int? id,
    required String name,
    required double price,
    required int bottlesIncluded,
    double? cashback,
    String? description,
  }) : super._(
         id: id,
         name: name,
         price: price,
         bottlesIncluded: bottlesIncluded,
         cashback: cashback,
         description: description,
       );

  /// Returns a shallow copy of this [MembershipPackage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MembershipPackage copyWith({
    Object? id = _Undefined,
    String? name,
    double? price,
    int? bottlesIncluded,
    Object? cashback = _Undefined,
    Object? description = _Undefined,
  }) {
    return MembershipPackage(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      bottlesIncluded: bottlesIncluded ?? this.bottlesIncluded,
      cashback: cashback is double? ? cashback : this.cashback,
      description: description is String? ? description : this.description,
    );
  }
}
