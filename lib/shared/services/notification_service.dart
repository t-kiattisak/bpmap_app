import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:bpmap_app/features/notification/data/models/alarm_notification_data.dart';
import 'package:bpmap_app/presentation/router/app_router.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:bpmap_app/features/notification/domain/entities/notification_permission_status.dart';
import 'package:bpmap_app/shared/services/alarm_service.dart';
import 'package:bpmap_app/shared/services/local_notification_service.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  log("Handling a background message: ${message.messageId}");
  final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final payload = jsonEncode(message.data);
  final isAlarm = message.data['type']?.toString() == 'alarm';

  if (isAlarm) {
    final alarm = AlarmNotificationData.fromMessageData(message.data);
    final title = message.notification?.title ?? alarm.content ?? 'Alarm';
    final body =
        message.notification?.body ?? alarm.signal ?? alarm.content ?? '';
    final alarmService = AlarmService();
    await alarmService.triggerAlarmInBackground(
      id: id,
      title: title,
      body: body,
      payload: payload,
    );
  }
}

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final LocalNotificationService _localNotificationService;
  final AlarmService _alarmService;

  NotificationService(
    this._localNotificationService,
    this._alarmService,
  );

  String? _currentToken;
  final _tokenController = StreamController<String?>.broadcast();

  final _foregroundMessageController =
      StreamController<RemoteMessage>.broadcast();
  final _backgroundOpenedController =
      StreamController<RemoteMessage>.broadcast();
  final _initialMessageController = StreamController<RemoteMessage>.broadcast();

  Stream<String?> get tokenStream => _tokenController.stream;
  Stream<RemoteMessage> get foregroundMessages =>
      _foregroundMessageController.stream;
  Stream<RemoteMessage> get backgroundOpenedMessages =>
      _backgroundOpenedController.stream;
  Stream<RemoteMessage> get initialMessages => _initialMessageController.stream;

  String? get currentToken => _currentToken;

  StreamSubscription<RemoteMessage>? _backgroundOpenedSub;
  StreamSubscription<RemoteMessage>? _foregroundMessagesSub;
  StreamSubscription<RemoteMessage>? _initialMessagesSub;

  Future<void> initialize() async {
    await _localNotificationService.initialize();
    await _requestPermission();
    await _setupMessageHandlers();
    _subscribeAlarmNavigation();
    await _refreshToken();
    _setupTokenRefreshListener();
  }

  void _subscribeAlarmNavigation() {
    _backgroundOpenedSub = backgroundOpenedMessages.listen(
      _pushIncidentGuidelineIfAlarm,
    );
    _foregroundMessagesSub = foregroundMessages.listen(
      _pushIncidentGuidelineIfAlarm,
    );
    _initialMessagesSub = initialMessages.listen(_pushIncidentGuidelineIfAlarm);
  }

  void _pushIncidentGuidelineIfAlarm(RemoteMessage message) {
    if (message.data['type']?.toString() != 'alarm') return;
    final alarm = AlarmNotificationData.fromMessageData(message.data);
    final id = alarm.alarmId ?? 'unknown';
    final context = rootNavigatorKey.currentContext;
    if (context == null) return;
    IncidentGuidelineRoute(id: id).push(context);
  }

  Future<NotificationPermissionStatus> _requestPermission() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');
    return NotificationPermissionStatus(settings.authorizationStatus);
  }

  Future<NotificationPermissionStatus> getPermissionStatus() async {
    final settings = await _firebaseMessaging.getNotificationSettings();
    return NotificationPermissionStatus(settings.authorizationStatus);
  }

  Future<NotificationPermissionStatus> requestPermission() async {
    return await _requestPermission();
  }

  Future<String?> getToken() async {
    if (_currentToken != null) return _currentToken;
    return await _refreshToken();
  }

  Future<String?> _refreshToken() async {
    try {
      _currentToken = await _firebaseMessaging.getToken();
      _tokenController.add(_currentToken);
      log('FCM Token: $_currentToken');
      return _currentToken;
    } catch (e) {
      log('Error getting FCM token: $e');
      return null;
    }
  }

  void _setupTokenRefreshListener() {
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      _currentToken = newToken;
      _tokenController.add(newToken);
      log('FCM Token refreshed: $newToken');
    });
  }

  Future<void> deleteToken() async {
    await _firebaseMessaging.deleteToken();
    _currentToken = null;
    _tokenController.add(null);
    log('FCM Token deleted');
  }

  Future<void> _setupMessageHandlers() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final isAlarm = message.data['type']?.toString() == 'alarm';
      final payload = isAlarm
          ? jsonEncode(message.data)
          : message.data.toString();

      if (isAlarm) {
        final alarm = AlarmNotificationData.fromMessageData(message.data);
        final title = message.notification?.title ?? alarm.content ?? 'Alarm';
        final body =
            message.notification?.body ?? alarm.signal ?? alarm.content ?? '';
        _alarmService.triggerAlarmInForeground(
          id: id,
          title: title,
          body: body,
          payload: payload,
        );
      } else if (message.notification != null) {
        log('Message notification: ${message.notification?.toMap()}');
        _localNotificationService.showNotification(
          id: id,
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          payload: payload,
        );
      }

      _foregroundMessageController.add(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log('A new onMessageOpenedApp event was published!');

      _backgroundOpenedController.add(message);
    });

    final initialMessage = await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      log('Got a message from terminated state!');

      _initialMessageController.add(initialMessage);
    }
  }

  Future<void> setBadgeCount(int count) async {
    await _firebaseMessaging.setAutoInitEnabled(true);
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);

    log('Subscribed to topic: $topic');
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);

    log('Unsubscribed from topic: $topic');
  }

  void dispose() {
    _backgroundOpenedSub?.cancel();
    _foregroundMessagesSub?.cancel();
    _initialMessagesSub?.cancel();
    _tokenController.close();
    _foregroundMessageController.close();
    _backgroundOpenedController.close();
    _initialMessageController.close();
  }
}
