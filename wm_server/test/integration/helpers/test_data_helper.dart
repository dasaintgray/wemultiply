import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

/// Helper class for creating test data in integration tests
class TestDataHelper {
  /// Creates a test user with optional referrer
  static Future<User> createTestUser(
    Session session, {
    required String email,
    String firstName = 'Test',
    String lastName = 'User',
    int? referrerId,
    int level = 0,
    String role = 'member',
    required int userInfoId,
  }) async {
    final user = User(
      firstName: firstName,
      middleName: '',
      lastName: lastName,
      email: email,
      phone: null,
      passwordHash: 'hashed_password',
      role: role,
      referrerId: referrerId,
      level: level,
      addressId: null,
      joinDate: DateTime.now(),
      isActive: true,
      isPioneer: false,
      membershipPackageId: null,
      longtitude: null,
      latitude: null,
      isUpgraded: false,
      upgradedAt: null,
      lastLoginAt: null,
      userInfoId: userInfoId,
    );
    return await User.db.insertRow(session, user);
  }

  /// Creates a referral chain of users (buyer -> level1 -> level2 -> ... -> level7)
  static Future<List<User>> createReferralChain(
    Session session, {
    int levels = 7,
    String emailPrefix = 'user',
    required int startingUserInfoId,
  }) async {
    final users = <User>[];

    // Create the top-level user first (no referrer)
    final topUser = await createTestUser(
      session,
      email: '${emailPrefix}_level$levels@test.com',
      firstName: 'Level$levels',
      level: levels,
      userInfoId: startingUserInfoId,
    );
    users.add(topUser);

    // Create chain from top to bottom
    for (int i = levels - 1; i >= 0; i--) {
      final user = await createTestUser(
        session,
        email: '${emailPrefix}_level$i@test.com',
        firstName: 'Level$i',
        level: i,
        referrerId: users.last.id,
        userInfoId: startingUserInfoId + (levels - i),
      );
      users.add(user);
    }

    return users.reversed.toList(); // Return buyer first, then upline
  }

  /// Creates a membership package
  static Future<MembershipPackage> createMembershipPackage(
    Session session, {
    required String name,
    double price = 1000.0,
    int bottlesIncluded = 1,
    double cashback = 0.0,
  }) async {
    final package = MembershipPackage(
      name: name,
      price: price,
      bottlesIncluded: bottlesIncluded,
      cashback: cashback,
      description: 'Test package',
    );
    return await MembershipPackage.db.insertRow(session, package);
  }

  /// Creates a package (for reaper commissions)
  static Future<Package> createPackage(
    Session session, {
    required String name,
    required int productId,
    double membershipFee = 1000.0,
  }) async {
    final package = Package(
      packageName: name,
      packageDescription: 'Test package',
      membershipFee: membershipFee,
      productId: productId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isActive: true,
    );
    return await Package.db.insertRow(session, package);
  }

  /// Creates a product
  static Future<Product> createProduct(
    Session session, {
    required String name,
    double price = 500.0,
    int stock = 100,
  }) async {
    final product = Product(
      productName: name,
      description: 'Test product',
      price: price,
      stock: stock,
      imageName: 'test.png',
      imageURL: 'http://example.com/test.png',
      isActive: true,
      createdAt: DateTime.now(),
      updatedat: DateTime.now(), // Note: field name has typo in schema
      createdBy: 'test',
      updatedBy: 'test',
    );
    return await Product.db.insertRow(session, product);
  }

  /// Creates reaper commission rates for a package
  static Future<List<ReaperCommission>> createReaperCommissionRates(
    Session session, {
    required int packageId,
    required int productId,
    List<double> ratesPerLevel = const [100, 50, 25, 12.5, 6.25, 3.125, 1.5625],
  }) async {
    final commissions = <ReaperCommission>[];

    for (int i = 0; i < ratesPerLevel.length; i++) {
      final commission = ReaperCommission(
        packageId: packageId,
        level: i + 1, // Level 1-7
        productId: productId,
        netPerMember: ratesPerLevel[i],
        repeatOrderNet: ratesPerLevel[i] * 0.5,
        ronDescription: 'Level ${i + 1} commission',
        isActive: true,
        createdBy: 'test',
        createdAt: DateTime.now(),
        updatedBy: null,
        updatedAt: null,
      );
      final inserted = await ReaperCommission.db.insertRow(session, commission);
      commissions.add(inserted);
    }

    return commissions;
  }

  /// Creates a sale record
  static Future<Sale> createSale(
    Session session, {
    required int buyerId,
    required int packageId,
    double amount = 1000.0,
    String status = 'pending',
    String saleType = 'membership',
  }) async {
    final sale = Sale(
      saleNumber: 'SALE-${DateTime.now().millisecondsSinceEpoch}',
      saleDate: DateTime.now(),
      buyerId: buyerId,
      packageId: packageId,
      saleType: saleType,
      amount: amount,
      status: status,
    );
    return await Sale.db.insertRow(session, sale);
  }

  /// Creates a payment record
  static Future<Payment> createPayment(
    Session session, {
    required String orderId,
    required String externalId,
    String channel = 'INVOICE',
    double amount = 1000.0,
    String status = 'PENDING',
  }) async {
    final payment = Payment(
      orderId: orderId,
      externalId: externalId,
      channel: channel,
      amount: amount,
      currency: 'PHP',
      status: status,
      metadata: '{}',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    return await Payment.db.insertRow(session, payment);
  }

  /// Creates a golden seat
  static Future<GoldenSeats> createGoldenSeat(
    Session session, {
    required String seatType,
    required String territory,
    required int ownerId,
    double price = 50000.0,
    bool isActive = true,
  }) async {
    final seat = GoldenSeats(
      seatType: seatType,
      territory: territory,
      ownerId: ownerId,
      price: price,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 365)),
      isActive: isActive,
    );
    return await GoldenSeats.db.insertRow(session, seat);
  }

  /// Creates a golden seat commission rate
  static Future<GoldenSeatCommission> createGoldenSeatCommissionRate(
    Session session, {
    required String seatType,
    required int packageId,
    required int productId,
    double netPerMember = 50.0,
    double netPerBottle = 10.0,
    double commissionAmount = 100.0,
  }) async {
    final rate = GoldenSeatCommission(
      seatType: seatType,
      packageId: packageId,
      productId: productId,
      netPerMember: netPerMember,
      netPerBottle: netPerBottle,
      commissionAmount: commissionAmount,
      createdAt: DateTime.now(),
    );
    return await GoldenSeatCommission.db.insertRow(session, rate);
  }
}
