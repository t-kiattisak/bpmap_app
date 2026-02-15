import 'dart:developer';

import 'package:alarm/alarm.dart';

class AlarmService {
  void triggerAlarmInForeground({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) {
    final settings = _buildAlarmSettings(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
    Alarm.set(alarmSettings: settings).catchError((e, _) {
      log('Alarm.set failed: $e');
      return false;
    });
  }

  Future<void> triggerAlarmInBackground({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    await Alarm.init();
    final settings = _buildAlarmSettings(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
    await Alarm.set(alarmSettings: settings);
  }

  AlarmSettings _buildAlarmSettings({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) {
    return AlarmSettings(
      id: id,
      dateTime: DateTime.now().add(const Duration(seconds: 1)),
      assetAudioPath: 'assets/audio/footdino_on_scratch-alarm.mp3',
      loopAudio: true,
      vibrate: true,
      androidFullScreenIntent: true,
      volumeSettings: VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: const Duration(seconds: 3),
        volumeEnforced: false,
      ),
      notificationSettings: NotificationSettings(
        title: title,
        body: body,
        stopButton: 'ปิดเสียง',
      ),
      payload: payload,
    );
  }
}
