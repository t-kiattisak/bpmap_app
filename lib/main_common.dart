import 'package:bpmap_app/main.dart';
import 'package:bpmap_app/presentation/providers/notification_provider.dart';
import 'package:bpmap_app/shared/constants/app_constants.dart';
import 'package:bpmap_app/shared/domain/models/app_config.dart';
import 'package:bpmap_app/shared/domain/providers/app_config_provider.dart';
import 'package:bpmap_app/shared/utility/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> mainCommon(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final envFile = _getEnvFile(env);
  await dotenv.load(fileName: envFile);

  var configuredApp = AppConfig(
    environment: env,
    googleServerClientId: dotenv.env[AppConstants.googleServerClientIdKey]!,
    appName: dotenv.env[AppConstants.appNameKey]!,
    apiBaseUrl: dotenv.env[AppConstants.baseUrlKey]!,
  );

  final container = ProviderContainer(
    overrides: [appConfigProvider.overrideWith((ref) => configuredApp)],
    observers: [Logger()],
  );
  await _initializeServices(container);

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

Future<void> _initializeServices(ProviderContainer container) async {
  try {
    final notificationService = container.read(notificationServiceProvider);
    await notificationService.initialize();
    debugPrint('Notification service initialized');
  } catch (e) {
    debugPrint('Failed to initialize notification service: $e');
  }
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
