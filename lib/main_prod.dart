import 'package:bpmap_app/shared/domain/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'shared/domain/models/app_config.dart';
import 'main.dart';
import 'shared/constants/app_constants.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env.prod");

  var configuredApp = AppConfig(
    environment: Environment.prod,
    appName: dotenv.env[AppConstants.appNameKey] ?? "BP Map",
    apiBaseUrl: dotenv.env[AppConstants.baseUrlKey] ?? "https://api.bpmap.com",
  );

  runApp(
    ProviderScope(
      overrides: [appConfigProvider.overrideWithValue(configuredApp)],
      child: const MyApp(),
    ),
  );
}
