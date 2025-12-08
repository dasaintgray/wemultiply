import 'package:test/test.dart';
import 'package:wm_server/services/commission_service.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given CommissionService', (sessionBuilder, endpoints) {
    group('service instantiation', () {
      test('should create CommissionService instance', () {
        final service = CommissionService();
        expect(service, isNotNull);
      });
    });

    group('reaper commission endpoint', () {
      test('getByPackageId should return empty list for non-existent package',
          () async {
        final commissions = await endpoints.reaperCommission.getByPackageId(
          sessionBuilder,
          99999, // Non-existent package ID
        );

        expect(commissions, isEmpty);
      });
    });

    group('commissions endpoint', () {
      test('getAllCommissions should return list', () async {
        final commissions = await endpoints.commissions.getAllCommissions(
          sessionBuilder,
        );

        expect(commissions, isA<List>());
      });

      test('getCommissionById should return null for non-existent id',
          () async {
        final commission = await endpoints.commissions.getCommissionById(
          sessionBuilder,
          99999,
        );

        expect(commission, isNull);
      });
    });

    group('membership packages endpoint', () {
      test('getAllMembershipPackages should return list', () async {
        final packages = await endpoints.membership.getAllMembershipPackages(
          sessionBuilder,
        );

        expect(packages, isA<List>());
      });

      test('getMembershipPackageById should return null for non-existent id',
          () async {
        final package = await endpoints.membership.getMembershipPackageById(
          sessionBuilder,
          99999,
        );

        expect(package, isNull);
      });
    });

    group('golden seats endpoint', () {
      test('getAllGoldenSeats should return list', () async {
        final seats = await endpoints.goldenSeat.getAllGoldenSeats(
          sessionBuilder,
        );

        expect(seats, isA<List>());
      });

      test('getGoldenSeatById should return null for non-existent id',
          () async {
        final seat = await endpoints.goldenSeat.getGoldenSeatById(
          sessionBuilder,
          99999,
        );

        expect(seat, isNull);
      });
    });

    group('payment endpoint', () {
      test('getPaymentByExternalId should return null for non-existent id',
          () async {
        final payment = await endpoints.payment.getPaymentByExternalId(
          sessionBuilder,
          'non_existent_external_id',
        );

        expect(payment, isNull);
      });
    });

    group('products endpoint', () {
      test('getAllProduct should return list', () async {
        final products = await endpoints.product.getAllProduct(
          sessionBuilder,
        );

        expect(products, isA<List>());
      });

      test('getProductById should return null for non-existent id', () async {
        final product = await endpoints.product.getProductById(
          sessionBuilder,
          99999,
        );

        expect(product, isNull);
      });
    });

    group('packages endpoint', () {
      test('getAllPackages should return list', () async {
        final packages = await endpoints.package.getAllPackages(
          sessionBuilder,
        );

        expect(packages, isA<List>());
      });

      test('getPackageById should return null for non-existent id', () async {
        final package = await endpoints.package.getPackageById(
          sessionBuilder,
          99999,
        );

        expect(package, isNull);
      });
    });

    group('sale endpoint', () {
      test('getSalesWithItems should return null for non-existent id',
          () async {
        final sales = await endpoints.sale.getSalesWithItems(
          sessionBuilder,
          99999,
        );

        expect(sales, isNull);
      });
    });
  });
}
