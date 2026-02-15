import 'package:firebase_messaging/firebase_messaging.dart';

/// Callback ที่ gateway เรียกเมื่อได้ message แล้วเช็ค type แล้ว
/// [openedFromNotification] เป็น true เมื่อ user เปิดแอปจาก notification (onMessageOpenedApp / getInitialMessage)
typedef NotificationMessageCallback = Future<void> Function(
  RemoteMessage message, {
  bool openedFromNotification,
});
