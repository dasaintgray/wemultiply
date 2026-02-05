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
import 'addresses.dart' as _i2;
import 'cart.dart' as _i3;
import 'cart_items.dart' as _i4;
import 'cdn.dart' as _i5;
import 'commission_rule.dart' as _i6;
import 'commissions.dart' as _i7;
import 'crown_package.dart' as _i8;
import 'distributors.dart' as _i9;
import 'eula.dart' as _i10;
import 'golden_seat_commissions.dart' as _i11;
import 'golden_seats.dart' as _i12;
import 'greeting.dart' as _i13;
import 'level.dart' as _i14;
import 'membership_package.dart' as _i15;
import 'menu.dart' as _i16;
import 'menu_items.dart' as _i17;
import 'order.dart' as _i18;
import 'order_items.dart' as _i19;
import 'packages.dart' as _i20;
import 'payment_events.dart' as _i21;
import 'payment_response.dart' as _i22;
import 'payments.dart' as _i23;
import 'pioneer_accounts.dart' as _i24;
import 'products.dart' as _i25;
import 'profit_sharing.dart' as _i26;
import 'rank_category.dart' as _i27;
import 'ranks.dart' as _i28;
import 'reaper_commissions.dart' as _i29;
import 'sale.dart' as _i30;
import 'sale_items.dart' as _i31;
import 'userinfo.dart' as _i32;
import 'users.dart' as _i33;
import 'package:wm_client/src/protocol/addresses.dart' as _i34;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i35;
import 'package:wm_client/src/protocol/cart.dart' as _i36;
import 'package:wm_client/src/protocol/commissions.dart' as _i37;
import 'package:wm_client/src/protocol/commission_rule.dart' as _i38;
import 'package:wm_client/src/protocol/distributors.dart' as _i39;
import 'package:wm_client/src/protocol/golden_seats.dart' as _i40;
import 'package:wm_client/src/protocol/membership_package.dart' as _i41;
import 'package:wm_client/src/protocol/menu.dart' as _i42;
import 'package:wm_client/src/protocol/packages.dart' as _i43;
import 'package:wm_client/src/protocol/products.dart' as _i44;
import 'package:wm_client/src/protocol/ranks.dart' as _i45;
import 'package:wm_client/src/protocol/reaper_commissions.dart' as _i46;
import 'package:wm_client/src/protocol/sale.dart' as _i47;
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
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

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

    if (t == _i2.Addresses) {
      return _i2.Addresses.fromJson(data) as T;
    }
    if (t == _i3.Cart) {
      return _i3.Cart.fromJson(data) as T;
    }
    if (t == _i4.CartItem) {
      return _i4.CartItem.fromJson(data) as T;
    }
    if (t == _i5.Cdnconfig) {
      return _i5.Cdnconfig.fromJson(data) as T;
    }
    if (t == _i6.CommissionRule) {
      return _i6.CommissionRule.fromJson(data) as T;
    }
    if (t == _i7.Commissions) {
      return _i7.Commissions.fromJson(data) as T;
    }
    if (t == _i8.CrownPackage) {
      return _i8.CrownPackage.fromJson(data) as T;
    }
    if (t == _i9.Distributors) {
      return _i9.Distributors.fromJson(data) as T;
    }
    if (t == _i10.Eula) {
      return _i10.Eula.fromJson(data) as T;
    }
    if (t == _i11.GoldenSeatCommission) {
      return _i11.GoldenSeatCommission.fromJson(data) as T;
    }
    if (t == _i12.GoldenSeats) {
      return _i12.GoldenSeats.fromJson(data) as T;
    }
    if (t == _i13.Greeting) {
      return _i13.Greeting.fromJson(data) as T;
    }
    if (t == _i14.Level) {
      return _i14.Level.fromJson(data) as T;
    }
    if (t == _i15.MembershipPackage) {
      return _i15.MembershipPackage.fromJson(data) as T;
    }
    if (t == _i16.Menu) {
      return _i16.Menu.fromJson(data) as T;
    }
    if (t == _i17.MenuItems) {
      return _i17.MenuItems.fromJson(data) as T;
    }
    if (t == _i18.Order) {
      return _i18.Order.fromJson(data) as T;
    }
    if (t == _i19.OrderItem) {
      return _i19.OrderItem.fromJson(data) as T;
    }
    if (t == _i20.Package) {
      return _i20.Package.fromJson(data) as T;
    }
    if (t == _i21.PaymentEvent) {
      return _i21.PaymentEvent.fromJson(data) as T;
    }
    if (t == _i22.PaymentResponse) {
      return _i22.PaymentResponse.fromJson(data) as T;
    }
    if (t == _i23.Payment) {
      return _i23.Payment.fromJson(data) as T;
    }
    if (t == _i24.PioneerAccounts) {
      return _i24.PioneerAccounts.fromJson(data) as T;
    }
    if (t == _i25.Product) {
      return _i25.Product.fromJson(data) as T;
    }
    if (t == _i26.ProfitSharing) {
      return _i26.ProfitSharing.fromJson(data) as T;
    }
    if (t == _i27.RankCategory) {
      return _i27.RankCategory.fromJson(data) as T;
    }
    if (t == _i28.Ranks) {
      return _i28.Ranks.fromJson(data) as T;
    }
    if (t == _i29.ReaperCommission) {
      return _i29.ReaperCommission.fromJson(data) as T;
    }
    if (t == _i30.Sale) {
      return _i30.Sale.fromJson(data) as T;
    }
    if (t == _i31.SaleItem) {
      return _i31.SaleItem.fromJson(data) as T;
    }
    if (t == _i32.UserInfo) {
      return _i32.UserInfo.fromJson(data) as T;
    }
    if (t == _i33.User) {
      return _i33.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Addresses?>()) {
      return (data != null ? _i2.Addresses.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Cart?>()) {
      return (data != null ? _i3.Cart.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CartItem?>()) {
      return (data != null ? _i4.CartItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Cdnconfig?>()) {
      return (data != null ? _i5.Cdnconfig.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CommissionRule?>()) {
      return (data != null ? _i6.CommissionRule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Commissions?>()) {
      return (data != null ? _i7.Commissions.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CrownPackage?>()) {
      return (data != null ? _i8.CrownPackage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Distributors?>()) {
      return (data != null ? _i9.Distributors.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Eula?>()) {
      return (data != null ? _i10.Eula.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GoldenSeatCommission?>()) {
      return (data != null ? _i11.GoldenSeatCommission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.GoldenSeats?>()) {
      return (data != null ? _i12.GoldenSeats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Greeting?>()) {
      return (data != null ? _i13.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Level?>()) {
      return (data != null ? _i14.Level.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.MembershipPackage?>()) {
      return (data != null ? _i15.MembershipPackage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Menu?>()) {
      return (data != null ? _i16.Menu.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.MenuItems?>()) {
      return (data != null ? _i17.MenuItems.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Order?>()) {
      return (data != null ? _i18.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.OrderItem?>()) {
      return (data != null ? _i19.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Package?>()) {
      return (data != null ? _i20.Package.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PaymentEvent?>()) {
      return (data != null ? _i21.PaymentEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PaymentResponse?>()) {
      return (data != null ? _i22.PaymentResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Payment?>()) {
      return (data != null ? _i23.Payment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.PioneerAccounts?>()) {
      return (data != null ? _i24.PioneerAccounts.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.Product?>()) {
      return (data != null ? _i25.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.ProfitSharing?>()) {
      return (data != null ? _i26.ProfitSharing.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.RankCategory?>()) {
      return (data != null ? _i27.RankCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.Ranks?>()) {
      return (data != null ? _i28.Ranks.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.ReaperCommission?>()) {
      return (data != null ? _i29.ReaperCommission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.Sale?>()) {
      return (data != null ? _i30.Sale.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.SaleItem?>()) {
      return (data != null ? _i31.SaleItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.UserInfo?>()) {
      return (data != null ? _i32.UserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.User?>()) {
      return (data != null ? _i33.User.fromJson(data) : null) as T;
    }
    if (t == List<_i4.CartItem>) {
      return (data as List).map((e) => deserialize<_i4.CartItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i4.CartItem>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i4.CartItem>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i17.MenuItems>) {
      return (data as List).map((e) => deserialize<_i17.MenuItems>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i17.MenuItems>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i17.MenuItems>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i10.Eula>) {
      return (data as List).map((e) => deserialize<_i10.Eula>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i10.Eula>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i10.Eula>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i19.OrderItem>) {
      return (data as List).map((e) => deserialize<_i19.OrderItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i19.OrderItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i19.OrderItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i29.ReaperCommission>) {
      return (data as List)
              .map((e) => deserialize<_i29.ReaperCommission>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i29.ReaperCommission>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i29.ReaperCommission>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i31.SaleItem>) {
      return (data as List).map((e) => deserialize<_i31.SaleItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i31.SaleItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i31.SaleItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i34.Addresses>) {
      return (data as List).map((e) => deserialize<_i34.Addresses>(e)).toList()
          as T;
    }
    if (t == List<_i35.UserInfo>) {
      return (data as List).map((e) => deserialize<_i35.UserInfo>(e)).toList()
          as T;
    }
    if (t == List<_i36.Cart>) {
      return (data as List).map((e) => deserialize<_i36.Cart>(e)).toList() as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == List<_i37.Commissions>) {
      return (data as List)
              .map((e) => deserialize<_i37.Commissions>(e))
              .toList()
          as T;
    }
    if (t == List<_i38.CommissionRule>) {
      return (data as List)
              .map((e) => deserialize<_i38.CommissionRule>(e))
              .toList()
          as T;
    }
    if (t == List<_i39.Distributors>) {
      return (data as List)
              .map((e) => deserialize<_i39.Distributors>(e))
              .toList()
          as T;
    }
    if (t == List<_i40.GoldenSeats>) {
      return (data as List)
              .map((e) => deserialize<_i40.GoldenSeats>(e))
              .toList()
          as T;
    }
    if (t == List<_i41.MembershipPackage>) {
      return (data as List)
              .map((e) => deserialize<_i41.MembershipPackage>(e))
              .toList()
          as T;
    }
    if (t == List<_i42.Menu>) {
      return (data as List).map((e) => deserialize<_i42.Menu>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i42.Menu>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i42.Menu>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i43.Package>) {
      return (data as List).map((e) => deserialize<_i43.Package>(e)).toList()
          as T;
    }
    if (t == List<_i44.Product>) {
      return (data as List).map((e) => deserialize<_i44.Product>(e)).toList()
          as T;
    }
    if (t == List<_i45.Ranks>) {
      return (data as List).map((e) => deserialize<_i45.Ranks>(e)).toList()
          as T;
    }
    if (t == List<_i46.ReaperCommission>) {
      return (data as List)
              .map((e) => deserialize<_i46.ReaperCommission>(e))
              .toList()
          as T;
    }
    if (t == List<_i47.Sale>) {
      return (data as List).map((e) => deserialize<_i47.Sale>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i47.Sale>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i47.Sale>(e)).toList()
              : null)
          as T;
    }
    try {
      return _i35.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Addresses => 'Addresses',
      _i3.Cart => 'Cart',
      _i4.CartItem => 'CartItem',
      _i5.Cdnconfig => 'Cdnconfig',
      _i6.CommissionRule => 'CommissionRule',
      _i7.Commissions => 'Commissions',
      _i8.CrownPackage => 'CrownPackage',
      _i9.Distributors => 'Distributors',
      _i10.Eula => 'Eula',
      _i11.GoldenSeatCommission => 'GoldenSeatCommission',
      _i12.GoldenSeats => 'GoldenSeats',
      _i13.Greeting => 'Greeting',
      _i14.Level => 'Level',
      _i15.MembershipPackage => 'MembershipPackage',
      _i16.Menu => 'Menu',
      _i17.MenuItems => 'MenuItems',
      _i18.Order => 'Order',
      _i19.OrderItem => 'OrderItem',
      _i20.Package => 'Package',
      _i21.PaymentEvent => 'PaymentEvent',
      _i22.PaymentResponse => 'PaymentResponse',
      _i23.Payment => 'Payment',
      _i24.PioneerAccounts => 'PioneerAccounts',
      _i25.Product => 'Product',
      _i26.ProfitSharing => 'ProfitSharing',
      _i27.RankCategory => 'RankCategory',
      _i28.Ranks => 'Ranks',
      _i29.ReaperCommission => 'ReaperCommission',
      _i30.Sale => 'Sale',
      _i31.SaleItem => 'SaleItem',
      _i32.UserInfo => 'UserInfo',
      _i33.User => 'User',
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
      case _i2.Addresses():
        return 'Addresses';
      case _i3.Cart():
        return 'Cart';
      case _i4.CartItem():
        return 'CartItem';
      case _i5.Cdnconfig():
        return 'Cdnconfig';
      case _i6.CommissionRule():
        return 'CommissionRule';
      case _i7.Commissions():
        return 'Commissions';
      case _i8.CrownPackage():
        return 'CrownPackage';
      case _i9.Distributors():
        return 'Distributors';
      case _i10.Eula():
        return 'Eula';
      case _i11.GoldenSeatCommission():
        return 'GoldenSeatCommission';
      case _i12.GoldenSeats():
        return 'GoldenSeats';
      case _i13.Greeting():
        return 'Greeting';
      case _i14.Level():
        return 'Level';
      case _i15.MembershipPackage():
        return 'MembershipPackage';
      case _i16.Menu():
        return 'Menu';
      case _i17.MenuItems():
        return 'MenuItems';
      case _i18.Order():
        return 'Order';
      case _i19.OrderItem():
        return 'OrderItem';
      case _i20.Package():
        return 'Package';
      case _i21.PaymentEvent():
        return 'PaymentEvent';
      case _i22.PaymentResponse():
        return 'PaymentResponse';
      case _i23.Payment():
        return 'Payment';
      case _i24.PioneerAccounts():
        return 'PioneerAccounts';
      case _i25.Product():
        return 'Product';
      case _i26.ProfitSharing():
        return 'ProfitSharing';
      case _i27.RankCategory():
        return 'RankCategory';
      case _i28.Ranks():
        return 'Ranks';
      case _i29.ReaperCommission():
        return 'ReaperCommission';
      case _i30.Sale():
        return 'Sale';
      case _i31.SaleItem():
        return 'SaleItem';
      case _i32.UserInfo():
        return 'UserInfo';
      case _i33.User():
        return 'User';
    }
    className = _i35.Protocol().getClassNameForObject(data);
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
      return deserialize<_i2.Addresses>(data['data']);
    }
    if (dataClassName == 'Cart') {
      return deserialize<_i3.Cart>(data['data']);
    }
    if (dataClassName == 'CartItem') {
      return deserialize<_i4.CartItem>(data['data']);
    }
    if (dataClassName == 'Cdnconfig') {
      return deserialize<_i5.Cdnconfig>(data['data']);
    }
    if (dataClassName == 'CommissionRule') {
      return deserialize<_i6.CommissionRule>(data['data']);
    }
    if (dataClassName == 'Commissions') {
      return deserialize<_i7.Commissions>(data['data']);
    }
    if (dataClassName == 'CrownPackage') {
      return deserialize<_i8.CrownPackage>(data['data']);
    }
    if (dataClassName == 'Distributors') {
      return deserialize<_i9.Distributors>(data['data']);
    }
    if (dataClassName == 'Eula') {
      return deserialize<_i10.Eula>(data['data']);
    }
    if (dataClassName == 'GoldenSeatCommission') {
      return deserialize<_i11.GoldenSeatCommission>(data['data']);
    }
    if (dataClassName == 'GoldenSeats') {
      return deserialize<_i12.GoldenSeats>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i13.Greeting>(data['data']);
    }
    if (dataClassName == 'Level') {
      return deserialize<_i14.Level>(data['data']);
    }
    if (dataClassName == 'MembershipPackage') {
      return deserialize<_i15.MembershipPackage>(data['data']);
    }
    if (dataClassName == 'Menu') {
      return deserialize<_i16.Menu>(data['data']);
    }
    if (dataClassName == 'MenuItems') {
      return deserialize<_i17.MenuItems>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i18.Order>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i19.OrderItem>(data['data']);
    }
    if (dataClassName == 'Package') {
      return deserialize<_i20.Package>(data['data']);
    }
    if (dataClassName == 'PaymentEvent') {
      return deserialize<_i21.PaymentEvent>(data['data']);
    }
    if (dataClassName == 'PaymentResponse') {
      return deserialize<_i22.PaymentResponse>(data['data']);
    }
    if (dataClassName == 'Payment') {
      return deserialize<_i23.Payment>(data['data']);
    }
    if (dataClassName == 'PioneerAccounts') {
      return deserialize<_i24.PioneerAccounts>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i25.Product>(data['data']);
    }
    if (dataClassName == 'ProfitSharing') {
      return deserialize<_i26.ProfitSharing>(data['data']);
    }
    if (dataClassName == 'RankCategory') {
      return deserialize<_i27.RankCategory>(data['data']);
    }
    if (dataClassName == 'Ranks') {
      return deserialize<_i28.Ranks>(data['data']);
    }
    if (dataClassName == 'ReaperCommission') {
      return deserialize<_i29.ReaperCommission>(data['data']);
    }
    if (dataClassName == 'Sale') {
      return deserialize<_i30.Sale>(data['data']);
    }
    if (dataClassName == 'SaleItem') {
      return deserialize<_i31.SaleItem>(data['data']);
    }
    if (dataClassName == 'UserInfo') {
      return deserialize<_i32.UserInfo>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i33.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i35.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

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
      return _i35.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
