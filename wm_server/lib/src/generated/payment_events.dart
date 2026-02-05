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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class PaymentEvent
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PaymentEvent._({
    this.id,
    required this.paymentId,
    required this.eventType,
    required this.payload,
    required this.createdAt,
  });

  factory PaymentEvent({
    int? id,
    required int paymentId,
    required String eventType,
    required String payload,
    required DateTime createdAt,
  }) = _PaymentEventImpl;

  factory PaymentEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentEvent(
      id: jsonSerialization['id'] as int?,
      paymentId: jsonSerialization['paymentId'] as int,
      eventType: jsonSerialization['eventType'] as String,
      payload: jsonSerialization['payload'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = PaymentEventTable();

  static const db = PaymentEventRepository._();

  @override
  int? id;

  int paymentId;

  String eventType;

  String payload;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PaymentEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentEvent copyWith({
    int? id,
    int? paymentId,
    String? eventType,
    String? payload,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PaymentEvent',
      if (id != null) 'id': id,
      'paymentId': paymentId,
      'eventType': eventType,
      'payload': payload,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PaymentEvent',
      if (id != null) 'id': id,
      'paymentId': paymentId,
      'eventType': eventType,
      'payload': payload,
      'createdAt': createdAt.toJson(),
    };
  }

  static PaymentEventInclude include() {
    return PaymentEventInclude._();
  }

  static PaymentEventIncludeList includeList({
    _i1.WhereExpressionBuilder<PaymentEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentEventTable>? orderByList,
    PaymentEventInclude? include,
  }) {
    return PaymentEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentEvent.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PaymentEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentEventImpl extends PaymentEvent {
  _PaymentEventImpl({
    int? id,
    required int paymentId,
    required String eventType,
    required String payload,
    required DateTime createdAt,
  }) : super._(
         id: id,
         paymentId: paymentId,
         eventType: eventType,
         payload: payload,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [PaymentEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentEvent copyWith({
    Object? id = _Undefined,
    int? paymentId,
    String? eventType,
    String? payload,
    DateTime? createdAt,
  }) {
    return PaymentEvent(
      id: id is int? ? id : this.id,
      paymentId: paymentId ?? this.paymentId,
      eventType: eventType ?? this.eventType,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class PaymentEventUpdateTable extends _i1.UpdateTable<PaymentEventTable> {
  PaymentEventUpdateTable(super.table);

  _i1.ColumnValue<int, int> paymentId(int value) => _i1.ColumnValue(
    table.paymentId,
    value,
  );

  _i1.ColumnValue<String, String> eventType(String value) => _i1.ColumnValue(
    table.eventType,
    value,
  );

  _i1.ColumnValue<String, String> payload(String value) => _i1.ColumnValue(
    table.payload,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class PaymentEventTable extends _i1.Table<int?> {
  PaymentEventTable({super.tableRelation})
    : super(tableName: 'payment_events') {
    updateTable = PaymentEventUpdateTable(this);
    paymentId = _i1.ColumnInt(
      'paymentId',
      this,
    );
    eventType = _i1.ColumnString(
      'eventType',
      this,
    );
    payload = _i1.ColumnString(
      'payload',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final PaymentEventUpdateTable updateTable;

  late final _i1.ColumnInt paymentId;

  late final _i1.ColumnString eventType;

  late final _i1.ColumnString payload;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    paymentId,
    eventType,
    payload,
    createdAt,
  ];
}

class PaymentEventInclude extends _i1.IncludeObject {
  PaymentEventInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => PaymentEvent.t;
}

class PaymentEventIncludeList extends _i1.IncludeList {
  PaymentEventIncludeList._({
    _i1.WhereExpressionBuilder<PaymentEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PaymentEvent.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PaymentEvent.t;
}

class PaymentEventRepository {
  const PaymentEventRepository._();

  /// Returns a list of [PaymentEvent]s matching the given query parameters.
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
  Future<List<PaymentEvent>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PaymentEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentEventTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PaymentEvent>(
      where: where?.call(PaymentEvent.t),
      orderBy: orderBy?.call(PaymentEvent.t),
      orderByList: orderByList?.call(PaymentEvent.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [PaymentEvent] matching the given query parameters.
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
  Future<PaymentEvent?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PaymentEventTable>? where,
    int? offset,
    _i1.OrderByBuilder<PaymentEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentEventTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<PaymentEvent>(
      where: where?.call(PaymentEvent.t),
      orderBy: orderBy?.call(PaymentEvent.t),
      orderByList: orderByList?.call(PaymentEvent.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [PaymentEvent] by its [id] or null if no such row exists.
  Future<PaymentEvent?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<PaymentEvent>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [PaymentEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [PaymentEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PaymentEvent>> insert(
    _i1.Session session,
    List<PaymentEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PaymentEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PaymentEvent] and returns the inserted row.
  ///
  /// The returned [PaymentEvent] will have its `id` field set.
  Future<PaymentEvent> insertRow(
    _i1.Session session,
    PaymentEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PaymentEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PaymentEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PaymentEvent>> update(
    _i1.Session session,
    List<PaymentEvent> rows, {
    _i1.ColumnSelections<PaymentEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PaymentEvent>(
      rows,
      columns: columns?.call(PaymentEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PaymentEvent> updateRow(
    _i1.Session session,
    PaymentEvent row, {
    _i1.ColumnSelections<PaymentEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PaymentEvent>(
      row,
      columns: columns?.call(PaymentEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentEvent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PaymentEvent?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PaymentEventUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PaymentEvent>(
      id,
      columnValues: columnValues(PaymentEvent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PaymentEvent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PaymentEvent>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PaymentEventUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PaymentEventTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentEventTable>? orderBy,
    _i1.OrderByListBuilder<PaymentEventTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PaymentEvent>(
      columnValues: columnValues(PaymentEvent.t.updateTable),
      where: where(PaymentEvent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentEvent.t),
      orderByList: orderByList?.call(PaymentEvent.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PaymentEvent]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PaymentEvent>> delete(
    _i1.Session session,
    List<PaymentEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PaymentEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PaymentEvent].
  Future<PaymentEvent> deleteRow(
    _i1.Session session,
    PaymentEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PaymentEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PaymentEvent>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PaymentEventTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PaymentEvent>(
      where: where(PaymentEvent.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PaymentEventTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PaymentEvent>(
      where: where?.call(PaymentEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
