import 'package:bpmap_app/app_with_bloc.dart';
import 'package:bpmap_app/shared/di/injection_container.dart';
import 'package:bpmap_app/shared/constants/app_constants.dart';
import 'package:bpmap_app/shared/services/notification_service.dart';
import 'package:bpmap_app/shared/domain/models/app_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> mainCommon(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final envFile = _getEnvFile(env);
  await dotenv.load(fileName: envFile);

  final appConfig = AppConfig(
    environment: env,
    googleServerClientId: dotenv.env[AppConstants.googleServerClientIdKey]!,
    lineChannelId: dotenv.env[AppConstants.lineChannelIdKey]!,
    appName: dotenv.env[AppConstants.appNameKey]!,
    apiBaseUrl: dotenv.env[AppConstants.baseUrlKey]!,
  );

  await initDependencies(appConfig);

  try {
    await getIt<NotificationService>().initialize();
    debugPrint('Notification service initialized');
  } catch (e) {
    debugPrint('Failed to initialize notification service: $e');
  }

  runApp(const AppWithBloc());
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
