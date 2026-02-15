// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appConfig)
const appConfigProvider = AppConfigProvider._();

final class AppConfigProvider
    extends $FunctionalProvider<AppConfig, AppConfig, AppConfig>
    with $Provider<AppConfig> {
  const AppConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigHash();

  @$internal
  @override
  $ProviderElement<AppConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppConfig create(Ref ref) {
    return appConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppConfig>(value),
    );
  }
}

String _$appConfigHash() => r'27ff72ed2d20fad5a90d35611fe37a542b47372f';

@ProviderFor(_flutterSecureStorage)
const _flutterSecureStorageProvider = _FlutterSecureStorageProvider._();

final class _FlutterSecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  const _FlutterSecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_flutterSecureStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_flutterSecureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return _flutterSecureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$_flutterSecureStorageHash() =>
    r'376bb103b0520465f97eec4029a1dc9e324b77e2';

@ProviderFor(storageService)
const storageServiceProvider = StorageServiceProvider._();

final class StorageServiceProvider
    extends $FunctionalProvider<StorageService, StorageService, StorageService>
    with $Provider<StorageService> {
  const StorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageServiceHash();

  @$internal
  @override
  $ProviderElement<StorageService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StorageService create(Ref ref) {
    return storageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageService>(value),
    );
  }
}

String _$storageServiceHash() => r'1747c901b5fc6fe61a1b10972c73a2540869275c';

@ProviderFor(authInterceptor)
const authInterceptorProvider = AuthInterceptorProvider._();

final class AuthInterceptorProvider
    extends
        $FunctionalProvider<AuthInterceptor, AuthInterceptor, AuthInterceptor>
    with $Provider<AuthInterceptor> {
  const AuthInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authInterceptorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authInterceptorHash();

  @$internal
  @override
  $ProviderElement<AuthInterceptor> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthInterceptor create(Ref ref) {
    return authInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthInterceptor>(value),
    );
  }
}

String _$authInterceptorHash() => r'5b6fba238a657fc81c7a18f3c7063d1e1b8f10be';

@ProviderFor(dio)
const dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'b0dcfb1b51ad59ea14fcf33648db7731e8851fcd';

@ProviderFor(networkService)
const networkServiceProvider = NetworkServiceProvider._();

final class NetworkServiceProvider
    extends $FunctionalProvider<NetworkService, NetworkService, NetworkService>
    with $Provider<NetworkService> {
  const NetworkServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkServiceHash();

  @$internal
  @override
  $ProviderElement<NetworkService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkService create(Ref ref) {
    return networkService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkService>(value),
    );
  }
}

String _$networkServiceHash() => r'ed168433cb4c4972a3145a75c58966aaa6d1818d';

@ProviderFor(authRemoteDataSource)
const authRemoteDataSourceProvider = AuthRemoteDataSourceProvider._();

final class AuthRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          AuthRemoteDataSource,
          AuthRemoteDataSource,
          AuthRemoteDataSource
        >
    with $Provider<AuthRemoteDataSource> {
  const AuthRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<AuthRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRemoteDataSource create(Ref ref) {
    return authRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemoteDataSource>(value),
    );
  }
}

String _$authRemoteDataSourceHash() =>
    r'cafa2501d69b614455441f450ce0c89a848ba705';

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'30cfea8a2e8fac262468c7bccf4f2d3f1bf711ad';

@ProviderFor(localNotificationService)
const localNotificationServiceProvider = LocalNotificationServiceProvider._();

final class LocalNotificationServiceProvider
    extends
        $FunctionalProvider<
          LocalNotificationService,
          LocalNotificationService,
          LocalNotificationService
        >
    with $Provider<LocalNotificationService> {
  const LocalNotificationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localNotificationServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localNotificationServiceHash();

  @$internal
  @override
  $ProviderElement<LocalNotificationService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalNotificationService create(Ref ref) {
    return localNotificationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalNotificationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalNotificationService>(value),
    );
  }
}

String _$localNotificationServiceHash() =>
    r'75d10e0179b3f7d36b86238bb229647ac1797977';

@ProviderFor(alarmService)
const alarmServiceProvider = AlarmServiceProvider._();

final class AlarmServiceProvider
    extends $FunctionalProvider<AlarmService, AlarmService, AlarmService>
    with $Provider<AlarmService> {
  const AlarmServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'alarmServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$alarmServiceHash();

  @$internal
  @override
  $ProviderElement<AlarmService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AlarmService create(Ref ref) {
    return alarmService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlarmService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlarmService>(value),
    );
  }
}

String _$alarmServiceHash() => r'31bc356f6a1d47324e5c4a596e0fa36889af4e90';

@ProviderFor(fcmGateway)
const fcmGatewayProvider = FcmGatewayProvider._();

