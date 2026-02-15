import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:bpmap_app/features/notification/domain/use_cases/handle_alarm_notification_use_case.dart';
import 'package:bpmap_app/shared/services/alarm_service.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  log('FCM background: ${message.messageId}');
  final type = message.data['type']?.toString();

  if (type == 'alarm') {
    final useCase = HandleAlarmNotificationUseCase(AlarmService());
    await useCase.executeInBackground(message);
  }
}
