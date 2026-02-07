import 'package:flutter/material.dart';
import 'package:wm_flutter/app.dart';
import 'package:wm_flutter/env/development_config.dart';
import 'package:wm_flutter/env/env_config.dart';

/// Entry point for the Development flavor.
///
/// This flavor connects to a local Serverpod server for development.
/// Run with: flutter run --flavor development -t lib/main_development.dart
void main() {
  const EnvConfig config = DevelopmentConfig();
  runApp(AppInitializer(config: config));
}
