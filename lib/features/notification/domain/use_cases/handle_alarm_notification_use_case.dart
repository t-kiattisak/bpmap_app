import 'dart:convert';
import 'dart:developer';
import 'package:bpmap_app/presentation/router/app_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:bpmap_app/features/notification/data/models/alarm_notification_data.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:bpmap_app/shared/services/alarm_service.dart';
import 'package:bpmap_app/shared/services/background_location_service.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

class HandleAlarmNotificationUseCase {
  HandleAlarmNotificationUseCase(
    this._alarmService,
    this._backgroundLocationService,
  );

  final AlarmService _alarmService;
  final BackgroundLocationService _backgroundLocationService;

  Future<void> execute(
    RemoteMessage message, {
    bool openedFromNotification = false,
  }) async {
    final data = message.data;
    if (data.isEmpty) return;

    final alarm = AlarmNotificationData.fromMessageData(data);

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final payload = jsonEncode(data);
    final title = message.notification?.title ?? alarm.content ?? 'Alarm';
    final body =
        message.notification?.body ?? alarm.signal ?? alarm.content ?? '';

    log('[HandleAlarm] xc =>> $alarm');

    if (openedFromNotification) {
      final alarmId = alarm.alarmId ?? 'unknown';
      final context = rootNavigatorKey.currentContext;
      if (context != null) {
        IncidentGuidelineRoute(id: alarmId).push(context);
      }
      return;
    }

    final shouldTrigger = await _shouldTriggerAlarm(alarm);
    if (!shouldTrigger) return;

    _alarmService.triggerAlarmInForeground(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
  }

  Future<void> executeInBackground(RemoteMessage message) async {
    final data = message.data;
    if (data.isEmpty) return;

    final alarm = AlarmNotificationData.fromMessageData(data);
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final payload = jsonEncode(data);
    final title = message.notification?.title ?? alarm.content ?? 'Alarm';
    final body =
        message.notification?.body ?? alarm.signal ?? alarm.content ?? '';
    log('[HandleAlarm] executeInBackground =>> $alarm');
    final shouldTrigger = await _shouldTriggerAlarm(alarm);
    if (!shouldTrigger) return;

    await _alarmService.triggerAlarmInBackground(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
  }

  Future<bool> _shouldTriggerAlarm(AlarmNotificationData alarm) async {
    if (alarm.center != null &&
        alarm.center!.lat != null &&
        alarm.center!.lng != null &&
        alarm.center!.radius != null) {
      final lastLocation = await _backgroundLocationService.getLastLocation();
      log('[HandleAlarm] lastLocation =>> $lastLocation');

      if (lastLocation != null) {
        final distance = const Distance().as(
          LengthUnit.Meter,
          LatLng(lastLocation.latitude, lastLocation.longitude),
          LatLng(alarm.center!.lat!, alarm.center!.lng!),
        );

        debugPrint(
          '[HandleAlarm] Geofencing Check: Distance = $distance m, Radius = ${alarm.center!.radius} m',
        );

        if (distance > alarm.center!.radius!) {
          debugPrint(
            '[HandleAlarm] User is outside of alarm radius. Alarm ignored.',
          );
          return false;
        }
      } else {
        debugPrint(
          '[HandleAlarm] No user location found. Proceeding with alarm.',
        );
        return false;
      }
    }
    return true;
  }
}
