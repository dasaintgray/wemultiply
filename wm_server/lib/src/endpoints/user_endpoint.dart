import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

class UserEndpoint extends Endpoint {
  /// Get user profile by user ID
  Future<User?> getUserById(Session session, int userId) async {
    return await User.db.findById(session, userId);
  }

  /// Get user profile by auth user info ID
  Future<User?> getUserByAuthId(Session session, int userInfoId) async {
    return await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
    );
  }

  /// Get or create user profile - creates a new user if one doesn't exist for the given auth ID
  Future<User?> getOrCreateUser(Session session, int userInfoId) async {
    session.log('getOrCreateUser: Looking for userInfoId=$userInfoId');

    // First check if user exists
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
    );

    if (user != null) {
      session.log('getOrCreateUser: Found existing user ${user.id}');
      return user;
    }

    // User doesn't exist, get the auth user info to create a new user
    session.log('getOrCreateUser: User not found, creating new user');

    final authUser = await auth.UserInfo.db.findById(session, userInfoId);
    if (authUser == null) {
      session.log('getOrCreateUser: Auth user not found for userInfoId=$userInfoId');
      return null;
    }

    // Parse the username to extract first/last name
    final nameParts = (authUser.userName ?? 'User').split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts.first : 'User';
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    // Create new user
    final newUser = User(
      firstName: firstName,
      middleName: '',
      lastName: lastName,
      email: authUser.email ?? '',
      passwordHash: '', // Auth is handled by Serverpod auth module
      role: 'member',
      level: 0,
      joinDate: DateTime.now(),
      isActive: true,
      isPioneer: false,
      isUpgraded: false,
      userInfoId: userInfoId,
    );

    final createdUser = await User.db.insertRow(session, newUser);
    session.log('getOrCreateUser: Created new user ${createdUser.id}');

    return createdUser;
  }

  /// Update user profile (name fields only)
  Future<User?> updateProfile(
    Session session, {
    required int userId,
    required String firstName,
    required String middleName,
    required String lastName,
  }) async {
    session.log('updateProfile called: userId=$userId, firstName=$firstName, middleName=$middleName, lastName=$lastName');

    final user = await User.db.findById(session, userId);
    if (user == null) {
      session.log('updateProfile: User not found for userId=$userId');
      return null;
    }

    session.log('updateProfile: Found user ${user.id}, current firstName=${user.firstName}');

    user.firstName = firstName;
    user.middleName = middleName;
    user.lastName = lastName;

    final updatedUser = await User.db.updateRow(session, user);
    session.log('updateProfile: Updated user ${updatedUser.id}, new firstName=${updatedUser.firstName}');

    return updatedUser;
  }

  /// Update user phone number
  Future<User?> updatePhone(
    Session session, {
    required int userId,
    required String phone,
  }) async {
    final user = await User.db.findById(session, userId);
    if (user == null) return null;

    user.phone = phone;

    return await User.db.updateRow(session, user);
  }

  /// Get full name of user
  Future<String?> getFullName(Session session, int userId) async {
    final user = await User.db.findById(session, userId);
    if (user == null) return null;

    final parts = [user.firstName];
    if (user.middleName.isNotEmpty) parts.add(user.middleName);
    parts.add(user.lastName);

    return parts.join(' ');
  }

  /// Update user location (latitude and longitude)
  Future<User?> updateLocation(
    Session session, {
    required int userId,
    required double latitude,
    required double longitude,
  }) async {
    final user = await User.db.findById(session, userId);
    if (user == null) return null;

    user.latitude = latitude;
    user.longtitude = longitude;

    return await User.db.updateRow(session, user);
  }

  /// Get user stats (referrals count, total earnings, orders count)
  Future<Map<String, dynamic>> getUserStats(Session session, int userId) async {
    // Count referrals (users who have this user as their referrer)
    final referralsCount = await User.db.count(
      session,
      where: (t) => t.referrerId.equals(userId),
    );

    // Calculate total earnings from commissions
    double totalEarnings = 0.0;
    try {
      final commissions = await Commissions.db.find(
        session,
        where: (t) => t.recipientId.equals(userId),
      );
      for (final commission in commissions) {
        totalEarnings += commission.commissionAmount;
      }
    } catch (e) {
      session.log('Error fetching commissions: $e');
    }

    // Count orders (sales made by this user)
    int ordersCount = 0;
    try {
      ordersCount = await Sale.db.count(
        session,
        where: (t) => t.buyerId.equals(userId),
      );
    } catch (e) {
      session.log('Error fetching orders count: $e');
    }

    return {
      'referrals': referralsCount,
      'earnings': totalEarnings,
      'orders': ordersCount,
    };
  }

  /// Get referrals count for a user
  Future<int> getReferralsCount(Session session, int userId) async {
    return await User.db.count(
      session,
      where: (t) => t.referrerId.equals(userId),
    );
  }

  /// Get total earnings for a user
  Future<double> getTotalEarnings(Session session, int userId) async {
    double total = 0.0;
    try {
      final commissions = await Commissions.db.find(
        session,
        where: (t) => t.recipientId.equals(userId),
      );
      for (final commission in commissions) {
        total += commission.commissionAmount;
      }
    } catch (e) {
      session.log('Error fetching commissions: $e');
    }
    return total;
  }

  /// Get orders count for a user
  Future<int> getOrdersCount(Session session, int userId) async {
    try {
      return await Sale.db.count(
        session,
        where: (t) => t.buyerId.equals(userId),
      );
    } catch (e) {
      session.log('Error fetching orders count: $e');
      return 0;
    }
  }
}
