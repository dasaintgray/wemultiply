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

abstract class Level implements _i1.SerializableModel {
  Level._({
    this.id,
    required this.levelName,
    this.description,
    required this.isActive,
    required this.createdAt,
  });

  factory Level({
    int? id,
    required String levelName,
    String? description,
    required bool isActive,
    required DateTime createdAt,
  }) = _LevelImpl;

  factory Level.fromJson(Map<String, dynamic> jsonSerialization) {
    return Level(
      id: jsonSerialization['id'] as int?,
      levelName: jsonSerialization['levelName'] as String,
      description: jsonSerialization['description'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String levelName;

  String? description;

  bool isActive;

  DateTime createdAt;

  /// Returns a shallow copy of this [Level]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Level copyWith({
    int? id,
    String? levelName,
    String? description,
    bool? isActive,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Level',
      if (id != null) 'id': id,
      'levelName': levelName,
      if (description != null) 'description': description,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LevelImpl extends Level {
  _LevelImpl({
    int? id,
    required String levelName,
    String? description,
    required bool isActive,
    required DateTime createdAt,
  }) : super._(
         id: id,
         levelName: levelName,
         description: description,
         isActive: isActive,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Level]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Level copyWith({
    Object? id = _Undefined,
    String? levelName,
    Object? description = _Undefined,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return Level(
      id: id is int? ? id : this.id,
      levelName: levelName ?? this.levelName,
      description: description is String? ? description : this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
