import 'env_config.dart';

/// Staging environment configuration.
///
/// Connects to staging Serverpod server for testing outside the local network.
/// Use this for testing with production-like infrastructure before deploying to production.
class StagingConfig implements EnvConfig {
  const StagingConfig();

  @override
  String get serverUrl => 'https://api.wemultiply.store/';

  @override
  String get serverCDN => 'https://cdn.wemultiply.store/';

  @override
  String get environment => 'Staging';

  @override
  bool get isProduction => false;
}
