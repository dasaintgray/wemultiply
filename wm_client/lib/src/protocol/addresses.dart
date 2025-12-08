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

abstract class Addresses implements _i1.SerializableModel {
  Addresses._({
    this.id,
    required this.userId,
    required this.label,
    required this.contactName,
    required this.contactPhone,
    required this.street,
    required this.brgy,
    required this.city,
    required this.province,
    required this.postalCode,
    required this.country,
    required this.isPrimary,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Addresses({
    int? id,
    required int userId,
    required String label,
    required String contactName,
    required String contactPhone,
    required String street,
    required String brgy,
    required String city,
    required String province,
    required String postalCode,
    required String country,
    required bool isPrimary,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AddressesImpl;

  factory Addresses.fromJson(Map<String, dynamic> jsonSerialization) {
    return Addresses(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      label: jsonSerialization['label'] as String,
      contactName: jsonSerialization['contactName'] as String,
      contactPhone: jsonSerialization['contactPhone'] as String,
      street: jsonSerialization['street'] as String,
      brgy: jsonSerialization['brgy'] as String,
      city: jsonSerialization['city'] as String,
      province: jsonSerialization['province'] as String,
      postalCode: jsonSerialization['postalCode'] as String,
      country: jsonSerialization['country'] as String,
      isPrimary: jsonSerialization['isPrimary'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String label;

  String contactName;

  String contactPhone;

  String street;

  String brgy;

  String city;

  String province;

  String postalCode;

  String country;

  bool isPrimary;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Addresses]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Addresses copyWith({
    int? id,
    int? userId,
    String? label,
    String? contactName,
    String? contactPhone,
    String? street,
    String? brgy,
    String? city,
    String? province,
    String? postalCode,
    String? country,
    bool? isPrimary,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'label': label,
      'contactName': contactName,
      'contactPhone': contactPhone,
      'street': street,
      'brgy': brgy,
      'city': city,
      'province': province,
      'postalCode': postalCode,
      'country': country,
      'isPrimary': isPrimary,
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

class _AddressesImpl extends Addresses {
  _AddressesImpl({
    int? id,
    required int userId,
    required String label,
    required String contactName,
    required String contactPhone,
    required String street,
    required String brgy,
    required String city,
    required String province,
    required String postalCode,
    required String country,
    required bool isPrimary,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          label: label,
          contactName: contactName,
          contactPhone: contactPhone,
          street: street,
          brgy: brgy,
          city: city,
          province: province,
          postalCode: postalCode,
          country: country,
          isPrimary: isPrimary,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Addresses]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Addresses copyWith({
    Object? id = _Undefined,
    int? userId,
    String? label,
    String? contactName,
    String? contactPhone,
    String? street,
    String? brgy,
    String? city,
    String? province,
    String? postalCode,
    String? country,
    bool? isPrimary,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Addresses(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      label: label ?? this.label,
      contactName: contactName ?? this.contactName,
      contactPhone: contactPhone ?? this.contactPhone,
      street: street ?? this.street,
      brgy: brgy ?? this.brgy,
      city: city ?? this.city,
      province: province ?? this.province,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      isPrimary: isPrimary ?? this.isPrimary,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
