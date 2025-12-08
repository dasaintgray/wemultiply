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

abstract class GoldenSeats implements _i1.SerializableModel {
  GoldenSeats._({
    this.id,
    required this.seatType,
    required this.territory,
    required this.ownerId,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });

  factory GoldenSeats({
    int? id,
    required String seatType,
    required String territory,
    required int ownerId,
    required double price,
    required DateTime startDate,
    required DateTime endDate,
    required bool isActive,
  }) = _GoldenSeatsImpl;

  factory GoldenSeats.fromJson(Map<String, dynamic> jsonSerialization) {
    return GoldenSeats(
      id: jsonSerialization['id'] as int?,
      seatType: jsonSerialization['seatType'] as String,
      territory: jsonSerialization['territory'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      price: (jsonSerialization['price'] as num).toDouble(),
      startDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      isActive: jsonSerialization['isActive'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String seatType;

  String territory;

  int ownerId;

  double price;

  DateTime startDate;

  DateTime endDate;

  bool isActive;

  /// Returns a shallow copy of this [GoldenSeats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GoldenSeats copyWith({
    int? id,
    String? seatType,
    String? territory,
    int? ownerId,
    double? price,
    DateTime? startDate,
    DateTime? endDate,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'seatType': seatType,
      'territory': territory,
      'ownerId': ownerId,
      'price': price,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'isActive': isActive,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GoldenSeatsImpl extends GoldenSeats {
  _GoldenSeatsImpl({
    int? id,
    required String seatType,
    required String territory,
    required int ownerId,
    required double price,
    required DateTime startDate,
    required DateTime endDate,
    required bool isActive,
  }) : super._(
          id: id,
          seatType: seatType,
          territory: territory,
          ownerId: ownerId,
          price: price,
          startDate: startDate,
          endDate: endDate,
          isActive: isActive,
        );

  /// Returns a shallow copy of this [GoldenSeats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GoldenSeats copyWith({
    Object? id = _Undefined,
    String? seatType,
    String? territory,
    int? ownerId,
    double? price,
    DateTime? startDate,
    DateTime? endDate,
    bool? isActive,
  }) {
    return GoldenSeats(
      id: id is int? ? id : this.id,
      seatType: seatType ?? this.seatType,
      territory: territory ?? this.territory,
      ownerId: ownerId ?? this.ownerId,
      price: price ?? this.price,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
    );
  }
}
