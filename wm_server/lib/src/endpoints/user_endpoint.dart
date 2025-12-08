import 'package:serverpod/serverpod.dart';
import 'package:wm_server/src/generated/protocol.dart';

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

  /// Update user profile (name fields only)
  Future<User?> updateProfile(
    Session session, {
    required int userId,
    required String firstName,
    required String middleName,
    required String lastName,
  }) async {
    final user = await User.db.findById(session, userId);
    if (user == null) return null;

    user.firstName = firstName;
    user.middleName = middleName;
    user.lastName = lastName;

    return await User.db.updateRow(session, user);
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
}
