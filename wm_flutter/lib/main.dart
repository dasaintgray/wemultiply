import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_flutter/core/themes/app_theme.dart';
import 'package:wm_flutter/views/menu_view.dart';

// late final Client client;
// late final SessionManager sessionManager;

late String serverUrl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SplashMaster.initialize();

  // const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  // final serverUrl = serverUrlFromEnv.isEmpty ? 'http://$localhost:8080/' : "$serverUrlFromEnv:8080/";
  // SpcCore.init(serverUrl);
  // final client = await SpcCore.init(CoreConstant.serverUrl);
  await SpcCore.init(CoreConstant.serverUrl);

  // sessionManager = SessionManager(
  //   caller: client.modules.auth,
  // );
  // await sessionManager.initialize();

  // client = Client(serverUrl)
  //   ..connectivityMonitor = FlutterConnectivityMonitor();
  SplashMaster.resume();
  runApp(
    MultiRepositoryProvider(
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
              final cartBloc = CartBloc(cartRepository: context.read<CartRepository>());
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
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weMultiply App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => const MenuView()},
      // home: const HomeView(),
      // onGenerateRoute:
    );
  }
}
