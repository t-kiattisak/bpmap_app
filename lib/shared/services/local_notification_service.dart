import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const String _alarmChannelId = 'com.bpmap.disaster.ALARM';
  static const String _alarmChannelName = 'Alarm';

  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

    await _notificationsPlugin.initialize(initializationSettings);
    await _createAlarmChannel();
  }

  Future<void> _createAlarmChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _alarmChannelId,
      _alarmChannelName,
      description: 'Critical disaster alarm notifications.',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      showBadge: true,
    );
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          groupKey: 'com.bpmap.disaster.ALERTS',
          channelDescription:
              'This channel is used for important notifications.',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await _notificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  /// แสดงการแจ้งเตือนแบบ alarm (ใช้ channel ความสำคัญสูง)
  Future<void> showAlarmNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      _alarmChannelId,
      _alarmChannelName,
      channelDescription: 'Critical disaster alarm notifications.',
      importance: Importance.max,
      priority: Priority.max,
      groupKey: 'com.bpmap.disaster.ALERTS',
      ticker: 'alarm',
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.show(
      id,
      title,
      body,
      details,
      payload: payload,
    );
  }
}
