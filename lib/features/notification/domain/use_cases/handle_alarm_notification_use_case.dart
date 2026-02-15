import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:bpmap_app/features/notification/data/models/alarm_notification_data.dart';
import 'package:bpmap_app/presentation/router/app_router.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:bpmap_app/shared/services/alarm_service.dart';

class HandleAlarmNotificationUseCase {
  HandleAlarmNotificationUseCase(this._alarmService);

  final AlarmService _alarmService;

  Future<void> execute(RemoteMessage message, {bool openedFromNotification = false}) async {
    final data = message.data;
    if (data.isEmpty) return;

    final alarm = AlarmNotificationData.fromMessageData(data);
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final payload = jsonEncode(data);
    final title = message.notification?.title ?? alarm.content ?? 'Alarm';
    final body = message.notification?.body ?? alarm.signal ?? alarm.content ?? '';

    if (openedFromNotification) {
      final alarmId = alarm.alarmId ?? 'unknown';
      final context = rootNavigatorKey.currentContext;
      if (context != null) {
        IncidentGuidelineRoute(id: alarmId).push(context);
      }
      return;
    }

    _alarmService.triggerAlarmInForeground(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
  }

  /// สำหรับ background isolate (ไม่มี Riverpod) — สร้าง use case กับ AlarmService() แล้วเรียก method นี้
  Future<void> executeInBackground(RemoteMessage message) async {
    final data = message.data;
    if (data.isEmpty) return;

    final alarm = AlarmNotificationData.fromMessageData(data);
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final payload = jsonEncode(data);
    final title = message.notification?.title ?? alarm.content ?? 'Alarm';
    final body = message.notification?.body ?? alarm.signal ?? alarm.content ?? '';

    await _alarmService.triggerAlarmInBackground(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
  }
}
