import 'package:bpmap_app/main.dart';
import 'package:bpmap_app/shared/constants/app_constants.dart';
import 'package:bpmap_app/shared/domain/models/app_config.dart';
import 'package:bpmap_app/shared/domain/providers/app_config_provider.dart';
import 'package:bpmap_app/shared/utility/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> mainCommon(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();

  final envFile = _getEnvFile(env);
  await dotenv.load(fileName: envFile);

  var configuredApp = AppConfig(
    environment: env,
    appName: dotenv.env[AppConstants.appNameKey]!,
    apiBaseUrl: dotenv.env[AppConstants.baseUrlKey]!,
  );

  runApp(
    ProviderScope(
      overrides: [appConfigProvider.overrideWith((ref) => configuredApp)],
      observers: [Logger()],
      child: const MyApp(),
    ),
  );
}

String _getEnvFile(Environment env) {
  switch (env) {
    case Environment.dev:
      return ".env.dev";
    case Environment.stg:
      return ".env.stg";
    case Environment.prod:
      return ".env.prod";
  }
}
