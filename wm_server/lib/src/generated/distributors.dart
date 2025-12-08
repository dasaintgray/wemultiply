/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Distributors
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Distributors._({
    this.id,
    required this.distributorName,
    required this.email,
    required this.userID,
    required this.joinDate,
    required this.currentRankId,
    required this.isActive,
  });

  factory Distributors({
    int? id,
    required String distributorName,
    required String email,
    required int userID,
    required DateTime joinDate,
    required int currentRankId,
    required bool isActive,
  }) = _DistributorsImpl;

  factory Distributors.fromJson(Map<String, dynamic> jsonSerialization) {
    return Distributors(
      id: jsonSerialization['id'] as int?,
      distributorName: jsonSerialization['distributorName'] as String,
      email: jsonSerialization['email'] as String,
      userID: jsonSerialization['userID'] as int,
      joinDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['joinDate']),
      currentRankId: jsonSerialization['currentRankId'] as int,
      isActive: jsonSerialization['isActive'] as bool,
    );
  }

  static final t = DistributorsTable();

  static const db = DistributorsRepository._();

  @override
  int? id;

  String distributorName;

  String email;

  int userID;

  DateTime joinDate;

  int currentRankId;

  bool isActive;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Distributors]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Distributors copyWith({
    int? id,
    String? distributorName,
    String? email,
    int? userID,
    DateTime? joinDate,
    int? currentRankId,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'distributorName': distributorName,
      'email': email,
      'userID': userID,
      'joinDate': joinDate.toJson(),
      'currentRankId': currentRankId,
      'isActive': isActive,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'distributorName': distributorName,
      'email': email,
      'userID': userID,
      'joinDate': joinDate.toJson(),
      'currentRankId': currentRankId,
      'isActive': isActive,
    };
  }

  static DistributorsInclude include() {
    return DistributorsInclude._();
  }

  static DistributorsIncludeList includeList({
    _i1.WhereExpressionBuilder<DistributorsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DistributorsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DistributorsTable>? orderByList,
    DistributorsInclude? include,
  }) {
    return DistributorsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Distributors.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Distributors.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DistributorsImpl extends Distributors {
  _DistributorsImpl({
    int? id,
    required String distributorName,
    required String email,
    required int userID,
    required DateTime joinDate,
    required int currentRankId,
    required bool isActive,
  }) : super._(
          id: id,
          distributorName: distributorName,
          email: email,
          userID: userID,
          joinDate: joinDate,
          currentRankId: currentRankId,
          isActive: isActive,
        );

  /// Returns a shallow copy of this [Distributors]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Distributors copyWith({
    Object? id = _Undefined,
    String? distributorName,
    String? email,
    int? userID,
    DateTime? joinDate,
    int? currentRankId,
    bool? isActive,
  }) {
    return Distributors(
      id: id is int? ? id : this.id,
      distributorName: distributorName ?? this.distributorName,
      email: email ?? this.email,
      userID: userID ?? this.userID,
      joinDate: joinDate ?? this.joinDate,
      currentRankId: currentRankId ?? this.currentRankId,
      isActive: isActive ?? this.isActive,
    );
  }
}

class DistributorsTable extends _i1.Table<int?> {
  DistributorsTable({super.tableRelation}) : super(tableName: 'distributors') {
    distributorName = _i1.ColumnString(
      'distributorName',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    userID = _i1.ColumnInt(
      'userID',
      this,
    );
    joinDate = _i1.ColumnDateTime(
      'joinDate',
      this,
    );
    currentRankId = _i1.ColumnInt(
      'currentRankId',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
  }

  late final _i1.ColumnString distributorName;

  late final _i1.ColumnString email;

  late final _i1.ColumnInt userID;

  late final _i1.ColumnDateTime joinDate;

  late final _i1.ColumnInt currentRankId;

  late final _i1.ColumnBool isActive;

  @override
  List<_i1.Column> get columns => [
        id,
        distributorName,
        email,
        userID,
        joinDate,
        currentRankId,
        isActive,
      ];
}

class DistributorsInclude extends _i1.IncludeObject {
  DistributorsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Distributors.t;
}

class DistributorsIncludeList extends _i1.IncludeList {
  DistributorsIncludeList._({
    _i1.WhereExpressionBuilder<DistributorsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Distributors.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Distributors.t;
}

class DistributorsRepository {
  const DistributorsRepository._();

  /// Returns a list of [Distributors]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Distributors>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DistributorsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DistributorsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DistributorsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Distributors>(
      where: where?.call(Distributors.t),
      orderBy: orderBy?.call(Distributors.t),
      orderByList: orderByList?.call(Distributors.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Distributors] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Distributors?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DistributorsTable>? where,
    int? offset,
    _i1.OrderByBuilder<DistributorsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DistributorsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Distributors>(
      where: where?.call(Distributors.t),
      orderBy: orderBy?.call(Distributors.t),
      orderByList: orderByList?.call(Distributors.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Distributors] by its [id] or null if no such row exists.
  Future<Distributors?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Distributors>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Distributors]s in the list and returns the inserted rows.
  ///
  /// The returned [Distributors]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Distributors>> insert(
    _i1.Session session,
    List<Distributors> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Distributors>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Distributors] and returns the inserted row.
  ///
  /// The returned [Distributors] will have its `id` field set.
  Future<Distributors> insertRow(
    _i1.Session session,
    Distributors row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Distributors>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Distributors]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Distributors>> update(
    _i1.Session session,
    List<Distributors> rows, {
    _i1.ColumnSelections<DistributorsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Distributors>(
      rows,
      columns: columns?.call(Distributors.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Distributors]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Distributors> updateRow(
    _i1.Session session,
    Distributors row, {
    _i1.ColumnSelections<DistributorsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Distributors>(
      row,
      columns: columns?.call(Distributors.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Distributors]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Distributors>> delete(
    _i1.Session session,
    List<Distributors> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Distributors>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Distributors].
  Future<Distributors> deleteRow(
    _i1.Session session,
    Distributors row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Distributors>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Distributors>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DistributorsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Distributors>(
      where: where(Distributors.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DistributorsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Distributors>(
      where: where?.call(Distributors.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
