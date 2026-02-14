import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationPermissionStatus {
  final AuthorizationStatus status;
  final bool isGranted;
  final bool isDenied;
  final bool isProvisional;

  NotificationPermissionStatus(this.status)
    : isGranted = status == AuthorizationStatus.authorized,
      isDenied = status == AuthorizationStatus.denied,
      isProvisional = status == AuthorizationStatus.provisional;
}
