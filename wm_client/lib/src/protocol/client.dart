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
import 'dart:async' as _i2;
import 'package:wm_client/src/protocol/addresses.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'package:wm_client/src/protocol/cart.dart' as _i5;
import 'package:wm_client/src/protocol/order.dart' as _i6;
import 'package:wm_client/src/protocol/commissions.dart' as _i7;
import 'package:wm_client/src/protocol/commission_rule.dart' as _i8;
import 'package:wm_client/src/protocol/distributors.dart' as _i9;
import 'package:wm_client/src/protocol/golden_seats.dart' as _i10;
import 'package:wm_client/src/protocol/membership_package.dart' as _i11;
import 'package:wm_client/src/protocol/menu.dart' as _i12;
import 'package:wm_client/src/protocol/packages.dart' as _i13;
import 'package:wm_client/src/protocol/payment_response.dart' as _i14;
import 'package:wm_client/src/protocol/payments.dart' as _i15;
import 'package:wm_client/src/protocol/products.dart' as _i16;
import 'package:wm_client/src/protocol/ranks.dart' as _i17;
import 'package:wm_client/src/protocol/reaper_commissions.dart' as _i18;
import 'package:wm_client/src/protocol/sale.dart' as _i19;
import 'package:wm_client/src/protocol/users.dart' as _i20;
import 'package:wm_client/src/protocol/greeting.dart' as _i21;
import 'protocol.dart' as _i22;

/// {@category Endpoint}
class EndpointAddress extends _i1.EndpointRef {
  EndpointAddress(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'address';

  /// Get all addresses for the authenticated user
  _i2.Future<List<_i3.Addresses>> getAddressesByUserId(int userId) =>
      caller.callServerEndpoint<List<_i3.Addresses>>(
        'address',
        'getAddressesByUserId',
        {'userId': userId},
      );

  /// Get primary address for a user
  _i2.Future<_i3.Addresses?> getPrimaryAddress(int userId) =>
      caller.callServerEndpoint<_i3.Addresses?>(
        'address',
        'getPrimaryAddress',
        {'userId': userId},
      );

  /// Add a new delivery address
  _i2.Future<_i3.Addresses> addAddress(_i3.Addresses address) =>
      caller.callServerEndpoint<_i3.Addresses>(
        'address',
        'addAddress',
        {'address': address},
      );

  /// Update an existing address
  _i2.Future<_i3.Addresses> updateAddress(_i3.Addresses address) =>
      caller.callServerEndpoint<_i3.Addresses>(
        'address',
        'updateAddress',
        {'address': address},
      );

  /// Delete an address
  _i2.Future<bool> deleteAddress(
    int addressId,
    int userId,
  ) =>
      caller.callServerEndpoint<bool>(
        'address',
        'deleteAddress',
        {
          'addressId': addressId,
          'userId': userId,
        },
      );

  /// Set an address as primary
  _i2.Future<_i3.Addresses?> setPrimaryAddress(
    int addressId,
    int userId,
  ) =>
      caller.callServerEndpoint<_i3.Addresses?>(
        'address',
        'setPrimaryAddress',
        {
          'addressId': addressId,
          'userId': userId,
        },
      );

  /// Get address count for a user
  _i2.Future<int> getAddressCount(int userId) => caller.callServerEndpoint<int>(
        'address',
        'getAddressCount',
        {'userId': userId},
      );
}

/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _i2.Future<List<_i4.UserInfo>> getAllUsers() =>
      caller.callServerEndpoint<List<_i4.UserInfo>>(
        'admin',
        'getAllUsers',
        {},
      );

  _i2.Future<void> blockUser(int userID) => caller.callServerEndpoint<void>(
        'admin',
        'blockUser',
        {'userID': userID},
      );

  _i2.Future<void> unblockUser(int userID) => caller.callServerEndpoint<void>(
        'admin',
        'unblockUser',
        {'userID': userID},
      );
}

