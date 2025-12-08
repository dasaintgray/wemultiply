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

abstract class Eula implements _i1.SerializableModel {
  Eula._({
    this.id,
    required this.menuId,
    required this.documentType,
    required this.content,
    required this.version,
    required this.effectiveDate,
    required this.isActive,
    required this.language,
  });

  factory Eula({
    int? id,
    required int menuId,
    required String documentType,
    required String content,
    required String version,
    required DateTime effectiveDate,
    required bool isActive,
    required String language,
  }) = _EulaImpl;

  factory Eula.fromJson(Map<String, dynamic> jsonSerialization) {
    return Eula(
      id: jsonSerialization['id'] as int?,
      menuId: jsonSerialization['menuId'] as int,
      documentType: jsonSerialization['documentType'] as String,
      content: jsonSerialization['content'] as String,
      version: jsonSerialization['version'] as String,
      effectiveDate: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['effectiveDate']),
      isActive: jsonSerialization['isActive'] as bool,
      language: jsonSerialization['language'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int menuId;

  String documentType;

  String content;

  String version;

  DateTime effectiveDate;

  bool isActive;

  String language;

  /// Returns a shallow copy of this [Eula]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Eula copyWith({
    int? id,
    int? menuId,
    String? documentType,
    String? content,
    String? version,
    DateTime? effectiveDate,
    bool? isActive,
    String? language,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'menuId': menuId,
      'documentType': documentType,
      'content': content,
      'version': version,
      'effectiveDate': effectiveDate.toJson(),
      'isActive': isActive,
      'language': language,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EulaImpl extends Eula {
  _EulaImpl({
    int? id,
    required int menuId,
    required String documentType,
    required String content,
    required String version,
    required DateTime effectiveDate,
    required bool isActive,
    required String language,
  }) : super._(
          id: id,
          menuId: menuId,
          documentType: documentType,
          content: content,
          version: version,
          effectiveDate: effectiveDate,
          isActive: isActive,
          language: language,
        );

  /// Returns a shallow copy of this [Eula]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Eula copyWith({
    Object? id = _Undefined,
    int? menuId,
    String? documentType,
    String? content,
    String? version,
    DateTime? effectiveDate,
    bool? isActive,
    String? language,
  }) {
    return Eula(
      id: id is int? ? id : this.id,
      menuId: menuId ?? this.menuId,
      documentType: documentType ?? this.documentType,
      content: content ?? this.content,
      version: version ?? this.version,
      effectiveDate: effectiveDate ?? this.effectiveDate,
      isActive: isActive ?? this.isActive,
      language: language ?? this.language,
    );
  }
}
