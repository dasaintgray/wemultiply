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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'addresses.dart' as _i4;
import 'cart.dart' as _i5;
import 'cart_items.dart' as _i6;
import 'cdn.dart' as _i7;
import 'commission_rule.dart' as _i8;
import 'commissions.dart' as _i9;
import 'crown_package.dart' as _i10;
import 'distributors.dart' as _i11;
import 'eula.dart' as _i12;
import 'future_calls_generated_models/birthday_reminder_send_reminder_model.dart'
    as _i13;
import 'golden_seat_commissions.dart' as _i14;
import 'golden_seats.dart' as _i15;
import 'greeting.dart' as _i16;
import 'level.dart' as _i17;
import 'membership_package.dart' as _i18;
import 'menu.dart' as _i19;
import 'menu_items.dart' as _i20;
import 'order.dart' as _i21;
import 'order_items.dart' as _i22;
import 'packages.dart' as _i23;
import 'payment_events.dart' as _i24;
import 'payment_response.dart' as _i25;
import 'payments.dart' as _i26;
import 'pioneer_accounts.dart' as _i27;
import 'products.dart' as _i28;
import 'profit_sharing.dart' as _i29;
import 'rank_category.dart' as _i30;
import 'ranks.dart' as _i31;
import 'reaper_commissions.dart' as _i32;
import 'sale.dart' as _i33;
import 'sale_items.dart' as _i34;
import 'userinfo.dart' as _i35;
import 'users.dart' as _i36;
import 'package:wm_server/src/generated/addresses.dart' as _i37;
import 'package:wm_server/src/generated/cart.dart' as _i38;
import 'package:wm_server/src/generated/commissions.dart' as _i39;
import 'package:wm_server/src/generated/commission_rule.dart' as _i40;
import 'package:wm_server/src/generated/distributors.dart' as _i41;
import 'package:wm_server/src/generated/golden_seats.dart' as _i42;
import 'package:wm_server/src/generated/membership_package.dart' as _i43;
import 'package:wm_server/src/generated/menu.dart' as _i44;
import 'package:wm_server/src/generated/packages.dart' as _i45;
import 'package:wm_server/src/generated/products.dart' as _i46;
import 'package:wm_server/src/generated/ranks.dart' as _i47;
import 'package:wm_server/src/generated/reaper_commissions.dart' as _i48;
import 'package:wm_server/src/generated/sale.dart' as _i49;
export 'addresses.dart';
export 'cart.dart';
export 'cart_items.dart';
export 'cdn.dart';
export 'commission_rule.dart';
export 'commissions.dart';
export 'crown_package.dart';
export 'distributors.dart';
export 'eula.dart';
export 'golden_seat_commissions.dart';
export 'golden_seats.dart';
export 'greeting.dart';
export 'level.dart';
export 'membership_package.dart';
export 'menu.dart';
export 'menu_items.dart';
export 'order.dart';
export 'order_items.dart';
export 'packages.dart';
export 'payment_events.dart';
export 'payment_response.dart';
export 'payments.dart';
export 'pioneer_accounts.dart';
export 'products.dart';
export 'profit_sharing.dart';
export 'rank_category.dart';
export 'ranks.dart';
export 'reaper_commissions.dart';
export 'sale.dart';
export 'sale_items.dart';
export 'userinfo.dart';
export 'users.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'addresses',
      dartName: 'Addresses',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'addresses_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'label',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'contactName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'contactPhone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'street',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'brgy',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'city',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'province',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'postalCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'country',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'latitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'longitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'isPrimary',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'addresses_fk_0',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'addresses_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'cart',
      dartName: 'Cart',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'cart_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userID',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'currency',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'totalItems',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'subtotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'discountTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'taxTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'shippingTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'grandTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'couponCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'notes',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'cart_fk_0',
          columns: ['userID'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'cart_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'cart_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userID',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'cart_items',
      dartName: 'CartItem',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'cart_items_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'cartId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'quantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'unitPrice',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'totalPrice',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: '_cartCartitemsCartId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'cart_items_fk_0',
          columns: ['cartId'],
          referenceTable: 'cart',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'cart_items_fk_1',
          columns: ['productId'],
          referenceTable: 'products',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'cart_items_fk_2',
          columns: ['_cartCartitemsCartId'],
          referenceTable: 'cart',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'cart_items_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'cart_item_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'cartId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'productId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'cdnconfig',
      dartName: 'Cdnconfig',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'cdnconfig_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'domain',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'urlpath',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'cdnconfig_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'commission_rules',
      dartName: 'CommissionRule',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'commission_rules_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'rankId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'level',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'commissionRate',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'commissionType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'commission_rules_fk_0',
          columns: ['rankId'],
          referenceTable: 'ranks',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'commission_rules_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'commissions',
      dartName: 'Commissions',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'commissions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'saleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'recipientId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'sourceLevel',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'commissionType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'commissionAmount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'isPaid',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'paidAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'commissions_fk_0',
          columns: ['saleId'],
          referenceTable: 'sale',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'commissions_fk_1',
          columns: ['recipientId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'commissions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'crown_packages',
      dartName: 'CrownPackage',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'crown_packages_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'packageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'cashBack',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'netProfit',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'profitToWeMultiply',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'profitToCEO',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'profitToFounders',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'profitToMembers',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'profitToTithes',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'crown_packages_fk_0',
          columns: ['packageId'],
          referenceTable: 'membership_packages',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'crown_packages_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'idx_crown_packages_packageid',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'packageId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'distributors',
      dartName: 'Distributors',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'distributors_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'distributorName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userID',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'joinDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'currentRankId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'distributors_fk_0',
          columns: ['userID'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'distributors_fk_1',
          columns: ['currentRankId'],
          referenceTable: 'ranks',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'distributors_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'eula',
      dartName: 'Eula',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'eula_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'menuId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'documentType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'version',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'effectiveDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'language',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: '_menuEulaitemsMenuId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'eula_fk_0',
          columns: ['_menuEulaitemsMenuId'],
          referenceTable: 'menu',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'eula_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'document_type_version_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'documentType',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'version',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'language',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'golden_seat_commissions',
      dartName: 'GoldenSeatCommission',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'golden_seat_commissions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'seatType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'packageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'netPerMember',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'netPerBottle',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'commissionAmount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'golden_seat_commissions_fk_0',
          columns: ['packageId'],
          referenceTable: 'membership_packages',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'golden_seat_commissions_fk_1',
          columns: ['productId'],
          referenceTable: 'products',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'golden_seat_commissions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'idx_golden_seat_commissions_seattype_package_product',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'seatType',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'packageId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'productId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'golden_seats',
      dartName: 'GoldenSeats',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'golden_seats_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'seatType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'territory',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'startDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'endDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'golden_seats_fk_0',
          columns: ['ownerId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'golden_seats_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'seat_type_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'seatType',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'territory',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'levels',
      dartName: 'Level',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'levels_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'levelName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'levels_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'membership_packages',
      dartName: 'MembershipPackage',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'membership_packages_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'bottlesIncluded',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'cashback',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'membership_packages_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'idx_membership_packages_name',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'menu',
      dartName: 'Menu',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'menu_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'menuName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'menuImagePath',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'menu_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'menu_items',
      dartName: 'MenuItems',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'menu_items_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'menuId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'menuItemDesc',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'menuItemImage',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'productID',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productDesc',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: '_menuMenuitemsMenuId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'menu_items_fk_0',
          columns: ['menuId'],
          referenceTable: 'menu',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'menu_items_fk_1',
          columns: ['_menuMenuitemsMenuId'],
          referenceTable: 'menu',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'menu_items_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'order_items',
      dartName: 'OrderItem',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'order_items_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'quantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'unitPrice',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'totalPrice',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: '_ordersOrderitemsOrdersId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'order_items_fk_0',
          columns: ['orderId'],
          referenceTable: 'orders',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'order_items_fk_1',
          columns: ['productId'],
          referenceTable: 'products',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'order_items_fk_2',
          columns: ['_ordersOrderitemsOrdersId'],
          referenceTable: 'orders',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'order_items_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'order_item_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'orderId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'productId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'orders',
      dartName: 'Order',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'orders_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userID',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'cartId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'currency',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'subtotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'taxTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'shippingTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'discountTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'grandTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'paymentMethod',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_0',
          columns: ['userID'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_1',
          columns: ['cartId'],
          referenceTable: 'cart',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'orders_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'order_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userID',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'packages',
      dartName: 'Package',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'packages_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'packageName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'packageDescription',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'membershipFee',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdBy',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedBy',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'packages_fk_0',
          columns: ['productId'],
          referenceTable: 'products',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'packages_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'payment_events',
      dartName: 'PaymentEvent',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'payment_events_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'paymentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'eventType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'payload',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'payment_events_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'payments',
      dartName: 'Payment',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'payments_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'externalId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'channel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'currency',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'metadata',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'payments_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'pioneer_accounts',
      dartName: 'PioneerAccounts',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'pioneer_accounts_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gsID',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'pioneerCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isRedeemed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'redeemedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'pioneer_accounts_fk_0',
          columns: ['gsID'],
          referenceTable: 'golden_seats',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'pioneer_accounts_fk_1',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'pioneer_accounts_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'products',
      dartName: 'Product',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'products_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'productName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'stock',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'imageName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imageURL',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdBy',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'updatedat',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedBy',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'products_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'product_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'product_name_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'productName',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'profit_sharing',
      dartName: 'ProfitSharing',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'profit_sharing_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'profitType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'percentage',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'effectiveDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'profit_sharing_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'rank_category',
      dartName: 'RankCategory',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'rank_category_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'rankName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'rank_category_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ranks',
      dartName: 'Ranks',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ranks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'rankName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'rankCategoryID',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'minPersonalSalesTarget',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'minGroupSalesTarget',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'minDirectRecruits',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ranks_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'reaper_commissions',
      dartName: 'ReaperCommission',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'reaper_commissions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'packageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'level',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'netPerMember',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'repeatOrderNet',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'ronDescription',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdBy',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedBy',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: '_packagesPackageidPackagesId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'reaper_commissions_fk_0',
          columns: ['packageId'],
          referenceTable: 'packages',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'reaper_commissions_fk_1',
          columns: ['level'],
          referenceTable: 'levels',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'reaper_commissions_fk_2',
          columns: ['productId'],
          referenceTable: 'products',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'reaper_commissions_fk_3',
          columns: ['_packagesPackageidPackagesId'],
          referenceTable: 'packages',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'reaper_commissions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'sale',
      dartName: 'Sale',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'sale_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'saleNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'saleDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'buyerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'packageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'saleType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'sale_fk_0',
          columns: ['buyerId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'sale_fk_1',
          columns: ['packageId'],
          referenceTable: 'membership_packages',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'sale_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'sale_items',
      dartName: 'SaleItem',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'sale_items_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'saleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'quantity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'lineTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: '_saleSalesitemsSaleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'sale_items_fk_0',
          columns: ['saleId'],
          referenceTable: 'sale',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'sale_items_fk_1',
          columns: ['productId'],
          referenceTable: 'products',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'sale_items_fk_2',
          columns: ['_saleSalesitemsSaleId'],
          referenceTable: 'sale',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'sale_items_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'users',
      dartName: 'User',
      schema: 'public',
      module: 'wm',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'users_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'middleName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'passwordHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'referrerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'level',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'addressId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'joinDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'isPioneer',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'membershipPackageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'longtitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'latitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'isUpgraded',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'upgradedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastLoginAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'users_fk_0',
          columns: ['addressId'],
          referenceTable: 'addresses',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'users_fk_1',
          columns: ['membershipPackageId'],
          referenceTable: 'membership_packages',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'users_fk_2',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'users_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'users_email_index',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i4.Addresses) {
      return _i4.Addresses.fromJson(data) as T;
    }
    if (t == _i5.Cart) {
      return _i5.Cart.fromJson(data) as T;
    }
    if (t == _i6.CartItem) {
      return _i6.CartItem.fromJson(data) as T;
    }
    if (t == _i7.Cdnconfig) {
      return _i7.Cdnconfig.fromJson(data) as T;
    }
    if (t == _i8.CommissionRule) {
      return _i8.CommissionRule.fromJson(data) as T;
    }
    if (t == _i9.Commissions) {
      return _i9.Commissions.fromJson(data) as T;
    }
    if (t == _i10.CrownPackage) {
      return _i10.CrownPackage.fromJson(data) as T;
    }
    if (t == _i11.Distributors) {
      return _i11.Distributors.fromJson(data) as T;
    }
    if (t == _i12.Eula) {
      return _i12.Eula.fromJson(data) as T;
    }
    if (t == _i13.BirthdayReminderSendReminderModel) {
      return _i13.BirthdayReminderSendReminderModel.fromJson(data) as T;
    }
    if (t == _i14.GoldenSeatCommission) {
      return _i14.GoldenSeatCommission.fromJson(data) as T;
    }
    if (t == _i15.GoldenSeats) {
      return _i15.GoldenSeats.fromJson(data) as T;
    }
    if (t == _i16.Greeting) {
      return _i16.Greeting.fromJson(data) as T;
    }
    if (t == _i17.Level) {
      return _i17.Level.fromJson(data) as T;
    }
    if (t == _i18.MembershipPackage) {
      return _i18.MembershipPackage.fromJson(data) as T;
    }
    if (t == _i19.Menu) {
      return _i19.Menu.fromJson(data) as T;
    }
    if (t == _i20.MenuItems) {
      return _i20.MenuItems.fromJson(data) as T;
    }
    if (t == _i21.Order) {
      return _i21.Order.fromJson(data) as T;
    }
    if (t == _i22.OrderItem) {
      return _i22.OrderItem.fromJson(data) as T;
    }
    if (t == _i23.Package) {
      return _i23.Package.fromJson(data) as T;
    }
    if (t == _i24.PaymentEvent) {
      return _i24.PaymentEvent.fromJson(data) as T;
    }
    if (t == _i25.PaymentResponse) {
      return _i25.PaymentResponse.fromJson(data) as T;
    }
    if (t == _i26.Payment) {
      return _i26.Payment.fromJson(data) as T;
    }
    if (t == _i27.PioneerAccounts) {
      return _i27.PioneerAccounts.fromJson(data) as T;
    }
    if (t == _i28.Product) {
      return _i28.Product.fromJson(data) as T;
    }
    if (t == _i29.ProfitSharing) {
      return _i29.ProfitSharing.fromJson(data) as T;
    }
    if (t == _i30.RankCategory) {
      return _i30.RankCategory.fromJson(data) as T;
    }
    if (t == _i31.Ranks) {
      return _i31.Ranks.fromJson(data) as T;
    }
    if (t == _i32.ReaperCommission) {
      return _i32.ReaperCommission.fromJson(data) as T;
    }
    if (t == _i33.Sale) {
      return _i33.Sale.fromJson(data) as T;
    }
    if (t == _i34.SaleItem) {
      return _i34.SaleItem.fromJson(data) as T;
    }
    if (t == _i35.UserInfo) {
      return _i35.UserInfo.fromJson(data) as T;
    }
    if (t == _i36.User) {
      return _i36.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Addresses?>()) {
      return (data != null ? _i4.Addresses.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Cart?>()) {
      return (data != null ? _i5.Cart.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CartItem?>()) {
      return (data != null ? _i6.CartItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Cdnconfig?>()) {
      return (data != null ? _i7.Cdnconfig.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CommissionRule?>()) {
      return (data != null ? _i8.CommissionRule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Commissions?>()) {
      return (data != null ? _i9.Commissions.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.CrownPackage?>()) {
      return (data != null ? _i10.CrownPackage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Distributors?>()) {
      return (data != null ? _i11.Distributors.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Eula?>()) {
      return (data != null ? _i12.Eula.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.BirthdayReminderSendReminderModel?>()) {
      return (data != null
              ? _i13.BirthdayReminderSendReminderModel.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.GoldenSeatCommission?>()) {
      return (data != null ? _i14.GoldenSeatCommission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.GoldenSeats?>()) {
      return (data != null ? _i15.GoldenSeats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Greeting?>()) {
      return (data != null ? _i16.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Level?>()) {
      return (data != null ? _i17.Level.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.MembershipPackage?>()) {
      return (data != null ? _i18.MembershipPackage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Menu?>()) {
      return (data != null ? _i19.Menu.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.MenuItems?>()) {
      return (data != null ? _i20.MenuItems.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Order?>()) {
      return (data != null ? _i21.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.OrderItem?>()) {
      return (data != null ? _i22.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Package?>()) {
      return (data != null ? _i23.Package.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.PaymentEvent?>()) {
      return (data != null ? _i24.PaymentEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.PaymentResponse?>()) {
      return (data != null ? _i25.PaymentResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Payment?>()) {
      return (data != null ? _i26.Payment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.PioneerAccounts?>()) {
      return (data != null ? _i27.PioneerAccounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.Product?>()) {
      return (data != null ? _i28.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.ProfitSharing?>()) {
      return (data != null ? _i29.ProfitSharing.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.RankCategory?>()) {
      return (data != null ? _i30.RankCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Ranks?>()) {
      return (data != null ? _i31.Ranks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.ReaperCommission?>()) {
      return (data != null ? _i32.ReaperCommission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.Sale?>()) {
      return (data != null ? _i33.Sale.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.SaleItem?>()) {
      return (data != null ? _i34.SaleItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.UserInfo?>()) {
      return (data != null ? _i35.UserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.User?>()) {
      return (data != null ? _i36.User.fromJson(data) : null) as T;
    }
    if (t == List<_i6.CartItem>) {
      return (data as List).map((e) => deserialize<_i6.CartItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.CartItem>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i6.CartItem>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i20.MenuItems>) {
      return (data as List).map((e) => deserialize<_i20.MenuItems>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i20.MenuItems>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i20.MenuItems>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i12.Eula>) {
      return (data as List).map((e) => deserialize<_i12.Eula>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i12.Eula>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i12.Eula>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i22.OrderItem>) {
      return (data as List).map((e) => deserialize<_i22.OrderItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i22.OrderItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i22.OrderItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i32.ReaperCommission>) {
      return (data as List)
              .map((e) => deserialize<_i32.ReaperCommission>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i32.ReaperCommission>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i32.ReaperCommission>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i34.SaleItem>) {
      return (data as List).map((e) => deserialize<_i34.SaleItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i34.SaleItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i34.SaleItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i37.Addresses>) {
      return (data as List).map((e) => deserialize<_i37.Addresses>(e)).toList()
          as T;
    }
    if (t == List<_i3.UserInfo>) {
      return (data as List).map((e) => deserialize<_i3.UserInfo>(e)).toList()
          as T;
    }
    if (t == List<_i38.Cart>) {
      return (data as List).map((e) => deserialize<_i38.Cart>(e)).toList() as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == List<_i39.Commissions>) {
      return (data as List)
              .map((e) => deserialize<_i39.Commissions>(e))
              .toList()
          as T;
    }
    if (t == List<_i40.CommissionRule>) {
      return (data as List)
              .map((e) => deserialize<_i40.CommissionRule>(e))
              .toList()
          as T;
    }
    if (t == List<_i41.Distributors>) {
      return (data as List)
              .map((e) => deserialize<_i41.Distributors>(e))
              .toList()
          as T;
    }
    if (t == List<_i42.GoldenSeats>) {
      return (data as List)
              .map((e) => deserialize<_i42.GoldenSeats>(e))
              .toList()
          as T;
    }
    if (t == List<_i43.MembershipPackage>) {
      return (data as List)
              .map((e) => deserialize<_i43.MembershipPackage>(e))
              .toList()
          as T;
    }
    if (t == List<_i44.Menu>) {
      return (data as List).map((e) => deserialize<_i44.Menu>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i44.Menu>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i44.Menu>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i45.Package>) {
      return (data as List).map((e) => deserialize<_i45.Package>(e)).toList()
          as T;
    }
    if (t == List<_i46.Product>) {
      return (data as List).map((e) => deserialize<_i46.Product>(e)).toList()
          as T;
    }
    if (t == List<_i47.Ranks>) {
      return (data as List).map((e) => deserialize<_i47.Ranks>(e)).toList()
          as T;
    }
    if (t == List<_i48.ReaperCommission>) {
      return (data as List)
              .map((e) => deserialize<_i48.ReaperCommission>(e))
              .toList()
          as T;
    }
    if (t == List<_i49.Sale>) {
      return (data as List).map((e) => deserialize<_i49.Sale>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i49.Sale>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i49.Sale>(e)).toList()
              : null)
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i4.Addresses => 'Addresses',
      _i5.Cart => 'Cart',
      _i6.CartItem => 'CartItem',
      _i7.Cdnconfig => 'Cdnconfig',
      _i8.CommissionRule => 'CommissionRule',
      _i9.Commissions => 'Commissions',
      _i10.CrownPackage => 'CrownPackage',
      _i11.Distributors => 'Distributors',
      _i12.Eula => 'Eula',
      _i13.BirthdayReminderSendReminderModel =>
        'BirthdayReminderSendReminderModel',
      _i14.GoldenSeatCommission => 'GoldenSeatCommission',
      _i15.GoldenSeats => 'GoldenSeats',
      _i16.Greeting => 'Greeting',
      _i17.Level => 'Level',
      _i18.MembershipPackage => 'MembershipPackage',
      _i19.Menu => 'Menu',
      _i20.MenuItems => 'MenuItems',
      _i21.Order => 'Order',
      _i22.OrderItem => 'OrderItem',
      _i23.Package => 'Package',
      _i24.PaymentEvent => 'PaymentEvent',
      _i25.PaymentResponse => 'PaymentResponse',
      _i26.Payment => 'Payment',
      _i27.PioneerAccounts => 'PioneerAccounts',
      _i28.Product => 'Product',
      _i29.ProfitSharing => 'ProfitSharing',
      _i30.RankCategory => 'RankCategory',
      _i31.Ranks => 'Ranks',
      _i32.ReaperCommission => 'ReaperCommission',
      _i33.Sale => 'Sale',
      _i34.SaleItem => 'SaleItem',
      _i35.UserInfo => 'UserInfo',
      _i36.User => 'User',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('wm.', '');
    }

    switch (data) {
      case _i4.Addresses():
        return 'Addresses';
      case _i5.Cart():
        return 'Cart';
      case _i6.CartItem():
        return 'CartItem';
      case _i7.Cdnconfig():
        return 'Cdnconfig';
      case _i8.CommissionRule():
        return 'CommissionRule';
      case _i9.Commissions():
        return 'Commissions';
      case _i10.CrownPackage():
        return 'CrownPackage';
      case _i11.Distributors():
        return 'Distributors';
      case _i12.Eula():
        return 'Eula';
      case _i13.BirthdayReminderSendReminderModel():
        return 'BirthdayReminderSendReminderModel';
      case _i14.GoldenSeatCommission():
        return 'GoldenSeatCommission';
      case _i15.GoldenSeats():
        return 'GoldenSeats';
      case _i16.Greeting():
        return 'Greeting';
      case _i17.Level():
        return 'Level';
      case _i18.MembershipPackage():
        return 'MembershipPackage';
      case _i19.Menu():
        return 'Menu';
      case _i20.MenuItems():
        return 'MenuItems';
      case _i21.Order():
        return 'Order';
      case _i22.OrderItem():
        return 'OrderItem';
      case _i23.Package():
        return 'Package';
      case _i24.PaymentEvent():
        return 'PaymentEvent';
      case _i25.PaymentResponse():
        return 'PaymentResponse';
      case _i26.Payment():
        return 'Payment';
      case _i27.PioneerAccounts():
        return 'PioneerAccounts';
      case _i28.Product():
        return 'Product';
      case _i29.ProfitSharing():
        return 'ProfitSharing';
      case _i30.RankCategory():
        return 'RankCategory';
      case _i31.Ranks():
        return 'Ranks';
      case _i32.ReaperCommission():
        return 'ReaperCommission';
      case _i33.Sale():
        return 'Sale';
      case _i34.SaleItem():
        return 'SaleItem';
      case _i35.UserInfo():
        return 'UserInfo';
      case _i36.User():
        return 'User';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Addresses') {
      return deserialize<_i4.Addresses>(data['data']);
    }
    if (dataClassName == 'Cart') {
      return deserialize<_i5.Cart>(data['data']);
    }
    if (dataClassName == 'CartItem') {
      return deserialize<_i6.CartItem>(data['data']);
    }
    if (dataClassName == 'Cdnconfig') {
      return deserialize<_i7.Cdnconfig>(data['data']);
    }
    if (dataClassName == 'CommissionRule') {
      return deserialize<_i8.CommissionRule>(data['data']);
    }
    if (dataClassName == 'Commissions') {
      return deserialize<_i9.Commissions>(data['data']);
    }
    if (dataClassName == 'CrownPackage') {
      return deserialize<_i10.CrownPackage>(data['data']);
    }
    if (dataClassName == 'Distributors') {
      return deserialize<_i11.Distributors>(data['data']);
    }
    if (dataClassName == 'Eula') {
      return deserialize<_i12.Eula>(data['data']);
    }
    if (dataClassName == 'BirthdayReminderSendReminderModel') {
      return deserialize<_i13.BirthdayReminderSendReminderModel>(data['data']);
    }
    if (dataClassName == 'GoldenSeatCommission') {
      return deserialize<_i14.GoldenSeatCommission>(data['data']);
    }
    if (dataClassName == 'GoldenSeats') {
      return deserialize<_i15.GoldenSeats>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i16.Greeting>(data['data']);
    }
    if (dataClassName == 'Level') {
      return deserialize<_i17.Level>(data['data']);
    }
    if (dataClassName == 'MembershipPackage') {
      return deserialize<_i18.MembershipPackage>(data['data']);
    }
    if (dataClassName == 'Menu') {
      return deserialize<_i19.Menu>(data['data']);
    }
    if (dataClassName == 'MenuItems') {
      return deserialize<_i20.MenuItems>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i21.Order>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i22.OrderItem>(data['data']);
    }
    if (dataClassName == 'Package') {
      return deserialize<_i23.Package>(data['data']);
    }
    if (dataClassName == 'PaymentEvent') {
      return deserialize<_i24.PaymentEvent>(data['data']);
    }
    if (dataClassName == 'PaymentResponse') {
      return deserialize<_i25.PaymentResponse>(data['data']);
    }
    if (dataClassName == 'Payment') {
      return deserialize<_i26.Payment>(data['data']);
    }
    if (dataClassName == 'PioneerAccounts') {
      return deserialize<_i27.PioneerAccounts>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i28.Product>(data['data']);
    }
    if (dataClassName == 'ProfitSharing') {
      return deserialize<_i29.ProfitSharing>(data['data']);
    }
    if (dataClassName == 'RankCategory') {
      return deserialize<_i30.RankCategory>(data['data']);
    }
    if (dataClassName == 'Ranks') {
      return deserialize<_i31.Ranks>(data['data']);
    }
    if (dataClassName == 'ReaperCommission') {
      return deserialize<_i32.ReaperCommission>(data['data']);
    }
    if (dataClassName == 'Sale') {
      return deserialize<_i33.Sale>(data['data']);
    }
    if (dataClassName == 'SaleItem') {
      return deserialize<_i34.SaleItem>(data['data']);
    }
    if (dataClassName == 'UserInfo') {
      return deserialize<_i35.UserInfo>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i36.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Addresses:
        return _i4.Addresses.t;
      case _i5.Cart:
        return _i5.Cart.t;
      case _i6.CartItem:
        return _i6.CartItem.t;
      case _i7.Cdnconfig:
        return _i7.Cdnconfig.t;
      case _i8.CommissionRule:
        return _i8.CommissionRule.t;
      case _i9.Commissions:
        return _i9.Commissions.t;
      case _i10.CrownPackage:
        return _i10.CrownPackage.t;
      case _i11.Distributors:
        return _i11.Distributors.t;
      case _i12.Eula:
        return _i12.Eula.t;
      case _i14.GoldenSeatCommission:
        return _i14.GoldenSeatCommission.t;
      case _i15.GoldenSeats:
        return _i15.GoldenSeats.t;
      case _i17.Level:
        return _i17.Level.t;
      case _i18.MembershipPackage:
        return _i18.MembershipPackage.t;
      case _i19.Menu:
        return _i19.Menu.t;
      case _i20.MenuItems:
        return _i20.MenuItems.t;
      case _i21.Order:
        return _i21.Order.t;
      case _i22.OrderItem:
        return _i22.OrderItem.t;
      case _i23.Package:
        return _i23.Package.t;
      case _i24.PaymentEvent:
        return _i24.PaymentEvent.t;
      case _i26.Payment:
        return _i26.Payment.t;
      case _i27.PioneerAccounts:
        return _i27.PioneerAccounts.t;
      case _i28.Product:
        return _i28.Product.t;
      case _i29.ProfitSharing:
        return _i29.ProfitSharing.t;
      case _i30.RankCategory:
        return _i30.RankCategory.t;
      case _i31.Ranks:
        return _i31.Ranks.t;
      case _i32.ReaperCommission:
        return _i32.ReaperCommission.t;
      case _i33.Sale:
        return _i33.Sale.t;
      case _i34.SaleItem:
        return _i34.SaleItem.t;
      case _i36.User:
        return _i36.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'wm';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