/// {@category Endpoint}
class EndpointCart extends _i1.EndpointRef {
  EndpointCart(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cart';

  _i2.Future<List<_i5.Cart>> getCartByUserId(int userId) =>
      caller.callServerEndpoint<List<_i5.Cart>>(
        'cart',
        'getCartByUserId',
        {'userId': userId},
      );

  _i2.Future<void> removeFromCart(_i5.Cart cart) =>
      caller.callServerEndpoint<void>(
        'cart',
        'removeFromCart',
        {'cart': cart},
      );

  _i2.Future<_i5.Cart?> updateCartItem(_i5.Cart cart) =>
      caller.callServerEndpoint<_i5.Cart?>(
        'cart',
        'updateCartItem',
        {'cart': cart},
      );

  _i2.Future<int> getCartItemCount(int userId) =>
      caller.callServerEndpoint<int>(
        'cart',
        'getCartItemCount',
        {'userId': userId},
      );

  _i2.Future<_i5.Cart?> addItemToCart({
    required int userID,
    required int productID,
    required int quantity,
  }) =>
      caller.callServerEndpoint<_i5.Cart?>(
        'cart',
        'addItemToCart',
        {
          'userID': userID,
          'productID': productID,
          'quantity': quantity,
        },
      );

  _i2.Future<_i6.Order?> checkOutCart({
    required int userID,
    required String paymentMethod,
  }) =>
      caller.callServerEndpoint<_i6.Order?>(
        'cart',
        'checkOutCart',
        {
          'userID': userID,
          'paymentMethod': paymentMethod,
        },
      );

  /// Mark order as paid and clear the cart after successful payment
  _i2.Future<bool> markOrderPaidAndClearCart({
    required int userId,
    required String orderId,
  }) =>
      caller.callServerEndpoint<bool>(
        'cart',
        'markOrderPaidAndClearCart',
        {
          'userId': userId,
          'orderId': orderId,
        },
      );

  /// Clear all active carts for a user (used after successful payment)
  _i2.Future<bool> clearUserCart(int userId) => caller.callServerEndpoint<bool>(
        'cart',
        'clearUserCart',
        {'userId': userId},
      );

  /// Debug method to check cart status for a user
  _i2.Future<Map<String, dynamic>> debugCartStatus(int userId) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'cart',
        'debugCartStatus',
        {'userId': userId},
      );
}

