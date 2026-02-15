import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:bpmap_app/shared/services/local_notification_service.dart';

class HandleDefaultNotificationUseCase {
  HandleDefaultNotificationUseCase(this._localNotificationService);

  final LocalNotificationService _localNotificationService;

  Future<void> execute(RemoteMessage message, {bool openedFromNotification = false}) async {
    if (openedFromNotification) return;
    final notification = message.notification;
    if (notification == null) return;

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final payload = message.data.isEmpty ? null : message.data.toString();
    await _localNotificationService.showNotification(
      id: id,
      title: notification.title ?? '',
      body: notification.body ?? '',
      payload: payload,
    );
  }
}
