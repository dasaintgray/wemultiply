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

abstract class CrownPackage implements _i1.SerializableModel {
  CrownPackage._({
    this.id,
    required this.packageId,
    required this.cashBack,
    required this.netProfit,
    required this.profitToWeMultiply,
    required this.profitToCEO,
    required this.profitToFounders,
    required this.profitToMembers,
    required this.profitToTithes,
  });

  factory CrownPackage({
    int? id,
    required int packageId,
    required double cashBack,
    required double netProfit,
    required double profitToWeMultiply,
    required double profitToCEO,
    required double profitToFounders,
    required double profitToMembers,
    required double profitToTithes,
  }) = _CrownPackageImpl;

  factory CrownPackage.fromJson(Map<String, dynamic> jsonSerialization) {
    return CrownPackage(
      id: jsonSerialization['id'] as int?,
      packageId: jsonSerialization['packageId'] as int,
      cashBack: (jsonSerialization['cashBack'] as num).toDouble(),
      netProfit: (jsonSerialization['netProfit'] as num).toDouble(),
      profitToWeMultiply:
          (jsonSerialization['profitToWeMultiply'] as num).toDouble(),
      profitToCEO: (jsonSerialization['profitToCEO'] as num).toDouble(),
      profitToFounders:
          (jsonSerialization['profitToFounders'] as num).toDouble(),
      profitToMembers: (jsonSerialization['profitToMembers'] as num).toDouble(),
      profitToTithes: (jsonSerialization['profitToTithes'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int packageId;

  double cashBack;

  double netProfit;

  double profitToWeMultiply;

  double profitToCEO;

  double profitToFounders;

  double profitToMembers;

  double profitToTithes;

  /// Returns a shallow copy of this [CrownPackage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CrownPackage copyWith({
    int? id,
    int? packageId,
    double? cashBack,
    double? netProfit,
    double? profitToWeMultiply,
    double? profitToCEO,
    double? profitToFounders,
    double? profitToMembers,
    double? profitToTithes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'packageId': packageId,
      'cashBack': cashBack,
      'netProfit': netProfit,
      'profitToWeMultiply': profitToWeMultiply,
      'profitToCEO': profitToCEO,
      'profitToFounders': profitToFounders,
      'profitToMembers': profitToMembers,
      'profitToTithes': profitToTithes,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CrownPackageImpl extends CrownPackage {
  _CrownPackageImpl({
    int? id,
    required int packageId,
    required double cashBack,
    required double netProfit,
    required double profitToWeMultiply,
    required double profitToCEO,
    required double profitToFounders,
    required double profitToMembers,
    required double profitToTithes,
  }) : super._(
          id: id,
          packageId: packageId,
          cashBack: cashBack,
          netProfit: netProfit,
          profitToWeMultiply: profitToWeMultiply,
          profitToCEO: profitToCEO,
          profitToFounders: profitToFounders,
          profitToMembers: profitToMembers,
          profitToTithes: profitToTithes,
        );

  /// Returns a shallow copy of this [CrownPackage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CrownPackage copyWith({
    Object? id = _Undefined,
    int? packageId,
    double? cashBack,
    double? netProfit,
    double? profitToWeMultiply,
    double? profitToCEO,
    double? profitToFounders,
    double? profitToMembers,
    double? profitToTithes,
  }) {
    return CrownPackage(
      id: id is int? ? id : this.id,
      packageId: packageId ?? this.packageId,
      cashBack: cashBack ?? this.cashBack,
      netProfit: netProfit ?? this.netProfit,
      profitToWeMultiply: profitToWeMultiply ?? this.profitToWeMultiply,
      profitToCEO: profitToCEO ?? this.profitToCEO,
      profitToFounders: profitToFounders ?? this.profitToFounders,
      profitToMembers: profitToMembers ?? this.profitToMembers,
      profitToTithes: profitToTithes ?? this.profitToTithes,
    );
  }
}
