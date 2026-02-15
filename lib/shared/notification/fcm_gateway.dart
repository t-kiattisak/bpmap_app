import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:bpmap_app/features/notification/domain/entities/notification_permission_status.dart';
import 'package:bpmap_app/shared/notification/fcm_background_handler.dart';
import 'package:bpmap_app/shared/notification/notification_message_callback.dart';
import 'package:bpmap_app/shared/services/local_notification_service.dart';

class FcmGateway {
  FcmGateway(this._localNotificationService);

  final LocalNotificationService _localNotificationService;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  final Map<String, NotificationMessageCallback> _handlers = {};
  String? _currentToken;
  final _tokenController = StreamController<String?>.broadcast();

  Stream<String?> get tokenStream => _tokenController.stream;
  String? get currentToken => _currentToken;

  /// ลงทะเบียน callback สำหรับ type ที่กำหนด (เช่น 'alarm', 'default')
  void registerHandler(String type, NotificationMessageCallback callback) {
    _handlers[type] = callback;
  }

  Future<void> initialize() async {
    await _localNotificationService.initialize();
    await _requestPermission();
    await _setupMessageHandlers();
    await _refreshToken();
    _setupTokenRefreshListener();
  }

  Future<NotificationPermissionStatus> _requestPermission() async {
    final settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    log('FCM permission: ${settings.authorizationStatus}');
    return NotificationPermissionStatus(settings.authorizationStatus);
  }

  Future<NotificationPermissionStatus> getPermissionStatus() async {
    final settings = await _fcm.getNotificationSettings();
    return NotificationPermissionStatus(settings.authorizationStatus);
  }

  Future<NotificationPermissionStatus> requestPermission() async {
    return _requestPermission();
  }

  Future<String?> getToken() async {
    if (_currentToken != null) return _currentToken;
    return _refreshToken();
  }

  Future<String?> _refreshToken() async {
    try {
      _currentToken = await _fcm.getToken();
      _tokenController.add(_currentToken);
      log('FCM Token: $_currentToken');
      return _currentToken;
    } catch (e) {
      log('FCM getToken error: $e');
      return null;
    }
  }

  void _setupTokenRefreshListener() {
    _fcm.onTokenRefresh.listen((newToken) {
      _currentToken = newToken;
      _tokenController.add(newToken);
      log('FCM Token refreshed: $newToken');
    });
  }

  Future<void> deleteToken() async {
    await _fcm.deleteToken();
    _currentToken = null;
    _tokenController.add(null);
    log('FCM Token deleted');
  }

  Future<void> _setupMessageHandlers() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((message) {
      log('FCM foreground message: ${message.messageId}');
      _dispatch(message, openedFromNotification: false);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log('FCM onMessageOpenedApp');
      _dispatch(message, openedFromNotification: true);
    });

    final initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      log('FCM initialMessage (opened from terminated)');
      _dispatch(initialMessage, openedFromNotification: true);
    }
  }

  Future<void> _dispatch(RemoteMessage message, {bool openedFromNotification = false}) async {
    final type = message.data['type']?.toString() ?? 'default';
    final callback = _handlers[type] ?? _handlers['default'];
    if (callback != null) {
      await callback(message, openedFromNotification: openedFromNotification);
    }
  }

  Future<void> subscribeToTopic(String topic) async {
    await _fcm.subscribeToTopic(topic);
    log('FCM subscribed to topic: $topic');
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _fcm.unsubscribeFromTopic(topic);
    log('FCM unsubscribed from topic: $topic');
  }

  void dispose() {
    _tokenController.close();
  }
}
