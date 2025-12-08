import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:wm_client/wm_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class SpcCore {
  static late final Client client;
  static late final SessionManager sessionManager;

  static Future<({Client client, SessionManager sessionManager})> init(
    String host,
  ) async {
    client = Client(
      host,
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();

    sessionManager = SessionManager(caller: client.modules.auth);
    await sessionManager.initialize();
    return (client: client, sessionManager: sessionManager);
  }

  static bool get isSignedIn => sessionManager.isSignedIn;
  static int? get userId => sessionManager.signedInUser?.id;
  static String? get userName => sessionManager.signedInUser?.userName;
  static String? get email => sessionManager.signedInUser?.email;
}
