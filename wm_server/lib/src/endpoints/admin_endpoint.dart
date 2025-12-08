import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class AdminEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {Scope.admin, Scope('APIUser')};

  Future<List<UserInfo>> getAllUsers(Session session) async {
    final users = await UserInfo.db.find(session);

    return users;
  }

  Future<void> blockUser(Session session, int userID) async {
    await Users.blockUser(session, userID);
  }

  Future<void> unblockUser(Session session, int userID) async {
    await Users.unblockUser(session, userID);
  }
}
