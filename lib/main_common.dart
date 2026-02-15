import 'package:bpmap_app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bpmap_app/shared/constants/app_constants.dart';
import 'package:bpmap_app/shared/domain/models/app_config.dart';
import 'package:bpmap_app/shared/providers/di_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> mainCommon(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  final envFile = _getEnvFile(env);
  await dotenv.load(fileName: envFile);

  final appConfig = AppConfig(
    environment: env,
    googleServerClientId: dotenv.env[AppConstants.googleServerClientIdKey]!,
    lineChannelId: dotenv.env[AppConstants.lineChannelIdKey]!,
    appName: dotenv.env[AppConstants.appNameKey]!,
    apiBaseUrl: dotenv.env[AppConstants.baseUrlKey]!,
  );

  runApp(
    ProviderScope(
      overrides: [appConfigProvider.overrideWithValue(appConfig)],
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
