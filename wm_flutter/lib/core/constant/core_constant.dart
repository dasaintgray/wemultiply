class CoreConstant {
  /// Application Config
  static const String serverUrl = String.fromEnvironment(
    'SERVER_URL',
    defaultValue: 'https://wmapi.mooo.com/',
  );
  // static const String serverCDN = String.fromEnvironment('SERVER_CDN', defaultValue: 'https://wemultiplycdn.mooo.com/');
  static const String serverCDN = String.fromEnvironment(
    'SERVER_CDN',
    defaultValue: 'http://122.53.52.217:8888/',
  );
  static const String appName = 'WeMultiply';
  static const String packageName = 'wm_flutter';
  static const String version = '1.0.0';
  static const String buildNumber = '1';
  static const String defaultLogo = 'logo2.png';
  static const String defaultAvatar = 'avatar.png';
  static const String logoWithText = 'wemultiply2.png';
  static const String cdnFullPath = '${serverCDN}api/cdn/download/images/';
}
