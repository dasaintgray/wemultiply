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

abstract class Cdnconfig implements _i1.SerializableModel {
  Cdnconfig._({
    this.id,
    required this.type,
    required this.domain,
    required this.urlpath,
  });

  factory Cdnconfig({
    int? id,
    required String type,
    required String domain,
    required String urlpath,
  }) = _CdnconfigImpl;

  factory Cdnconfig.fromJson(Map<String, dynamic> jsonSerialization) {
    return Cdnconfig(
      id: jsonSerialization['id'] as int?,
      type: jsonSerialization['type'] as String,
      domain: jsonSerialization['domain'] as String,
      urlpath: jsonSerialization['urlpath'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String type;

  String domain;

  String urlpath;

  /// Returns a shallow copy of this [Cdnconfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Cdnconfig copyWith({
    int? id,
    String? type,
    String? domain,
    String? urlpath,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Cdnconfig',
      if (id != null) 'id': id,
      'type': type,
      'domain': domain,
      'urlpath': urlpath,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CdnconfigImpl extends Cdnconfig {
  _CdnconfigImpl({
    int? id,
    required String type,
    required String domain,
    required String urlpath,
  }) : super._(
         id: id,
         type: type,
         domain: domain,
         urlpath: urlpath,
       );

  /// Returns a shallow copy of this [Cdnconfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Cdnconfig copyWith({
    Object? id = _Undefined,
    String? type,
    String? domain,
    String? urlpath,
  }) {
    return Cdnconfig(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      domain: domain ?? this.domain,
      urlpath: urlpath ?? this.urlpath,
    );
  }
}
