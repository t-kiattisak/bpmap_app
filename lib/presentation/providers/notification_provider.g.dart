// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationService)
const notificationServiceProvider = NotificationServiceProvider._();

final class NotificationServiceProvider
    extends
        $FunctionalProvider<
          NotificationService,
          NotificationService,
          NotificationService
        >
    with $Provider<NotificationService> {
  const NotificationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationServiceHash();

  @$internal
  @override
  $ProviderElement<NotificationService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationService create(Ref ref) {
    return notificationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationService>(value),
    );
  }
}

String _$notificationServiceHash() =>
    r'9121c8e10427c153e72fe76bb7575ce473f25280';

@ProviderFor(notificationToken)
const notificationTokenProvider = NotificationTokenProvider._();

final class NotificationTokenProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, Stream<String?>>
    with $FutureModifier<String?>, $StreamProvider<String?> {
  const NotificationTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationTokenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationTokenHash();

  @$internal
  @override
  $StreamProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String?> create(Ref ref) {
    return notificationToken(ref);
  }
}

String _$notificationTokenHash() => r'11f0e10616834637500364091a7d020e2d6eb23a';

@ProviderFor(currentNotificationToken)
const currentNotificationTokenProvider = CurrentNotificationTokenProvider._();

final class CurrentNotificationTokenProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  const CurrentNotificationTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentNotificationTokenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentNotificationTokenHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return currentNotificationToken(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$currentNotificationTokenHash() =>
    r'8caae967d5344aa768a5e9e667a50a50baf4786e';

@ProviderFor(foregroundMessages)
const foregroundMessagesProvider = ForegroundMessagesProvider._();

final class ForegroundMessagesProvider
    extends
        $FunctionalProvider<
          AsyncValue<RemoteMessage>,
          RemoteMessage,
          Stream<RemoteMessage>
        >
    with $FutureModifier<RemoteMessage>, $StreamProvider<RemoteMessage> {
  const ForegroundMessagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foregroundMessagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foregroundMessagesHash();

  @$internal
  @override
  $StreamProviderElement<RemoteMessage> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<RemoteMessage> create(Ref ref) {
    return foregroundMessages(ref);
  }
}

String _$foregroundMessagesHash() =>
    r'8ce9b57f44a645ec97b90f7842c7324b43106fa6';

@ProviderFor(backgroundOpenedMessages)
const backgroundOpenedMessagesProvider = BackgroundOpenedMessagesProvider._();

final class BackgroundOpenedMessagesProvider
    extends
        $FunctionalProvider<
          AsyncValue<RemoteMessage>,
          RemoteMessage,
          Stream<RemoteMessage>
        >
    with $FutureModifier<RemoteMessage>, $StreamProvider<RemoteMessage> {
  const BackgroundOpenedMessagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backgroundOpenedMessagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backgroundOpenedMessagesHash();

  @$internal
  @override
  $StreamProviderElement<RemoteMessage> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<RemoteMessage> create(Ref ref) {
    return backgroundOpenedMessages(ref);
  }
}

String _$backgroundOpenedMessagesHash() =>
    r'3a7e2bc2a4bd03518f710928698e257f016515fc';

@ProviderFor(initialMessages)
const initialMessagesProvider = InitialMessagesProvider._();

final class InitialMessagesProvider
    extends
        $FunctionalProvider<
          AsyncValue<RemoteMessage>,
          RemoteMessage,
          Stream<RemoteMessage>
        >
    with $FutureModifier<RemoteMessage>, $StreamProvider<RemoteMessage> {
  const InitialMessagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initialMessagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initialMessagesHash();

  @$internal
  @override
  $StreamProviderElement<RemoteMessage> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<RemoteMessage> create(Ref ref) {
    return initialMessages(ref);
  }
}

String _$initialMessagesHash() => r'd8c4f5dcc960ab20a0f10d5585f61e2072d85742';

@ProviderFor(notificationPermissionStatus)
const notificationPermissionStatusProvider =
    NotificationPermissionStatusProvider._();

final class NotificationPermissionStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<NotificationPermissionStatus>,
          NotificationPermissionStatus,
          FutureOr<NotificationPermissionStatus>
        >
    with
        $FutureModifier<NotificationPermissionStatus>,
        $FutureProvider<NotificationPermissionStatus> {
  const NotificationPermissionStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationPermissionStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationPermissionStatusHash();

  @$internal
  @override
  $FutureProviderElement<NotificationPermissionStatus> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NotificationPermissionStatus> create(Ref ref) {
    return notificationPermissionStatus(ref);
  }
}

String _$notificationPermissionStatusHash() =>
    r'a0cc5a18e70425ff02c75dd601b2efd5f48d55f3';
