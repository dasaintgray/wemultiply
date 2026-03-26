import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:wm_client/wm_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:wm_flutter/core/spc_core.dart';

class AccountView extends StatelessWidget {
  final Client clientCaller = SpcCore.client;
  final SessionManager sessionManager = SpcCore.sessionManager;
  AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AdaptiveAppBar(
        title: SpcCore.isSignedIn ? 'Profile' : 'Login',
        actions: [
          AdaptiveAppBarAction(
            onPressed: () {
              // Navigate to back
              Navigator.of(context).pop();
            },
            iosSymbol: 'arrow.left',
            // androidIcon: Icons.arrow_back,
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            // leading: CircularUserImage(
            //   userInfo: sessionManager.signedInUser,
            //   size: 42,
            // ),
            title: Text(sessionManager.signedInUser!.userName ?? 'Guest User'),
            subtitle: Text(sessionManager.signedInUser!.email ?? 'No Email'),
            onTap: () {
              // Navigate to profile view
            },
          ),
          SizedBox(
            child: PrettyQrView.data(
              data: sessionManager.signedInUser!.userName ?? 'Guest User',
              decoration: const PrettyQrDecoration(
                image: PrettyQrDecorationImage(image: AssetImage('assets/pngs/logo2.png')),
                // quietZone: PrettyQrQuietZone.standart,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                sessionManager.signOutDevice();
              },
              child: const Text('Sign out'),
            ),
          ),
        ],
      ),
    );
  }
}
