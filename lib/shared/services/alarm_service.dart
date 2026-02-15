import 'package:bpmap_app/shared/services/local_notification_service.dart';

class AlarmService {
  AlarmService(this._localNotificationService);

  final LocalNotificationService _localNotificationService;

  void triggerAlarmInForeground({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) {
    _localNotificationService.showAlarmNotification(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
  }

  Future<void> triggerAlarmInBackground({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    await _localNotificationService.showAlarmNotification(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
  }
}
