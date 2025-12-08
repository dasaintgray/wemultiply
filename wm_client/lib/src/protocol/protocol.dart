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
import 'greeting.dart' as _i2;
import 'userinfo.dart' as _i3;
import 'addresses.dart' as _i4;
import 'cart.dart' as _i5;
import 'cart_items.dart' as _i6;
import 'cdn.dart' as _i7;
import 'commission_rule.dart' as _i8;
import 'commissions.dart' as _i9;
import 'crown_package.dart' as _i10;
import 'distributors.dart' as _i11;
import 'eula.dart' as _i12;
import 'golden_seat_commissions.dart' as _i13;
import 'golden_seats.dart' as _i14;
import 'level.dart' as _i15;
import 'membership_package.dart' as _i16;
import 'menu.dart' as _i17;
import 'menu_items.dart' as _i18;
import 'order.dart' as _i19;
import 'order_items.dart' as _i20;
import 'packages.dart' as _i21;
import 'payment_events.dart' as _i22;
import 'payments.dart' as _i23;
import 'pioneer_accounts.dart' as _i24;
import 'products.dart' as _i25;
import 'profit_sharing.dart' as _i26;
import 'rank_category.dart' as _i27;
import 'ranks.dart' as _i28;
import 'reaper_commissions.dart' as _i29;
import 'sale.dart' as _i30;
import 'sale_items.dart' as _i31;
import 'users.dart' as _i32;
import 'package:wm_client/src/protocol/addresses.dart' as _i33;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i34;
import 'package:wm_client/src/protocol/cart.dart' as _i35;
import 'package:wm_client/src/protocol/commissions.dart' as _i36;
import 'package:wm_client/src/protocol/commission_rule.dart' as _i37;
import 'package:wm_client/src/protocol/distributors.dart' as _i38;
import 'package:wm_client/src/protocol/golden_seats.dart' as _i39;
import 'package:wm_client/src/protocol/membership_package.dart' as _i40;
import 'package:wm_client/src/protocol/menu.dart' as _i41;
import 'package:wm_client/src/protocol/packages.dart' as _i42;
import 'package:wm_client/src/protocol/products.dart' as _i43;
import 'package:wm_client/src/protocol/ranks.dart' as _i44;
import 'package:wm_client/src/protocol/reaper_commissions.dart' as _i45;
import 'package:wm_client/src/protocol/sale.dart' as _i46;
export 'greeting.dart';
export 'userinfo.dart';
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
export 'level.dart';
export 'membership_package.dart';
export 'menu.dart';
export 'menu_items.dart';
export 'order.dart';
export 'order_items.dart';
export 'packages.dart';
export 'payment_events.dart';
export 'payments.dart';
export 'pioneer_accounts.dart';
export 'products.dart';
export 'profit_sharing.dart';
export 'rank_category.dart';
export 'ranks.dart';
export 'reaper_commissions.dart';
export 'sale.dart';
export 'sale_items.dart';
export 'users.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.UserInfo) {
      return _i3.UserInfo.fromJson(data) as T;
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
    if (t == _i13.GoldenSeatCommission) {
      return _i13.GoldenSeatCommission.fromJson(data) as T;
    }
    if (t == _i14.GoldenSeats) {
      return _i14.GoldenSeats.fromJson(data) as T;
    }
    if (t == _i15.Level) {
      return _i15.Level.fromJson(data) as T;
    }
    if (t == _i16.MembershipPackage) {
      return _i16.MembershipPackage.fromJson(data) as T;
    }
    if (t == _i17.Menu) {
      return _i17.Menu.fromJson(data) as T;
    }
    if (t == _i18.MenuItems) {
      return _i18.MenuItems.fromJson(data) as T;
    }
    if (t == _i19.Order) {
      return _i19.Order.fromJson(data) as T;
    }
    if (t == _i20.OrderItem) {
      return _i20.OrderItem.fromJson(data) as T;
    }
    if (t == _i21.Package) {
      return _i21.Package.fromJson(data) as T;
    }
    if (t == _i22.PaymentEvent) {
      return _i22.PaymentEvent.fromJson(data) as T;
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
    if (t == _i32.User) {
      return _i32.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.UserInfo?>()) {
      return (data != null ? _i3.UserInfo.fromJson(data) : null) as T;
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
    if (t == _i1.getType<_i13.GoldenSeatCommission?>()) {
      return (data != null ? _i13.GoldenSeatCommission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.GoldenSeats?>()) {
      return (data != null ? _i14.GoldenSeats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Level?>()) {
      return (data != null ? _i15.Level.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.MembershipPackage?>()) {
      return (data != null ? _i16.MembershipPackage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Menu?>()) {
      return (data != null ? _i17.Menu.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.MenuItems?>()) {
      return (data != null ? _i18.MenuItems.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Order?>()) {
      return (data != null ? _i19.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.OrderItem?>()) {
      return (data != null ? _i20.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Package?>()) {
      return (data != null ? _i21.Package.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PaymentEvent?>()) {
      return (data != null ? _i22.PaymentEvent.fromJson(data) : null) as T;
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
    if (t == _i1.getType<_i32.User?>()) {
      return (data != null ? _i32.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i6.CartItem>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.CartItem>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i18.MenuItems>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i18.MenuItems>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i12.Eula>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Eula>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i20.OrderItem>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i20.OrderItem>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i29.ReaperCommission>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i29.ReaperCommission>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i31.SaleItem>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i31.SaleItem>(e)).toList()
          : null) as T;
    }
    if (t == List<_i33.Addresses>) {
      return (data as List).map((e) => deserialize<_i33.Addresses>(e)).toList()
          as T;
    }
    if (t == List<_i34.UserInfo>) {
      return (data as List).map((e) => deserialize<_i34.UserInfo>(e)).toList()
          as T;
    }
    if (t == List<_i35.Cart>) {
      return (data as List).map((e) => deserialize<_i35.Cart>(e)).toList() as T;
    }
    if (t == List<_i36.Commissions>) {
      return (data as List)
          .map((e) => deserialize<_i36.Commissions>(e))
          .toList() as T;
    }
    if (t == List<_i37.CommissionRule>) {
      return (data as List)
          .map((e) => deserialize<_i37.CommissionRule>(e))
          .toList() as T;
    }
    if (t == List<_i38.Distributors>) {
      return (data as List)
          .map((e) => deserialize<_i38.Distributors>(e))
          .toList() as T;
    }
    if (t == List<_i39.GoldenSeats>) {
      return (data as List)
          .map((e) => deserialize<_i39.GoldenSeats>(e))
          .toList() as T;
    }
    if (t == List<_i40.MembershipPackage>) {
      return (data as List)
          .map((e) => deserialize<_i40.MembershipPackage>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i41.Menu>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i41.Menu>(e)).toList()
          : null) as T;
    }
    if (t == List<_i42.Package>) {
      return (data as List).map((e) => deserialize<_i42.Package>(e)).toList()
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<dynamic>(v))) as T;
    }
    if (t == List<_i43.Product>) {
      return (data as List).map((e) => deserialize<_i43.Product>(e)).toList()
          as T;
    }
    if (t == List<_i44.Ranks>) {
      return (data as List).map((e) => deserialize<_i44.Ranks>(e)).toList()
          as T;
    }
    if (t == List<_i45.ReaperCommission>) {
      return (data as List)
          .map((e) => deserialize<_i45.ReaperCommission>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i46.Sale>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i46.Sale>(e)).toList()
          : null) as T;
    }
    try {
      return _i34.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.UserInfo) {
      return 'UserInfo';
    }
    if (data is _i4.Addresses) {
      return 'Addresses';
    }
    if (data is _i5.Cart) {
      return 'Cart';
    }
    if (data is _i6.CartItem) {
      return 'CartItem';
    }
    if (data is _i7.Cdnconfig) {
      return 'Cdnconfig';
    }
    if (data is _i8.CommissionRule) {
      return 'CommissionRule';
    }
    if (data is _i9.Commissions) {
      return 'Commissions';
    }
    if (data is _i10.CrownPackage) {
      return 'CrownPackage';
    }
    if (data is _i11.Distributors) {
      return 'Distributors';
    }
    if (data is _i12.Eula) {
      return 'Eula';
    }
    if (data is _i13.GoldenSeatCommission) {
      return 'GoldenSeatCommission';
    }
    if (data is _i14.GoldenSeats) {
      return 'GoldenSeats';
    }
    if (data is _i15.Level) {
      return 'Level';
    }
    if (data is _i16.MembershipPackage) {
      return 'MembershipPackage';
    }
    if (data is _i17.Menu) {
      return 'Menu';
    }
    if (data is _i18.MenuItems) {
      return 'MenuItems';
    }
    if (data is _i19.Order) {
      return 'Order';
    }
    if (data is _i20.OrderItem) {
      return 'OrderItem';
    }
    if (data is _i21.Package) {
      return 'Package';
    }
    if (data is _i22.PaymentEvent) {
      return 'PaymentEvent';
    }
    if (data is _i23.Payment) {
      return 'Payment';
    }
    if (data is _i24.PioneerAccounts) {
      return 'PioneerAccounts';
    }
    if (data is _i25.Product) {
      return 'Product';
    }
    if (data is _i26.ProfitSharing) {
      return 'ProfitSharing';
    }
    if (data is _i27.RankCategory) {
      return 'RankCategory';
    }
    if (data is _i28.Ranks) {
      return 'Ranks';
    }
    if (data is _i29.ReaperCommission) {
      return 'ReaperCommission';
    }
    if (data is _i30.Sale) {
      return 'Sale';
    }
    if (data is _i31.SaleItem) {
      return 'SaleItem';
    }
    if (data is _i32.User) {
      return 'User';
    }
    className = _i34.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'UserInfo') {
      return deserialize<_i3.UserInfo>(data['data']);
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
    if (dataClassName == 'GoldenSeatCommission') {
      return deserialize<_i13.GoldenSeatCommission>(data['data']);
    }
    if (dataClassName == 'GoldenSeats') {
      return deserialize<_i14.GoldenSeats>(data['data']);
    }
    if (dataClassName == 'Level') {
      return deserialize<_i15.Level>(data['data']);
    }
    if (dataClassName == 'MembershipPackage') {
      return deserialize<_i16.MembershipPackage>(data['data']);
    }
    if (dataClassName == 'Menu') {
      return deserialize<_i17.Menu>(data['data']);
    }
    if (dataClassName == 'MenuItems') {
      return deserialize<_i18.MenuItems>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i19.Order>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i20.OrderItem>(data['data']);
    }
    if (dataClassName == 'Package') {
      return deserialize<_i21.Package>(data['data']);
    }
    if (dataClassName == 'PaymentEvent') {
      return deserialize<_i22.PaymentEvent>(data['data']);
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
    if (dataClassName == 'User') {
      return deserialize<_i32.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i34.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