/// {@category Endpoint}
class EndpointCommissions extends _i1.EndpointRef {
  EndpointCommissions(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'commissions';

  _i2.Future<_i7.Commissions?> getCommissionById(int id) =>
      caller.callServerEndpoint<_i7.Commissions?>(
        'commissions',
        'getCommissionById',
        {'id': id},
      );

  _i2.Future<List<_i7.Commissions>> getAllCommissions() =>
      caller.callServerEndpoint<List<_i7.Commissions>>(
        'commissions',
        'getAllCommissions',
        {},
      );

  _i2.Future<_i7.Commissions?> createCommission(_i7.Commissions commission) =>
      caller.callServerEndpoint<_i7.Commissions?>(
        'commissions',
        'createCommission',
        {'commission': commission},
      );

  _i2.Future<_i7.Commissions?> updateCommission(_i7.Commissions commission) =>
      caller.callServerEndpoint<_i7.Commissions?>(
        'commissions',
        'updateCommission',
        {'commission': commission},
      );

  _i2.Future<void> deleteCommission(_i7.Commissions commission) =>
      caller.callServerEndpoint<void>(
        'commissions',
        'deleteCommission',
        {'commission': commission},
      );

  _i2.Future<List<_i7.Commissions>> createMultipleCommissions(
          List<_i7.Commissions> commissions) =>
      caller.callServerEndpoint<List<_i7.Commissions>>(
        'commissions',
        'createMultipleCommissions',
        {'commissions': commissions},
      );
}

/// {@category Endpoint}
class EndpointCommissionsRule extends _i1.EndpointRef {
  EndpointCommissionsRule(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'commissionsRule';

  _i2.Future<List<_i8.CommissionRule>> getAllCommissionRules() =>
      caller.callServerEndpoint<List<_i8.CommissionRule>>(
        'commissionsRule',
        'getAllCommissionRules',
        {},
      );

  _i2.Future<_i8.CommissionRule?> createCommissionRule(
          _i8.CommissionRule rule) =>
      caller.callServerEndpoint<_i8.CommissionRule?>(
        'commissionsRule',
        'createCommissionRule',
        {'rule': rule},
      );

  _i2.Future<List<_i8.CommissionRule>> createMultipleCommissionRules(
          List<_i8.CommissionRule> rules) =>
      caller.callServerEndpoint<List<_i8.CommissionRule>>(
        'commissionsRule',
        'createMultipleCommissionRules',
        {'rules': rules},
      );

  _i2.Future<_i8.CommissionRule?> getCommissionRuleById(int id) =>
      caller.callServerEndpoint<_i8.CommissionRule?>(
        'commissionsRule',
        'getCommissionRuleById',
        {'id': id},
      );

  _i2.Future<_i8.CommissionRule?> updateCommissionRule(
          _i8.CommissionRule rule) =>
      caller.callServerEndpoint<_i8.CommissionRule?>(
        'commissionsRule',
        'updateCommissionRule',
        {'rule': rule},
      );

  _i2.Future<void> deleteCommissionRule(_i8.CommissionRule rule) =>
      caller.callServerEndpoint<void>(
        'commissionsRule',
        'deleteCommissionRule',
        {'rule': rule},
      );
}

/// {@category Endpoint}
class EndpointDistributors extends _i1.EndpointRef {
  EndpointDistributors(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'distributors';

  _i2.Future<List<_i9.Distributors>> getAllDistributors() =>
      caller.callServerEndpoint<List<_i9.Distributors>>(
        'distributors',
        'getAllDistributors',
        {},
      );

  _i2.Future<_i9.Distributors?> createDistributor(
          _i9.Distributors distributor) =>
      caller.callServerEndpoint<_i9.Distributors?>(
        'distributors',
        'createDistributor',
        {'distributor': distributor},
      );

  _i2.Future<List<_i9.Distributors>> createMultipleDistributors(
          List<_i9.Distributors> distributors) =>
      caller.callServerEndpoint<List<_i9.Distributors>>(
        'distributors',
        'createMultipleDistributors',
        {'distributors': distributors},
      );

  _i2.Future<_i9.Distributors?> getDistributorById(int id) =>
      caller.callServerEndpoint<_i9.Distributors?>(
        'distributors',
        'getDistributorById',
        {'id': id},
      );

  _i2.Future<_i9.Distributors?> updateDistributor(
          _i9.Distributors distributor) =>
      caller.callServerEndpoint<_i9.Distributors?>(
        'distributors',
        'updateDistributor',
        {'distributor': distributor},
      );
}

/// {@category Endpoint}
class EndpointGoldenSeat extends _i1.EndpointRef {
  EndpointGoldenSeat(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'goldenSeat';

  _i2.Future<List<_i10.GoldenSeats>> getAllGoldenSeats() =>
      caller.callServerEndpoint<List<_i10.GoldenSeats>>(
        'goldenSeat',
        'getAllGoldenSeats',
        {},
      );

  _i2.Future<_i10.GoldenSeats?> getGoldenSeatById(int id) =>
      caller.callServerEndpoint<_i10.GoldenSeats?>(
        'goldenSeat',
        'getGoldenSeatById',
        {'id': id},
      );

  _i2.Future<_i10.GoldenSeats> createGoldenSeat(_i10.GoldenSeats goldenSeat) =>
      caller.callServerEndpoint<_i10.GoldenSeats>(
        'goldenSeat',
        'createGoldenSeat',
        {'goldenSeat': goldenSeat},
      );

  _i2.Future<_i10.GoldenSeats> updateGoldenSeat(_i10.GoldenSeats goldenSeat) =>
      caller.callServerEndpoint<_i10.GoldenSeats>(
        'goldenSeat',
        'updateGoldenSeat',
        {'goldenSeat': goldenSeat},
      );

  _i2.Future<void> deleteGoldenSeat(int id) => caller.callServerEndpoint<void>(
        'goldenSeat',
        'deleteGoldenSeat',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointMembership extends _i1.EndpointRef {
  EndpointMembership(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'membership';

  _i2.Future<List<_i11.MembershipPackage>> getAllMembershipPackages() =>
      caller.callServerEndpoint<List<_i11.MembershipPackage>>(
        'membership',
        'getAllMembershipPackages',
        {},
      );

  _i2.Future<_i11.MembershipPackage?> getMembershipPackageById(int id) =>
      caller.callServerEndpoint<_i11.MembershipPackage?>(
        'membership',
        'getMembershipPackageById',
        {'id': id},
      );

  _i2.Future<_i11.MembershipPackage> createMembershipPackage(
          _i11.MembershipPackage package) =>
      caller.callServerEndpoint<_i11.MembershipPackage>(
        'membership',
        'createMembershipPackage',
        {'package': package},
      );

  _i2.Future<_i11.MembershipPackage> updateMembershipPackage(
          _i11.MembershipPackage package) =>
      caller.callServerEndpoint<_i11.MembershipPackage>(
        'membership',
        'updateMembershipPackage',
        {'package': package},
      );

  _i2.Future<void> deleteMembershipPackage(int id) =>
      caller.callServerEndpoint<void>(
        'membership',
        'deleteMembershipPackage',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointMenu extends _i1.EndpointRef {
  EndpointMenu(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'menu';

  _i2.Future<List<_i12.Menu>?> getAllActiveMenus() =>
      caller.callServerEndpoint<List<_i12.Menu>?>(
        'menu',
        'getAllActiveMenus',
        {},
      );

  _i2.Future<_i12.Menu?> getMenuWithItems(int menuID) =>
      caller.callServerEndpoint<_i12.Menu?>(
        'menu',
        'getMenuWithItems',
        {'menuID': menuID},
      );
}

/// {@category Endpoint}
class EndpointPackage extends _i1.EndpointRef {
  EndpointPackage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'package';

  _i2.Future<List<_i13.Package>> getAllPackages() =>
      caller.callServerEndpoint<List<_i13.Package>>(
        'package',
        'getAllPackages',
        {},
      );

  _i2.Future<_i13.Package?> createPackage(_i13.Package package) =>
      caller.callServerEndpoint<_i13.Package?>(
        'package',
        'createPackage',
        {'package': package},
      );

  _i2.Future<_i13.Package?> getPackageById(int id) =>
      caller.callServerEndpoint<_i13.Package?>(
        'package',
        'getPackageById',
        {'id': id},
      );

  _i2.Future<_i13.Package?> updatePackage(_i13.Package package) =>
      caller.callServerEndpoint<_i13.Package?>(
        'package',
        'updatePackage',
        {'package': package},
      );

  _i2.Future<void> deletePackage(_i13.Package pkg) =>
      caller.callServerEndpoint<void>(
        'package',
        'deletePackage',
        {'pkg': pkg},
      );
}

/// {@category Endpoint}
class EndpointPayment extends _i1.EndpointRef {
  EndpointPayment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'payment';

  _i2.Future<_i14.PaymentResponse> createInvoice(
    String orderId,
    double amount,
    String? email,
  ) =>
      caller.callServerEndpoint<_i14.PaymentResponse>(
        'payment',
        'createInvoice',
        {
          'orderId': orderId,
          'amount': amount,
          'email': email,
        },
      );

  _i2.Future<_i14.PaymentResponse> createEwallet(
    String orderId,
    double amount,
    String channelCode,
  ) =>
      caller.callServerEndpoint<_i14.PaymentResponse>(
        'payment',
        'createEwallet',
        {
          'orderId': orderId,
          'amount': amount,
          'channelCode': channelCode,
        },
      );

  _i2.Future<_i15.Payment?> getPaymentByExternalId(String externalId) =>
      caller.callServerEndpoint<_i15.Payment?>(
        'payment',
        'getPaymentByExternalId',
        {'externalId': externalId},
      );

  _i2.Future<_i14.PaymentResponse> createPayment({
    required String orderID,
    required double amount,
    String? userEmail,
  }) =>
      caller.callServerEndpoint<_i14.PaymentResponse>(
        'payment',
        'createPayment',
        {
          'orderID': orderID,
          'amount': amount,
          'userEmail': userEmail,
        },
      );

  /// Creates a direct card payment with 3DS authentication
  _i2.Future<_i14.PaymentResponse> createCardPayment({
    required String orderId,
    required double amount,
    required String currency,
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvn,
    required String cardholderFirstName,
    required String cardholderLastName,
    required String cardholderEmail,
    String? cardholderPhone,
    String? description,
    required bool preAuthorize,
  }) =>
      caller.callServerEndpoint<_i14.PaymentResponse>(
        'payment',
        'createCardPayment',
        {
          'orderId': orderId,
          'amount': amount,
          'currency': currency,
          'cardNumber': cardNumber,
          'expiryMonth': expiryMonth,
          'expiryYear': expiryYear,
          'cvn': cvn,
          'cardholderFirstName': cardholderFirstName,
          'cardholderLastName': cardholderLastName,
          'cardholderEmail': cardholderEmail,
          'cardholderPhone': cardholderPhone,
          'description': description,
          'preAuthorize': preAuthorize,
        },
      );

  /// Captures a pre-authorized card payment
  _i2.Future<_i14.PaymentResponse> captureCardPayment({
    required String paymentRequestId,
    required double captureAmount,
  }) =>
      caller.callServerEndpoint<_i14.PaymentResponse>(
        'payment',
        'captureCardPayment',
        {
          'paymentRequestId': paymentRequestId,
          'captureAmount': captureAmount,
        },
      );

  /// Gets payment request status from Xendit
  _i2.Future<_i14.PaymentResponse> getCardPaymentStatus(
          String paymentRequestId) =>
      caller.callServerEndpoint<_i14.PaymentResponse>(
        'payment',
        'getCardPaymentStatus',
        {'paymentRequestId': paymentRequestId},
      );

  /// Creates a QR PH payment
  _i2.Future<_i14.PaymentResponse> createQrPayment(
    String orderId,
    double amount,
  ) =>
      caller.callServerEndpoint<_i14.PaymentResponse>(
        'payment',
        'createQrPayment',
        {
          'orderId': orderId,
          'amount': amount,
        },
      );

  /// Creates a PayLater payment (BillEase, Cashalo)
  _i2.Future<_i14.PaymentResponse> createPayLater(
    String orderId,
    double amount,
    String channelCode,
    String? email,
    String? phone,
  ) =>
      caller.callServerEndpoint<_i14.PaymentResponse>(
        'payment',
        'createPayLater',
        {
          'orderId': orderId,
          'amount': amount,
          'channelCode': channelCode,
          'email': email,
          'phone': phone,
        },
      );

  /// Creates a Direct Debit payment (BPI, UnionBank)
  _i2.Future<_i14.PaymentResponse> createDirectDebit(
    String orderId,
    double amount,
    String channelCode,
    String? email,
  ) =>
      caller.callServerEndpoint<_i14.PaymentResponse>(
        'payment',
        'createDirectDebit',
        {
          'orderId': orderId,
          'amount': amount,
          'channelCode': channelCode,
          'email': email,
        },
      );

  /// Webhook handler for Xendit payment callbacks
  _i2.Future<void> handleWebhook(Map<String, dynamic> payload) =>
      caller.callServerEndpoint<void>(
        'payment',
        'handleWebhook',
        {'payload': payload},
      );
}

/// {@category Endpoint}
class EndpointProduct extends _i1.EndpointRef {
  EndpointProduct(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'product';

  _i2.Future<List<_i16.Product>> getAllProduct() =>
      caller.callServerEndpoint<List<_i16.Product>>(
        'product',
        'getAllProduct',
        {},
      );

  _i2.Future<_i16.Product?> createProduct(_i16.Product product) =>
      caller.callServerEndpoint<_i16.Product?>(
        'product',
        'createProduct',
        {'product': product},
      );

  _i2.Future<List<_i16.Product>> createProducts(List<_i16.Product> products) =>
      caller.callServerEndpoint<List<_i16.Product>>(
        'product',
        'createProducts',
        {'products': products},
      );

  _i2.Future<_i16.Product?> getProductById(int id) =>
      caller.callServerEndpoint<_i16.Product?>(
        'product',
        'getProductById',
        {'id': id},
      );

  _i2.Future<_i16.Product?> updateProduct(_i16.Product product) =>
      caller.callServerEndpoint<_i16.Product?>(
        'product',
        'updateProduct',
        {'product': product},
      );

  _i2.Future<void> deleteProduct(_i16.Product prod) =>
      caller.callServerEndpoint<void>(
        'product',
        'deleteProduct',
        {'prod': prod},
      );

  _i2.Future<void> deleteProductById(int id) => caller.callServerEndpoint<void>(
        'product',
        'deleteProductById',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointRanks extends _i1.EndpointRef {
  EndpointRanks(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ranks';

  _i2.Future<List<_i17.Ranks>> getAllRanks() =>
      caller.callServerEndpoint<List<_i17.Ranks>>(
        'ranks',
        'getAllRanks',
        {},
      );

  _i2.Future<_i17.Ranks?> createRanks(_i17.Ranks rank) =>
      caller.callServerEndpoint<_i17.Ranks?>(
        'ranks',
        'createRanks',
        {'rank': rank},
      );

  _i2.Future<List<_i17.Ranks>> createMultipleRanks(List<_i17.Ranks> ranks) =>
      caller.callServerEndpoint<List<_i17.Ranks>>(
        'ranks',
        'createMultipleRanks',
        {'ranks': ranks},
      );

  _i2.Future<_i17.Ranks?> getRankById(int id) =>
      caller.callServerEndpoint<_i17.Ranks?>(
        'ranks',
        'getRankById',
        {'id': id},
      );

  _i2.Future<_i17.Ranks?> updateRank(_i17.Ranks rank) =>
      caller.callServerEndpoint<_i17.Ranks?>(
        'ranks',
        'updateRank',
        {'rank': rank},
      );

  _i2.Future<void> deleteRank(_i17.Ranks rank) =>
      caller.callServerEndpoint<void>(
        'ranks',
        'deleteRank',
        {'rank': rank},
      );
}

/// {@category Endpoint}
class EndpointReaperCommission extends _i1.EndpointRef {
  EndpointReaperCommission(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'reaperCommission';

  _i2.Future<List<_i18.ReaperCommission>> getByPackageId(int packageId) =>
      caller.callServerEndpoint<List<_i18.ReaperCommission>>(
        'reaperCommission',
        'getByPackageId',
        {'packageId': packageId},
      );
}

/// {@category Endpoint}
class EndpointSale extends _i1.EndpointRef {
  EndpointSale(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sale';

  _i2.Future<_i19.Sale?> insertSaleWithItems(_i19.Sale sale) =>
      caller.callServerEndpoint<_i19.Sale?>(
        'sale',
        'insertSaleWithItems',
        {'sale': sale},
      );

  _i2.Future<List<_i19.Sale>?> getSalesWithItems(int saleID) =>
      caller.callServerEndpoint<List<_i19.Sale>?>(
        'sale',
        'getSalesWithItems',
        {'saleID': saleID},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  /// Get user profile by user ID
  _i2.Future<_i20.User?> getUserById(int userId) =>
      caller.callServerEndpoint<_i20.User?>(
        'user',
        'getUserById',
        {'userId': userId},
      );

  /// Get user profile by auth user info ID
  _i2.Future<_i20.User?> getUserByAuthId(int userInfoId) =>
      caller.callServerEndpoint<_i20.User?>(
        'user',
        'getUserByAuthId',
        {'userInfoId': userInfoId},
      );

  /// Get or create user profile - creates a new user if one doesn't exist for the given auth ID
  _i2.Future<_i20.User?> getOrCreateUser(int userInfoId) =>
      caller.callServerEndpoint<_i20.User?>(
        'user',
        'getOrCreateUser',
        {'userInfoId': userInfoId},
      );

  /// Update user profile (name fields only)
  _i2.Future<_i20.User?> updateProfile({
    required int userId,
    required String firstName,
    required String middleName,
    required String lastName,
  }) =>
      caller.callServerEndpoint<_i20.User?>(
        'user',
        'updateProfile',
        {
          'userId': userId,
          'firstName': firstName,
          'middleName': middleName,
          'lastName': lastName,
        },
      );

  /// Update user phone number
  _i2.Future<_i20.User?> updatePhone({
    required int userId,
    required String phone,
  }) =>
      caller.callServerEndpoint<_i20.User?>(
        'user',
        'updatePhone',
        {
          'userId': userId,
          'phone': phone,
        },
      );

  /// Get full name of user
  _i2.Future<String?> getFullName(int userId) =>
      caller.callServerEndpoint<String?>(
        'user',
        'getFullName',
        {'userId': userId},
      );

  /// Update user location (latitude and longitude)
  _i2.Future<_i20.User?> updateLocation({
    required int userId,
    required double latitude,
    required double longitude,
  }) =>
      caller.callServerEndpoint<_i20.User?>(
        'user',
        'updateLocation',
        {
          'userId': userId,
          'latitude': latitude,
          'longitude': longitude,
        },
      );

  /// Get user stats (referrals count, total earnings, orders count)
  _i2.Future<Map<String, dynamic>> getUserStats(int userId) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'user',
        'getUserStats',
        {'userId': userId},
      );

  /// Get referrals count for a user
  _i2.Future<int> getReferralsCount(int userId) =>
      caller.callServerEndpoint<int>(
        'user',
        'getReferralsCount',
        {'userId': userId},
      );

  /// Get total earnings for a user
  _i2.Future<double> getTotalEarnings(int userId) =>
      caller.callServerEndpoint<double>(
        'user',
        'getTotalEarnings',
        {'userId': userId},
      );

  /// Get orders count for a user
  _i2.Future<int> getOrdersCount(int userId) => caller.callServerEndpoint<int>(
        'user',
        'getOrdersCount',
        {'userId': userId},
      );
}

/// {@category Endpoint}
class EndpointWebhooks extends _i1.EndpointRef {
  EndpointWebhooks(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'webhooks';

  /// Xendit webhook handler for payment status updates
  /// Handles: invoice.paid, invoice.expired, ewallet.capture, etc.
  _i2.Future<Map<String, dynamic>> xendit(
    Map<String, dynamic> body,
    String? callbackToken,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'webhooks',
        'xendit',
        {
          'body': body,
          'callbackToken': callbackToken,
        },
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i21.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i21.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i4.Caller(client);
  }

  late final _i4.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i22.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    address = EndpointAddress(this);
    admin = EndpointAdmin(this);
    cart = EndpointCart(this);
    commissions = EndpointCommissions(this);
    commissionsRule = EndpointCommissionsRule(this);
    distributors = EndpointDistributors(this);
    goldenSeat = EndpointGoldenSeat(this);
    membership = EndpointMembership(this);
    menu = EndpointMenu(this);
    package = EndpointPackage(this);
    payment = EndpointPayment(this);
    product = EndpointProduct(this);
    ranks = EndpointRanks(this);
    reaperCommission = EndpointReaperCommission(this);
    sale = EndpointSale(this);
    user = EndpointUser(this);
    webhooks = EndpointWebhooks(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointAddress address;

  late final EndpointAdmin admin;

  late final EndpointCart cart;

  late final EndpointCommissions commissions;

  late final EndpointCommissionsRule commissionsRule;

  late final EndpointDistributors distributors;

  late final EndpointGoldenSeat goldenSeat;

  late final EndpointMembership membership;

  late final EndpointMenu menu;

  late final EndpointPackage package;

  late final EndpointPayment payment;

  late final EndpointProduct product;

  late final EndpointRanks ranks;

  late final EndpointReaperCommission reaperCommission;

  late final EndpointSale sale;

  late final EndpointUser user;

  late final EndpointWebhooks webhooks;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'address': address,
        'admin': admin,
        'cart': cart,
        'commissions': commissions,
        'commissionsRule': commissionsRule,
        'distributors': distributors,
        'goldenSeat': goldenSeat,
        'membership': membership,
        'menu': menu,
        'package': package,
        'payment': payment,
        'product': product,
        'ranks': ranks,
        'reaperCommission': reaperCommission,
        'sale': sale,
        'user': user,
        'webhooks': webhooks,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
