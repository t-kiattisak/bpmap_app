import 'package:bpmap_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:bpmap_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bpmap_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:bpmap_app/features/notification/data/datasources/notification_remote_datasource.dart';
import 'package:bpmap_app/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:bpmap_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:bpmap_app/shared/constants/app_constants.dart';
import 'package:bpmap_app/shared/data/local/storage_service.dart';
import 'package:bpmap_app/shared/data/remote/dio_network_service.dart';
import 'package:bpmap_app/shared/data/remote/network_service.dart';
import 'package:bpmap_app/shared/data/remote/interceptors/auth_interceptor.dart';
import 'package:bpmap_app/shared/domain/models/app_config.dart';
import 'package:bpmap_app/shared/services/alarm_service.dart';
import 'package:bpmap_app/shared/services/device_info_service.dart';
import 'package:bpmap_app/shared/services/local_notification_service.dart';
import 'package:bpmap_app/features/notification/domain/use_cases/handle_alarm_notification_use_case.dart';
import 'package:bpmap_app/features/notification/domain/use_cases/handle_default_notification_use_case.dart';
import 'package:bpmap_app/shared/notification/fcm_gateway.dart';
import 'package:bpmap_app/shared/services/location_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di_providers.g.dart';

@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) {
  throw StateError(
    'AppConfig must be overridden in ProviderScope (main_common)',
  );
}

@Riverpod(keepAlive: true)
FlutterSecureStorage _flutterSecureStorage(Ref ref) =>
    const FlutterSecureStorage();

@Riverpod(keepAlive: true)
StorageService storageService(Ref ref) {
  return StorageService(ref.watch(_flutterSecureStorageProvider));
}

@Riverpod(keepAlive: true)
AuthInterceptor authInterceptor(Ref ref) {
  return AuthInterceptor(ref.watch(storageServiceProvider));
}

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final config = ref.watch(appConfigProvider);
  final instance = Dio(
    BaseOptions(
      baseUrl: config.apiBaseUrl,
      receiveTimeout: const Duration(milliseconds: AppConstants.receiveTimeout),
      connectTimeout: const Duration(milliseconds: AppConstants.connectTimeout),
      sendTimeout: const Duration(milliseconds: AppConstants.sendTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  instance.interceptors.addAll([
    ref.read(authInterceptorProvider),
    LogInterceptor(request: true, requestBody: true, responseBody: true),
  ]);
  return instance;
}

@Riverpod(keepAlive: true)
NetworkService networkService(Ref ref) {
  return DioNetworkService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSourceImpl(ref.watch(networkServiceProvider));
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDataSourceProvider));
}

@Riverpod(keepAlive: true)
LocalNotificationService localNotificationService(Ref ref) {
  return LocalNotificationService();
}

@Riverpod(keepAlive: true)
AlarmService alarmService(Ref ref) => AlarmService();

@Riverpod(keepAlive: true)
FcmGateway fcmGateway(Ref ref) {
  return FcmGateway(ref.watch(localNotificationServiceProvider));
}

@Riverpod(keepAlive: true)
HandleAlarmNotificationUseCase handleAlarmNotificationUseCase(Ref ref) {
  return HandleAlarmNotificationUseCase(ref.watch(alarmServiceProvider));
}

@Riverpod(keepAlive: true)
HandleDefaultNotificationUseCase handleDefaultNotificationUseCase(Ref ref) {
  return HandleDefaultNotificationUseCase(
    ref.watch(localNotificationServiceProvider),
  );
}

@Riverpod(keepAlive: true)
LocationService locationService(Ref ref) => LocationService();

@Riverpod(keepAlive: true)
DeviceInfoService deviceInfoService(Ref ref) => DeviceInfoService();

@Riverpod(keepAlive: true)
NotificationRemoteDataSource notificationRemoteDataSource(Ref ref) {
  return NotificationRemoteDataSourceImpl(ref.watch(networkServiceProvider));
}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(Ref ref) {
  return NotificationRepositoryImpl(
    ref.watch(notificationRemoteDataSourceProvider),
  );
}
