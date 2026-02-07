import 'package:flutter/material.dart';
import 'package:wm_flutter/app.dart';
import 'package:wm_flutter/env/env_config.dart';
import 'package:wm_flutter/env/production_config.dart';

/// Entry point for the Production flavor.
///
/// This flavor connects to the production Serverpod server.
/// Run with: flutter run --flavor production -t lib/main_production.dart
void main() {
  const EnvConfig config = ProductionConfig();
  runApp(AppInitializer(config: config));
}
