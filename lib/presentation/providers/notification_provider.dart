import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bpmap_app/domain/entities/notification_permission_status.dart';
import 'package:bpmap_app/shared/domain/providers/local_notification_provider.dart';

part 'notification_provider.g.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Handling a background message: ${message.messageId}");
}

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final LocalNotificationService _localNotificationService;

  NotificationService(this._localNotificationService);

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

  Future<void> initialize() async {
    await _localNotificationService.initialize();
    await _requestPermission();
    await _setupMessageHandlers();
    await _refreshToken();
    _setupTokenRefreshListener();
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
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message notification: ${message.notification?.title}');
        _localNotificationService.showNotification(
          id: message.hashCode,
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          payload: message.data.toString(),
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
    _tokenController.close();
    _foregroundMessageController.close();
    _backgroundOpenedController.close();
    _initialMessageController.close();
  }
}

@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) {
  final localService = ref.watch(localNotificationServiceProvider);
  final service = NotificationService(localService);
  ref.onDispose(() => service.dispose());
  return service;
}

@riverpod
Stream<String?> notificationToken(Ref ref) {
  final service = ref.watch(notificationServiceProvider);
  return service.tokenStream;
}

@riverpod
String? currentNotificationToken(Ref ref) {
  final service = ref.watch(notificationServiceProvider);
  return service.currentToken;
}

@riverpod
Stream<RemoteMessage> foregroundMessages(Ref ref) {
  final service = ref.watch(notificationServiceProvider);
  return service.foregroundMessages;
}

@riverpod
Stream<RemoteMessage> backgroundOpenedMessages(Ref ref) {
  final service = ref.watch(notificationServiceProvider);
  return service.backgroundOpenedMessages;
}

@riverpod
Stream<RemoteMessage> initialMessages(Ref ref) {
  final service = ref.watch(notificationServiceProvider);
  return service.initialMessages;
}

@riverpod
Future<NotificationPermissionStatus> notificationPermissionStatus(
  Ref ref,
) async {
  final service = ref.watch(notificationServiceProvider);
  return await service.getPermissionStatus();
}

/*
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(currentNotificationTokenProvider);
    final tokenAsync = ref.watch(notificationTokenProvider);
    
    return tokenAsync.when(
      data: (token) => Text('Token: $token'),
      loading: () => CircularProgressIndicator(),
      error: (e, s) => Text('Error: $e'),
    );
  }
}

class NotificationListener extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(foregroundMessagesProvider, (previous, next) {
      next.whenData((message) {
        // Show local notification or navigate
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(message.notification?.title ?? ''),
            content: Text(message.notification?.body ?? ''),
          ),
        );
      });
    });
    
    return Container();
  }
}

class TopicSubscriber extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.read(notificationServiceProvider);
    
    return ElevatedButton(
      onPressed: () async {
        await service.subscribeToTopic('news');
      },
      child: Text('Subscribe to News'),
    );
  }
}

final token = await ref.read(notificationServiceProvider).getToken();

// 6. Check permission
final permission = await ref.read(notificationPermissionStatusProvider.future);
if (permission.isDenied) {
  // Show permission request dialog
}

*/
