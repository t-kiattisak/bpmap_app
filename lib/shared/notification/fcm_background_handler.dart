import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:bpmap_app/features/notification/domain/use_cases/handle_alarm_notification_use_case.dart';
import 'package:bpmap_app/shared/services/alarm_service.dart';
import 'package:bpmap_app/shared/services/local_notification_service.dart';
import 'package:bpmap_app/shared/services/background_location_service.dart';
import 'package:bpmap_app/shared/data/local/hive_service.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  log('FCM background: ${message.messageId}');
  final type = message.data['type']?.toString();

  if (type == 'alarm') {
    final hiveService = HiveService();
    await hiveService.init();
    final backgroundLocationService = BackgroundLocationService(hiveService);
    final localNotificationService = LocalNotificationService();
    await localNotificationService.initialize();

    final useCase = HandleAlarmNotificationUseCase(
      AlarmService(localNotificationService),
      backgroundLocationService,
    );
    await useCase.executeInBackground(message);
  }
}
