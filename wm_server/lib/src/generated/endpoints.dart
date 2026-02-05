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
import '../endpoints/address_endpoint.dart' as _i2;
import '../endpoints/admin_endpoint.dart' as _i3;
import '../endpoints/cart_endpoint.dart' as _i4;
import '../endpoints/commissions_endpoint.dart' as _i5;
import '../endpoints/commissions_rule_endpoint.dart' as _i6;
import '../endpoints/distributors_endpoint.dart' as _i7;
import '../endpoints/golden_seat_endpoint.dart' as _i8;
import '../endpoints/membership_endpoint.dart' as _i9;
import '../endpoints/menu_endpoint.dart' as _i10;
import '../endpoints/package_endpoint.dart' as _i11;
import '../endpoints/payment_endpoint.dart' as _i12;
import '../endpoints/products_endpoint.dart' as _i13;
import '../endpoints/ranks_endpoint.dart' as _i14;
import '../endpoints/reaper_commission_endpoint.dart' as _i15;
import '../endpoints/sale_endpoint.dart' as _i16;
import '../endpoints/user_endpoint.dart' as _i17;
import '../endpoints/webhooks_endpoint.dart' as _i18;
import '../greeting_endpoint.dart' as _i19;
import 'package:wm_server/src/generated/addresses.dart' as _i20;
import 'package:wm_server/src/generated/cart.dart' as _i21;
import 'package:wm_server/src/generated/commissions.dart' as _i22;
import 'package:wm_server/src/generated/commission_rule.dart' as _i23;
import 'package:wm_server/src/generated/distributors.dart' as _i24;
import 'package:wm_server/src/generated/golden_seats.dart' as _i25;
import 'package:wm_server/src/generated/membership_package.dart' as _i26;
import 'package:wm_server/src/generated/packages.dart' as _i27;
import 'package:wm_server/src/generated/products.dart' as _i28;
import 'package:wm_server/src/generated/ranks.dart' as _i29;
import 'package:wm_server/src/generated/sale.dart' as _i30;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i31;
import 'package:wm_server/src/generated/future_calls.dart' as _i32;
export 'future_calls.dart' show ServerpodFutureCallsGetter;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'address': _i2.AddressEndpoint()
        ..initialize(
          server,
          'address',
          null,
        ),
      'admin': _i3.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'cart': _i4.CartEndpoint()
        ..initialize(
          server,
          'cart',
          null,
        ),
      'commissions': _i5.CommissionsEndpoint()
        ..initialize(
          server,
          'commissions',
          null,
        ),
      'commissionsRule': _i6.CommissionsRuleEndpoint()
        ..initialize(
          server,
          'commissionsRule',
          null,
        ),
      'distributors': _i7.DistributorsEndpoint()
        ..initialize(
          server,
          'distributors',
          null,
        ),
      'goldenSeat': _i8.GoldenSeatEndpoint()
        ..initialize(
          server,
          'goldenSeat',
          null,
        ),
      'membership': _i9.MembershipEndpoint()
        ..initialize(
          server,
          'membership',
          null,
        ),
      'menu': _i10.MenuEndpoint()
        ..initialize(
          server,
          'menu',
          null,
        ),
      'package': _i11.PackageEndpoint()
        ..initialize(
          server,
          'package',
          null,
        ),
      'payment': _i12.PaymentEndpoint()
        ..initialize(
          server,
          'payment',
          null,
        ),
      'product': _i13.ProductEndpoint()
        ..initialize(
          server,
          'product',
          null,
        ),
      'ranks': _i14.RanksEndpoint()
        ..initialize(
          server,
          'ranks',
          null,
        ),
      'reaperCommission': _i15.ReaperCommissionEndpoint()
        ..initialize(
          server,
          'reaperCommission',
          null,
        ),
      'sale': _i16.SaleEndpoint()
        ..initialize(
          server,
          'sale',
          null,
        ),
      'user': _i17.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'webhooks': _i18.WebhooksEndpoint()
        ..initialize(
          server,
          'webhooks',
          null,
        ),
      'greeting': _i19.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['address'] = _i1.EndpointConnector(
      name: 'address',
      endpoint: endpoints['address']!,
      methodConnectors: {
        'getAddressesByUserId': _i1.MethodConnector(
          name: 'getAddressesByUserId',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['address'] as _i2.AddressEndpoint)
                  .getAddressesByUserId(
                    session,
                    params['userId'],
                  ),
        ),
        'getPrimaryAddress': _i1.MethodConnector(
          name: 'getPrimaryAddress',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['address'] as _i2.AddressEndpoint)
                  .getPrimaryAddress(
                    session,
                    params['userId'],
                  ),
        ),
        'addAddress': _i1.MethodConnector(
          name: 'addAddress',
          params: {
            'address': _i1.ParameterDescription(
              name: 'address',
              type: _i1.getType<_i20.Addresses>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['address'] as _i2.AddressEndpoint).addAddress(
                    session,
                    params['address'],
                  ),
        ),
        'updateAddress': _i1.MethodConnector(
          name: 'updateAddress',
          params: {
            'address': _i1.ParameterDescription(
              name: 'address',
              type: _i1.getType<_i20.Addresses>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['address'] as _i2.AddressEndpoint).updateAddress(
                    session,
                    params['address'],
                  ),
        ),
        'deleteAddress': _i1.MethodConnector(
          name: 'deleteAddress',
          params: {
            'addressId': _i1.ParameterDescription(
              name: 'addressId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['address'] as _i2.AddressEndpoint).deleteAddress(
                    session,
                    params['addressId'],
                    params['userId'],
                  ),
        ),
        'setPrimaryAddress': _i1.MethodConnector(
          name: 'setPrimaryAddress',
          params: {
            'addressId': _i1.ParameterDescription(
              name: 'addressId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['address'] as _i2.AddressEndpoint)
                  .setPrimaryAddress(
                    session,
                    params['addressId'],
                    params['userId'],
                  ),
        ),
        'getAddressCount': _i1.MethodConnector(
          name: 'getAddressCount',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['address'] as _i2.AddressEndpoint).getAddressCount(
                    session,
                    params['userId'],
                  ),
        ),
      },
    );
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'getAllUsers': _i1.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _i3.AdminEndpoint).getAllUsers(
                session,
              ),
        ),
        'blockUser': _i1.MethodConnector(
          name: 'blockUser',
          params: {
            'userID': _i1.ParameterDescription(
              name: 'userID',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _i3.AdminEndpoint).blockUser(
                session,
                params['userID'],
              ),
        ),
        'unblockUser': _i1.MethodConnector(
          name: 'unblockUser',
          params: {
            'userID': _i1.ParameterDescription(
              name: 'userID',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _i3.AdminEndpoint).unblockUser(
                session,
                params['userID'],
              ),
        ),
      },
    );
    connectors['cart'] = _i1.EndpointConnector(
      name: 'cart',
      endpoint: endpoints['cart']!,
      methodConnectors: {
        'getCartByUserId': _i1.MethodConnector(
          name: 'getCartByUserId',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cart'] as _i4.CartEndpoint).getCartByUserId(
                    session,
                    params['userId'],
                  ),
        ),
        'removeFromCart': _i1.MethodConnector(
          name: 'removeFromCart',
          params: {
            'cart': _i1.ParameterDescription(
              name: 'cart',
              type: _i1.getType<_i21.Cart>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i4.CartEndpoint).removeFromCart(
                session,
                params['cart'],
              ),
        ),
        'updateCartItem': _i1.MethodConnector(
          name: 'updateCartItem',
          params: {
            'cart': _i1.ParameterDescription(
              name: 'cart',
              type: _i1.getType<_i21.Cart>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i4.CartEndpoint).updateCartItem(
                session,
                params['cart'],
              ),
        ),
        'getCartItemCount': _i1.MethodConnector(
          name: 'getCartItemCount',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cart'] as _i4.CartEndpoint).getCartItemCount(
                    session,
                    params['userId'],
                  ),
        ),
        'addItemToCart': _i1.MethodConnector(
          name: 'addItemToCart',
          params: {
            'userID': _i1.ParameterDescription(
              name: 'userID',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'productID': _i1.ParameterDescription(
              name: 'productID',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i4.CartEndpoint).addItemToCart(
                session,
                userID: params['userID'],
                productID: params['productID'],
                quantity: params['quantity'],
              ),
        ),
        'checkOutCart': _i1.MethodConnector(
          name: 'checkOutCart',
          params: {
            'userID': _i1.ParameterDescription(
              name: 'userID',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'paymentMethod': _i1.ParameterDescription(
              name: 'paymentMethod',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i4.CartEndpoint).checkOutCart(
                session,
                userID: params['userID'],
                paymentMethod: params['paymentMethod'],
              ),
        ),
        'markOrderPaidAndClearCart': _i1.MethodConnector(
          name: 'markOrderPaidAndClearCart',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i4.CartEndpoint)
                  .markOrderPaidAndClearCart(
                    session,
                    userId: params['userId'],
                    orderId: params['orderId'],
                  ),
        ),
        'clearUserCart': _i1.MethodConnector(
          name: 'clearUserCart',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cart'] as _i4.CartEndpoint).clearUserCart(
                session,
                params['userId'],
              ),
        ),
        'debugCartStatus': _i1.MethodConnector(
          name: 'debugCartStatus',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cart'] as _i4.CartEndpoint).debugCartStatus(
                    session,
                    params['userId'],
                  ),
        ),
      },
    );
    connectors['commissions'] = _i1.EndpointConnector(
      name: 'commissions',
      endpoint: endpoints['commissions']!,
      methodConnectors: {
        'getCommissionById': _i1.MethodConnector(
          name: 'getCommissionById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['commissions'] as _i5.CommissionsEndpoint)
                  .getCommissionById(
                    session,
                    params['id'],
                  ),
        ),
        'getAllCommissions': _i1.MethodConnector(
          name: 'getAllCommissions',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['commissions'] as _i5.CommissionsEndpoint)
                  .getAllCommissions(session),
        ),
        'createCommission': _i1.MethodConnector(
          name: 'createCommission',
          params: {
            'commission': _i1.ParameterDescription(
              name: 'commission',
              type: _i1.getType<_i22.Commissions>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['commissions'] as _i5.CommissionsEndpoint)
                  .createCommission(
                    session,
                    params['commission'],
                  ),
        ),
        'updateCommission': _i1.MethodConnector(
          name: 'updateCommission',
          params: {
            'commission': _i1.ParameterDescription(
              name: 'commission',
              type: _i1.getType<_i22.Commissions>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['commissions'] as _i5.CommissionsEndpoint)
                  .updateCommission(
                    session,
                    params['commission'],
                  ),
        ),
        'deleteCommission': _i1.MethodConnector(
          name: 'deleteCommission',
          params: {
            'commission': _i1.ParameterDescription(
              name: 'commission',
              type: _i1.getType<_i22.Commissions>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['commissions'] as _i5.CommissionsEndpoint)
                  .deleteCommission(
                    session,
                    params['commission'],
                  ),
        ),
        'createMultipleCommissions': _i1.MethodConnector(
          name: 'createMultipleCommissions',
          params: {
            'commissions': _i1.ParameterDescription(
              name: 'commissions',
              type: _i1.getType<List<_i22.Commissions>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['commissions'] as _i5.CommissionsEndpoint)
                  .createMultipleCommissions(
                    session,
                    params['commissions'],
                  ),
        ),
      },
    );
    connectors['commissionsRule'] = _i1.EndpointConnector(
      name: 'commissionsRule',
      endpoint: endpoints['commissionsRule']!,
      methodConnectors: {
        'getAllCommissionRules': _i1.MethodConnector(
          name: 'getAllCommissionRules',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['commissionsRule'] as _i6.CommissionsRuleEndpoint)
                      .getAllCommissionRules(session),
        ),
        'createCommissionRule': _i1.MethodConnector(
          name: 'createCommissionRule',
          params: {
            'rule': _i1.ParameterDescription(
              name: 'rule',
              type: _i1.getType<_i23.CommissionRule>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['commissionsRule'] as _i6.CommissionsRuleEndpoint)
                      .createCommissionRule(
                        session,
                        params['rule'],
                      ),
        ),
        'createMultipleCommissionRules': _i1.MethodConnector(
          name: 'createMultipleCommissionRules',
          params: {
            'rules': _i1.ParameterDescription(
              name: 'rules',
              type: _i1.getType<List<_i23.CommissionRule>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['commissionsRule'] as _i6.CommissionsRuleEndpoint)
                      .createMultipleCommissionRules(
                        session,
                        params['rules'],
                      ),
        ),
        'getCommissionRuleById': _i1.MethodConnector(
          name: 'getCommissionRuleById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['commissionsRule'] as _i6.CommissionsRuleEndpoint)
                      .getCommissionRuleById(
                        session,
                        params['id'],
                      ),
        ),
        'updateCommissionRule': _i1.MethodConnector(
          name: 'updateCommissionRule',
          params: {
            'rule': _i1.ParameterDescription(
              name: 'rule',
              type: _i1.getType<_i23.CommissionRule>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['commissionsRule'] as _i6.CommissionsRuleEndpoint)
                      .updateCommissionRule(
                        session,
                        params['rule'],
                      ),
        ),
        'deleteCommissionRule': _i1.MethodConnector(
          name: 'deleteCommissionRule',
          params: {
            'rule': _i1.ParameterDescription(
              name: 'rule',
              type: _i1.getType<_i23.CommissionRule>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['commissionsRule'] as _i6.CommissionsRuleEndpoint)
                      .deleteCommissionRule(
                        session,
                        params['rule'],
                      ),
        ),
      },
    );
    connectors['distributors'] = _i1.EndpointConnector(
      name: 'distributors',
      endpoint: endpoints['distributors']!,
      methodConnectors: {
        'getAllDistributors': _i1.MethodConnector(
          name: 'getAllDistributors',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['distributors'] as _i7.DistributorsEndpoint)
                  .getAllDistributors(session),
        ),
        'createDistributor': _i1.MethodConnector(
          name: 'createDistributor',
          params: {
            'distributor': _i1.ParameterDescription(
              name: 'distributor',
              type: _i1.getType<_i24.Distributors>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['distributors'] as _i7.DistributorsEndpoint)
                  .createDistributor(
                    session,
                    params['distributor'],
                  ),
        ),
        'createMultipleDistributors': _i1.MethodConnector(
          name: 'createMultipleDistributors',
          params: {
            'distributors': _i1.ParameterDescription(
              name: 'distributors',
              type: _i1.getType<List<_i24.Distributors>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['distributors'] as _i7.DistributorsEndpoint)
                  .createMultipleDistributors(
                    session,
                    params['distributors'],
                  ),
        ),
        'getDistributorById': _i1.MethodConnector(
          name: 'getDistributorById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['distributors'] as _i7.DistributorsEndpoint)
                  .getDistributorById(
                    session,
                    params['id'],
                  ),
        ),
        'updateDistributor': _i1.MethodConnector(
          name: 'updateDistributor',
          params: {
            'distributor': _i1.ParameterDescription(
              name: 'distributor',
              type: _i1.getType<_i24.Distributors>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['distributors'] as _i7.DistributorsEndpoint)
                  .updateDistributor(
                    session,
                    params['distributor'],
                  ),
        ),
      },
    );
    connectors['goldenSeat'] = _i1.EndpointConnector(
      name: 'goldenSeat',
      endpoint: endpoints['goldenSeat']!,
      methodConnectors: {
        'getAllGoldenSeats': _i1.MethodConnector(
          name: 'getAllGoldenSeats',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['goldenSeat'] as _i8.GoldenSeatEndpoint)
                  .getAllGoldenSeats(session),
        ),
        'getGoldenSeatById': _i1.MethodConnector(
          name: 'getGoldenSeatById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['goldenSeat'] as _i8.GoldenSeatEndpoint)
                  .getGoldenSeatById(
                    session,
                    params['id'],
                  ),
        ),
        'createGoldenSeat': _i1.MethodConnector(
          name: 'createGoldenSeat',
          params: {
            'goldenSeat': _i1.ParameterDescription(
              name: 'goldenSeat',
              type: _i1.getType<_i25.GoldenSeats>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['goldenSeat'] as _i8.GoldenSeatEndpoint)
                  .createGoldenSeat(
                    session,
                    params['goldenSeat'],
                  ),
        ),
        'updateGoldenSeat': _i1.MethodConnector(
          name: 'updateGoldenSeat',
          params: {
            'goldenSeat': _i1.ParameterDescription(
              name: 'goldenSeat',
              type: _i1.getType<_i25.GoldenSeats>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['goldenSeat'] as _i8.GoldenSeatEndpoint)
                  .updateGoldenSeat(
                    session,
                    params['goldenSeat'],
                  ),
        ),
        'deleteGoldenSeat': _i1.MethodConnector(
          name: 'deleteGoldenSeat',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['goldenSeat'] as _i8.GoldenSeatEndpoint)
                  .deleteGoldenSeat(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['membership'] = _i1.EndpointConnector(
      name: 'membership',
      endpoint: endpoints['membership']!,
      methodConnectors: {
        'getAllMembershipPackages': _i1.MethodConnector(
          name: 'getAllMembershipPackages',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['membership'] as _i9.MembershipEndpoint)
                  .getAllMembershipPackages(session),
        ),
        'getMembershipPackageById': _i1.MethodConnector(
          name: 'getMembershipPackageById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['membership'] as _i9.MembershipEndpoint)
                  .getMembershipPackageById(
                    session,
                    params['id'],
                  ),
        ),
        'createMembershipPackage': _i1.MethodConnector(
          name: 'createMembershipPackage',
          params: {
            'package': _i1.ParameterDescription(
              name: 'package',
              type: _i1.getType<_i26.MembershipPackage>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['membership'] as _i9.MembershipEndpoint)
                  .createMembershipPackage(
                    session,
                    params['package'],
                  ),
        ),
        'updateMembershipPackage': _i1.MethodConnector(
          name: 'updateMembershipPackage',
          params: {
            'package': _i1.ParameterDescription(
              name: 'package',
              type: _i1.getType<_i26.MembershipPackage>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['membership'] as _i9.MembershipEndpoint)
                  .updateMembershipPackage(
                    session,
                    params['package'],
                  ),
        ),
        'deleteMembershipPackage': _i1.MethodConnector(
          name: 'deleteMembershipPackage',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['membership'] as _i9.MembershipEndpoint)
                  .deleteMembershipPackage(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['menu'] = _i1.EndpointConnector(
      name: 'menu',
      endpoint: endpoints['menu']!,
      methodConnectors: {
        'getAllActiveMenus': _i1.MethodConnector(
          name: 'getAllActiveMenus',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['menu'] as _i10.MenuEndpoint)
                  .getAllActiveMenus(session),
        ),
        'getMenuWithItems': _i1.MethodConnector(
          name: 'getMenuWithItems',
          params: {
            'menuID': _i1.ParameterDescription(
              name: 'menuID',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['menu'] as _i10.MenuEndpoint).getMenuWithItems(
                    session,
                    params['menuID'],
                  ),
        ),
      },
    );
    connectors['package'] = _i1.EndpointConnector(
      name: 'package',
      endpoint: endpoints['package']!,
      methodConnectors: {
        'getAllPackages': _i1.MethodConnector(
          name: 'getAllPackages',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['package'] as _i11.PackageEndpoint)
                  .getAllPackages(session),
        ),
        'createPackage': _i1.MethodConnector(
          name: 'createPackage',
          params: {
            'package': _i1.ParameterDescription(
              name: 'package',
              type: _i1.getType<_i27.Package>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['package'] as _i11.PackageEndpoint).createPackage(
                    session,
                    params['package'],
                  ),
        ),
        'getPackageById': _i1.MethodConnector(
          name: 'getPackageById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['package'] as _i11.PackageEndpoint).getPackageById(
                    session,
                    params['id'],
                  ),
        ),
        'updatePackage': _i1.MethodConnector(
          name: 'updatePackage',
          params: {
            'package': _i1.ParameterDescription(
              name: 'package',
              type: _i1.getType<_i27.Package>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['package'] as _i11.PackageEndpoint).updatePackage(
                    session,
                    params['package'],
                  ),
        ),
        'deletePackage': _i1.MethodConnector(
          name: 'deletePackage',
          params: {
            'pkg': _i1.ParameterDescription(
              name: 'pkg',
              type: _i1.getType<_i27.Package>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['package'] as _i11.PackageEndpoint).deletePackage(
                    session,
                    params['pkg'],
                  ),
        ),
      },
    );
    connectors['payment'] = _i1.EndpointConnector(
      name: 'payment',
      endpoint: endpoints['payment']!,
      methodConnectors: {
        'createInvoice': _i1.MethodConnector(
          name: 'createInvoice',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['payment'] as _i12.PaymentEndpoint).createInvoice(
                    session,
                    params['orderId'],
                    params['amount'],
                    params['email'],
                  ),
        ),
        'createEwallet': _i1.MethodConnector(
          name: 'createEwallet',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'channelCode': _i1.ParameterDescription(
              name: 'channelCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['payment'] as _i12.PaymentEndpoint).createEwallet(
                    session,
                    params['orderId'],
                    params['amount'],
                    params['channelCode'],
                  ),
        ),
        'getPaymentByExternalId': _i1.MethodConnector(
          name: 'getPaymentByExternalId',
          params: {
            'externalId': _i1.ParameterDescription(
              name: 'externalId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['payment'] as _i12.PaymentEndpoint)
                  .getPaymentByExternalId(
                    session,
                    params['externalId'],
                  ),
        ),
        'createPayment': _i1.MethodConnector(
          name: 'createPayment',
          params: {
            'orderID': _i1.ParameterDescription(
              name: 'orderID',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'userEmail': _i1.ParameterDescription(
              name: 'userEmail',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['payment'] as _i12.PaymentEndpoint).createPayment(
                    session,
                    orderID: params['orderID'],
                    amount: params['amount'],
                    userEmail: params['userEmail'],
                  ),
        ),
        'createCardPayment': _i1.MethodConnector(
          name: 'createCardPayment',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'currency': _i1.ParameterDescription(
              name: 'currency',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'cardNumber': _i1.ParameterDescription(
              name: 'cardNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'expiryMonth': _i1.ParameterDescription(
              name: 'expiryMonth',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'expiryYear': _i1.ParameterDescription(
              name: 'expiryYear',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'cvn': _i1.ParameterDescription(
              name: 'cvn',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'cardholderFirstName': _i1.ParameterDescription(
              name: 'cardholderFirstName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'cardholderLastName': _i1.ParameterDescription(
              name: 'cardholderLastName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'cardholderEmail': _i1.ParameterDescription(
              name: 'cardholderEmail',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'cardholderPhone': _i1.ParameterDescription(
              name: 'cardholderPhone',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'preAuthorize': _i1.ParameterDescription(
              name: 'preAuthorize',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['payment'] as _i12.PaymentEndpoint)
                  .createCardPayment(
                    session,
                    orderId: params['orderId'],
                    amount: params['amount'],
                    currency: params['currency'],
                    cardNumber: params['cardNumber'],
                    expiryMonth: params['expiryMonth'],
                    expiryYear: params['expiryYear'],
                    cvn: params['cvn'],
                    cardholderFirstName: params['cardholderFirstName'],
                    cardholderLastName: params['cardholderLastName'],
                    cardholderEmail: params['cardholderEmail'],
                    cardholderPhone: params['cardholderPhone'],
                    description: params['description'],
                    preAuthorize: params['preAuthorize'],
                  ),
        ),
        'captureCardPayment': _i1.MethodConnector(
          name: 'captureCardPayment',
          params: {
            'paymentRequestId': _i1.ParameterDescription(
              name: 'paymentRequestId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'captureAmount': _i1.ParameterDescription(
              name: 'captureAmount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['payment'] as _i12.PaymentEndpoint)
                  .captureCardPayment(
                    session,
                    paymentRequestId: params['paymentRequestId'],
                    captureAmount: params['captureAmount'],
                  ),
        ),
        'getCardPaymentStatus': _i1.MethodConnector(
          name: 'getCardPaymentStatus',
          params: {
            'paymentRequestId': _i1.ParameterDescription(
              name: 'paymentRequestId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['payment'] as _i12.PaymentEndpoint)
                  .getCardPaymentStatus(
                    session,
                    params['paymentRequestId'],
                  ),
        ),
        'createQrPayment': _i1.MethodConnector(
          name: 'createQrPayment',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['payment'] as _i12.PaymentEndpoint)
                  .createQrPayment(
                    session,
                    params['orderId'],
                    params['amount'],
                  ),
        ),
        'createPayLater': _i1.MethodConnector(
          name: 'createPayLater',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'channelCode': _i1.ParameterDescription(
              name: 'channelCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['payment'] as _i12.PaymentEndpoint).createPayLater(
                    session,
                    params['orderId'],
                    params['amount'],
                    params['channelCode'],
                    params['email'],
                    params['phone'],
                  ),
        ),
        'createDirectDebit': _i1.MethodConnector(
          name: 'createDirectDebit',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'amount': _i1.ParameterDescription(
              name: 'amount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'channelCode': _i1.ParameterDescription(
              name: 'channelCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['payment'] as _i12.PaymentEndpoint)
                  .createDirectDebit(
                    session,
                    params['orderId'],
                    params['amount'],
                    params['channelCode'],
                    params['email'],
                  ),
        ),
        'handleWebhook': _i1.MethodConnector(
          name: 'handleWebhook',
          params: {
            'payload': _i1.ParameterDescription(
              name: 'payload',
              type: _i1.getType<Map<String, dynamic>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['payment'] as _i12.PaymentEndpoint).handleWebhook(
                    session,
                    params['payload'],
                  ),
        ),
      },
    );
    connectors['product'] = _i1.EndpointConnector(
      name: 'product',
      endpoint: endpoints['product']!,
      methodConnectors: {
        'getAllProduct': _i1.MethodConnector(
          name: 'getAllProduct',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _i13.ProductEndpoint)
                  .getAllProduct(session),
        ),
        'createProduct': _i1.MethodConnector(
          name: 'createProduct',
          params: {
            'product': _i1.ParameterDescription(
              name: 'product',
              type: _i1.getType<_i28.Product>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i13.ProductEndpoint).createProduct(
                    session,
                    params['product'],
                  ),
        ),
        'createProducts': _i1.MethodConnector(
          name: 'createProducts',
          params: {
            'products': _i1.ParameterDescription(
              name: 'products',
              type: _i1.getType<List<_i28.Product>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i13.ProductEndpoint).createProducts(
                    session,
                    params['products'],
                  ),
        ),
        'getProductById': _i1.MethodConnector(
          name: 'getProductById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i13.ProductEndpoint).getProductById(
                    session,
                    params['id'],
                  ),
        ),
        'updateProduct': _i1.MethodConnector(
          name: 'updateProduct',
          params: {
            'product': _i1.ParameterDescription(
              name: 'product',
              type: _i1.getType<_i28.Product>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i13.ProductEndpoint).updateProduct(
                    session,
                    params['product'],
                  ),
        ),
        'deleteProduct': _i1.MethodConnector(
          name: 'deleteProduct',
          params: {
            'prod': _i1.ParameterDescription(
              name: 'prod',
              type: _i1.getType<_i28.Product>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['product'] as _i13.ProductEndpoint).deleteProduct(
                    session,
                    params['prod'],
                  ),
        ),
        'deleteProductById': _i1.MethodConnector(
          name: 'deleteProductById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _i13.ProductEndpoint)
                  .deleteProductById(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
    connectors['ranks'] = _i1.EndpointConnector(
      name: 'ranks',
      endpoint: endpoints['ranks']!,
      methodConnectors: {
        'getAllRanks': _i1.MethodConnector(
          name: 'getAllRanks',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ranks'] as _i14.RanksEndpoint).getAllRanks(
                session,
              ),
        ),
        'createRanks': _i1.MethodConnector(
          name: 'createRanks',
          params: {
            'rank': _i1.ParameterDescription(
              name: 'rank',
              type: _i1.getType<_i29.Ranks>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ranks'] as _i14.RanksEndpoint).createRanks(
                session,
                params['rank'],
              ),
        ),
        'createMultipleRanks': _i1.MethodConnector(
          name: 'createMultipleRanks',
          params: {
            'ranks': _i1.ParameterDescription(
              name: 'ranks',
              type: _i1.getType<List<_i29.Ranks>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ranks'] as _i14.RanksEndpoint)
                  .createMultipleRanks(
                    session,
                    params['ranks'],
                  ),
        ),
        'getRankById': _i1.MethodConnector(
          name: 'getRankById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ranks'] as _i14.RanksEndpoint).getRankById(
                session,
                params['id'],
              ),
        ),
        'updateRank': _i1.MethodConnector(
          name: 'updateRank',
          params: {
            'rank': _i1.ParameterDescription(
              name: 'rank',
              type: _i1.getType<_i29.Ranks>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ranks'] as _i14.RanksEndpoint).updateRank(
                session,
                params['rank'],
              ),
        ),
        'deleteRank': _i1.MethodConnector(
          name: 'deleteRank',
          params: {
            'rank': _i1.ParameterDescription(
              name: 'rank',
              type: _i1.getType<_i29.Ranks>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ranks'] as _i14.RanksEndpoint).deleteRank(
                session,
                params['rank'],
              ),
        ),
      },
    );
    connectors['reaperCommission'] = _i1.EndpointConnector(
      name: 'reaperCommission',
      endpoint: endpoints['reaperCommission']!,
      methodConnectors: {
        'getByPackageId': _i1.MethodConnector(
          name: 'getByPackageId',
          params: {
            'packageId': _i1.ParameterDescription(
              name: 'packageId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['reaperCommission']
                          as _i15.ReaperCommissionEndpoint)
                      .getByPackageId(
                        session,
                        params['packageId'],
                      ),
        ),
      },
    );
    connectors['sale'] = _i1.EndpointConnector(
      name: 'sale',
      endpoint: endpoints['sale']!,
      methodConnectors: {
        'insertSaleWithItems': _i1.MethodConnector(
          name: 'insertSaleWithItems',
          params: {
            'sale': _i1.ParameterDescription(
              name: 'sale',
              type: _i1.getType<_i30.Sale>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['sale'] as _i16.SaleEndpoint).insertSaleWithItems(
                    session,
                    params['sale'],
                  ),
        ),
        'getSalesWithItems': _i1.MethodConnector(
          name: 'getSalesWithItems',
          params: {
            'saleID': _i1.ParameterDescription(
              name: 'saleID',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['sale'] as _i16.SaleEndpoint).getSalesWithItems(
                    session,
                    params['saleID'],
                  ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i17.UserEndpoint).getUserById(
                session,
                params['userId'],
              ),
        ),
        'getUserByAuthId': _i1.MethodConnector(
          name: 'getUserByAuthId',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i17.UserEndpoint).getUserByAuthId(
                    session,
                    params['userInfoId'],
                  ),
        ),
        'getOrCreateUser': _i1.MethodConnector(
          name: 'getOrCreateUser',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i17.UserEndpoint).getOrCreateUser(
                    session,
                    params['userInfoId'],
                  ),
        ),
        'updateProfile': _i1.MethodConnector(
          name: 'updateProfile',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'middleName': _i1.ParameterDescription(
              name: 'middleName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i17.UserEndpoint).updateProfile(
                session,
                userId: params['userId'],
                firstName: params['firstName'],
                middleName: params['middleName'],
                lastName: params['lastName'],
              ),
        ),
        'updatePhone': _i1.MethodConnector(
          name: 'updatePhone',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i17.UserEndpoint).updatePhone(
                session,
                userId: params['userId'],
                phone: params['phone'],
              ),
        ),
        'getFullName': _i1.MethodConnector(
          name: 'getFullName',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i17.UserEndpoint).getFullName(
                session,
                params['userId'],
              ),
        ),
        'updateLocation': _i1.MethodConnector(
          name: 'updateLocation',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'latitude': _i1.ParameterDescription(
              name: 'latitude',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'longitude': _i1.ParameterDescription(
              name: 'longitude',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i17.UserEndpoint).updateLocation(
                    session,
                    userId: params['userId'],
                    latitude: params['latitude'],
                    longitude: params['longitude'],
                  ),
        ),
        'getUserStats': _i1.MethodConnector(
          name: 'getUserStats',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i17.UserEndpoint).getUserStats(
                session,
                params['userId'],
              ),
        ),
        'getReferralsCount': _i1.MethodConnector(
          name: 'getReferralsCount',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i17.UserEndpoint).getReferralsCount(
                    session,
                    params['userId'],
                  ),
        ),
        'getTotalEarnings': _i1.MethodConnector(
          name: 'getTotalEarnings',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i17.UserEndpoint).getTotalEarnings(
                    session,
                    params['userId'],
                  ),
        ),
        'getOrdersCount': _i1.MethodConnector(
          name: 'getOrdersCount',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i17.UserEndpoint).getOrdersCount(
                    session,
                    params['userId'],
                  ),
        ),
      },
    );
    connectors['webhooks'] = _i1.EndpointConnector(
      name: 'webhooks',
      endpoint: endpoints['webhooks']!,
      methodConnectors: {
        'xendit': _i1.MethodConnector(
          name: 'xendit',
          params: {
            'body': _i1.ParameterDescription(
              name: 'body',
              type: _i1.getType<Map<String, dynamic>>(),
              nullable: false,
            ),
            'callbackToken': _i1.ParameterDescription(
              name: 'callbackToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['webhooks'] as _i18.WebhooksEndpoint).xendit(
                    session,
                    params['body'],
                    params['callbackToken'],
                  ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i19.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    modules['serverpod_auth'] = _i31.Endpoints()..initializeEndpoints(server);
  }

  @override
  _i1.FutureCallDispatch? get futureCalls {
    return _i32.FutureCalls();
  }
}
