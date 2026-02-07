import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_master/splash_master.dart';
import 'package:wm_flutter/bloc/auth/auth_bloc.dart';
import 'package:wm_flutter/bloc/cart/cart_bloc.dart';
import 'package:wm_flutter/bloc/menu/menu_bloc.dart';
import 'package:wm_flutter/bloc/product/product_bloc.dart';
import 'package:wm_flutter/core/constant/core_constant.dart';
import 'package:wm_flutter/core/repositories/auth_repository.dart';
import 'package:wm_flutter/core/repositories/cart_repository.dart';
import 'package:wm_flutter/core/repositories/menu_repository.dart';
import 'package:wm_flutter/core/repositories/product_repository.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/themes/app_theme.dart';
import 'package:wm_flutter/env/env_config.dart';
import 'package:wm_flutter/views/menu_view.dart';

/// Main application widget that initializes and runs the app.
///
/// Accepts an [EnvConfig] to configure the app for different environments
/// (development, staging, production).
class AppInitializer extends StatelessWidget {
  final EnvConfig config;

  const AppInitializer({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider(create: (context) => ProductRepository()),
              RepositoryProvider(create: (context) => CartRepository()),
              RepositoryProvider(create: (context) => MenuRepository()),
              RepositoryProvider(create: (context) => AuthRepository()),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ProductBloc(
                    productRepository: context.read<ProductRepository>(),
                  )..add(LoadProduct()),
                ),
                BlocProvider(
                  create: (context) {
                    final cartBloc =
                        CartBloc(cartRepository: context.read<CartRepository>());
                    // Load cart if user is signed in
                    if (SpcCore.isSignedIn && SpcCore.userId != null) {
                      cartBloc.add(LoadCart(SpcCore.userId!));
                    }
                    return cartBloc;
                  },
                ),
                BlocProvider(
                  create: (context) =>
                      MenuBloc(menuRepository: context.read<MenuRepository>())
                        ..add(LoadMenus()),
                ),
                BlocProvider(
                  create: (context) =>
                      AuthBloc(authRepository: context.read<AuthRepository>()),
                ),
              ],
              child: MyApp(config: config),
            ),
          );
        }
        // Show splash screen while initializing
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  Future<void> _initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SplashMaster.initialize();

    // Set the current environment configuration
    CoreConstant.setConfig(config);

    // Initialize Serverpod client with environment-specific URL
    await SpcCore.init(config.serverUrl);

    SplashMaster.resume();
  }
}

class MyApp extends StatelessWidget {
  final EnvConfig config;

  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weMultiply ${config.environment}',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => const MenuView()},
    );
  }
}
