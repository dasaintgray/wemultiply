import 'env_config.dart';

/// Development environment configuration.
///
/// Connects to local Serverpod server running on localhost.
/// Use this for local development and testing.
class DevelopmentConfig implements EnvConfig {
  const DevelopmentConfig();

  @override
  String get serverUrl => 'http://192.168.1.17:8080/';

  @override
  String get serverCDN => 'http://cdn.wemultiply.store:8888/';

  @override
  String get environment => 'Development';

  @override
  bool get isProduction => false;
}
