import 'package:wm_flutter/env/env_config.dart';

class CoreConstant {
  /// Current environment configuration
  /// This is set by the app initializer based on the flavor
  static EnvConfig? _currentConfig;

  static void setConfig(EnvConfig config) {
    _currentConfig = config;
  }

  /// Application Config (from environment)
  static String get serverUrl =>
      _currentConfig?.serverUrl ?? const String.fromEnvironment('SERVER_URL', defaultValue: 'https://wmapi.mooo.com/');

  static String get serverCDN =>
      _currentConfig?.serverCDN ??
      const String.fromEnvironment('SERVER_CDN', defaultValue: 'http://122.53.52.217:8888/');

  static String get cdnFullPath => '${serverCDN}api/cdn/download/images/';

  static String get environment => _currentConfig?.environment ?? 'Unknown';
  static bool get isProduction => _currentConfig?.isProduction ?? false;

  /// Application Constants
  static const String appName = 'WeMultiply';
  static const String packageName = 'wm_flutter';
  static const String version = '1.0.0';
  static const String buildNumber = '1';
  static const String defaultLogo = 'logo3.png';
  static const String defaultAvatar = 'avatar.png';
  static const String logoWithText = 'logo3.png';
}
