import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:wm_flutter/core/spc_core.dart';

class AuthRepository {
  final authController = EmailAuthController(SpcCore.client.modules.auth);

  Future<bool> login(String email, String password) async {
    final success = await authController.signIn(email, password);
    if (success != null) {
      SpcCore.sessionManager.refreshSession();
    }

    return SpcCore.sessionManager.isSignedIn;
  }

  Future<bool> registerUser(
    String email,
    String password,
    String userName,
  ) async {
    final result = await authController.createAccountRequest(
      userName,
      email,
      password,
    );

    return result;
  }

  Future<void> signOut() async {
    await SpcCore.sessionManager.signOutDevice();
  }

  Future<bool> resetPassword(String email) async {
    return await authController.initiatePasswordReset(email);
  }

  bool get isSignedIn => SpcCore.sessionManager.isSignedIn;
}
