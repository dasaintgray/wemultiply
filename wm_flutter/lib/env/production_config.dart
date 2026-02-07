import 'env_config.dart';

/// Production environment configuration.
///
/// Connects to production Serverpod server serving real users.
/// Use this for production releases only.
class ProductionConfig implements EnvConfig {
  const ProductionConfig();

  @override
  String get serverUrl => 'https://wmapi.mooo.com/';

  @override
  String get serverCDN => 'http://122.53.52.217:8888/';

  @override
  String get environment => 'Production';

  @override
  bool get isProduction => true;
}
