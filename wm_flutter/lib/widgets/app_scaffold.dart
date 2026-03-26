import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:wm_flutter/bloc/auth/auth_bloc.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/views/cart_view.dart';
import 'package:wm_flutter/views/login_view.dart';
import 'package:wm_flutter/views/profile_view.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final int selectedIndex;
  final Orientation orientation;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.selectedIndex,
    required this.orientation,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final bool isSignedIn = SpcCore.isSignedIn;

        return AdaptiveScaffold(
          appBar: AdaptiveAppBar(
            title: title,
            actions: [
              AdaptiveAppBarAction(
                onPressed: () {
                  // showSnackbar(context, "No new notifications");
                },
                iosSymbol: 'gear',
              ),
            ],
          ),
          bottomNavigationBar: AdaptiveBottomNavigationBar(
            items: [
              AdaptiveNavigationDestination(icon: 'house.fill', label: 'Home'),
              AdaptiveNavigationDestination(icon: Icons.mail, label: 'Messages'),
              AdaptiveNavigationDestination(icon: Icons.qr_code, label: 'E-Points'),
              AdaptiveNavigationDestination(icon: Icons.shopping_cart, label: 'Cart'),
              AdaptiveNavigationDestination(icon: Icons.person, label: isSignedIn ? 'Profile' : 'Login'),
            ],
            selectedIndex: selectedIndex,
            onTap: (index) {
              log('Selected index: $index');
              switch (index) {
                case 0:
                  // Already on Home
                  break;
                case 1:
                  // Messages - not implemented yet
                  break;
                case 2:
                  // E-Points - not implemented yet
                  break;
                case 3:
                  // Cart
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CartView()));
                  break;
                case 4:
                  // Profile or Login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => isSignedIn ? const ProfileView() : LoginView()),
                  );
                  break;
                default:
                  break;
              }
            },
          ),
          body: body,
        );
      },
    );
  }
}