final class FcmGatewayProvider
    extends $FunctionalProvider<FcmGateway, FcmGateway, FcmGateway>
    with $Provider<FcmGateway> {
  const FcmGatewayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fcmGatewayProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fcmGatewayHash();

  @$internal
  @override
  $ProviderElement<FcmGateway> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FcmGateway create(Ref ref) {
    return fcmGateway(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FcmGateway value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FcmGateway>(value),
    );
  }
}

String _$fcmGatewayHash() => r'76e94ff04079b8c3df88c23a8d4e63569aa0f53b';

@ProviderFor(handleAlarmNotificationUseCase)
const handleAlarmNotificationUseCaseProvider =
    HandleAlarmNotificationUseCaseProvider._();

final class HandleAlarmNotificationUseCaseProvider
    extends
        $FunctionalProvider<
          HandleAlarmNotificationUseCase,
          HandleAlarmNotificationUseCase,
          HandleAlarmNotificationUseCase
        >
    with $Provider<HandleAlarmNotificationUseCase> {
  const HandleAlarmNotificationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'handleAlarmNotificationUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$handleAlarmNotificationUseCaseHash();

  @$internal
  @override
  $ProviderElement<HandleAlarmNotificationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HandleAlarmNotificationUseCase create(Ref ref) {
    return handleAlarmNotificationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HandleAlarmNotificationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HandleAlarmNotificationUseCase>(
        value,
      ),
    );
  }
}

String _$handleAlarmNotificationUseCaseHash() =>
    r'1e293e48cf0d304576fbada89a662cfc89335379';

@ProviderFor(handleDefaultNotificationUseCase)
const handleDefaultNotificationUseCaseProvider =
    HandleDefaultNotificationUseCaseProvider._();

final class HandleDefaultNotificationUseCaseProvider
    extends
        $FunctionalProvider<
          HandleDefaultNotificationUseCase,
          HandleDefaultNotificationUseCase,
          HandleDefaultNotificationUseCase
        >
    with $Provider<HandleDefaultNotificationUseCase> {
  const HandleDefaultNotificationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'handleDefaultNotificationUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$handleDefaultNotificationUseCaseHash();

  @$internal
  @override
  $ProviderElement<HandleDefaultNotificationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HandleDefaultNotificationUseCase create(Ref ref) {
    return handleDefaultNotificationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HandleDefaultNotificationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HandleDefaultNotificationUseCase>(
        value,
      ),
    );
  }
}

String _$handleDefaultNotificationUseCaseHash() =>
    r'd203c2ebadf5d0be860323044aa6955da6f3f50c';

@ProviderFor(locationService)
const locationServiceProvider = LocationServiceProvider._();

final class LocationServiceProvider
    extends
        $FunctionalProvider<LocationService, LocationService, LocationService>
    with $Provider<LocationService> {
  const LocationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationServiceHash();

  @$internal
  @override
  $ProviderElement<LocationService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocationService create(Ref ref) {
    return locationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationService>(value),
    );
  }
}

String _$locationServiceHash() => r'38ada00c14c0c2521e7d291f9897c53df2e7008a';

@ProviderFor(deviceInfoService)
const deviceInfoServiceProvider = DeviceInfoServiceProvider._();

final class DeviceInfoServiceProvider
    extends
        $FunctionalProvider<
          DeviceInfoService,
          DeviceInfoService,
          DeviceInfoService
        >
    with $Provider<DeviceInfoService> {
  const DeviceInfoServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceInfoServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceInfoServiceHash();

  @$internal
  @override
  $ProviderElement<DeviceInfoService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeviceInfoService create(Ref ref) {
    return deviceInfoService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceInfoService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceInfoService>(value),
    );
  }
}

String _$deviceInfoServiceHash() => r'72761b22acb8d7b6822acfe9c9be04c5f5a97667';

@ProviderFor(notificationRemoteDataSource)
const notificationRemoteDataSourceProvider =
    NotificationRemoteDataSourceProvider._();

final class NotificationRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          NotificationRemoteDataSource,
          NotificationRemoteDataSource,
          NotificationRemoteDataSource
        >
    with $Provider<NotificationRemoteDataSource> {
  const NotificationRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<NotificationRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationRemoteDataSource create(Ref ref) {
    return notificationRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationRemoteDataSource>(value),
    );
  }
}

String _$notificationRemoteDataSourceHash() =>
    r'1e5ff91b90d0c177f18bc4ee491417281c124bcf';

@ProviderFor(notificationRepository)
const notificationRepositoryProvider = NotificationRepositoryProvider._();

final class NotificationRepositoryProvider
    extends
        $FunctionalProvider<
          NotificationRepository,
          NotificationRepository,
          NotificationRepository
        >
    with $Provider<NotificationRepository> {
  const NotificationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationRepositoryHash();

  @$internal
  @override
  $ProviderElement<NotificationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationRepository create(Ref ref) {
    return notificationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationRepository>(value),
    );
  }
}

String _$notificationRepositoryHash() =>
    r'1cffcb34602143138a74a545fe7816feb6536235';
