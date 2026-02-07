import 'package:flutter/material.dart';
import 'package:wm_flutter/app.dart';
import 'package:wm_flutter/env/env_config.dart';
import 'package:wm_flutter/env/staging_config.dart';

/// Entry point for the Staging flavor.
///
/// This flavor connects to the staging Serverpod server for testing
/// outside the local network.
/// Run with: flutter run --flavor staging -t lib/main_staging.dart
void main() {
  const EnvConfig config = StagingConfig();
  runApp(AppInitializer(config: config));
}
