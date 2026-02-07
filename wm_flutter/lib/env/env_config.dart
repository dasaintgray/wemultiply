/// Abstract base class for environment-specific configuration.
///
/// Each environment (development, staging, production) implements this
/// interface to provide environment-specific values.
abstract class EnvConfig {
  /// The base URL for the Serverpod API server.
  String get serverUrl;

  /// The base URL for the CDN server (for images and static assets).
  String get serverCDN;

  /// The name of the current environment (e.g., "Development", "Staging", "Production").
  String get environment;

  /// Whether this is a production environment.
  bool get isProduction;
}
