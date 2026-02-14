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
import 'package:bpmap_app/shared/services/device_info_service.dart';
import 'package:bpmap_app/shared/services/location_service.dart';
import 'package:bpmap_app/shared/services/alarm_service.dart';
import 'package:bpmap_app/shared/services/local_notification_service.dart';
import 'package:bpmap_app/shared/services/notification_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependencies(AppConfig appConfig) async {
  getIt.registerSingleton<AppConfig>(appConfig);

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<StorageService>(
    () => StorageService(getIt<FlutterSecureStorage>()),
  );

  getIt.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(getIt<StorageService>()),
  );
  getIt.registerLazySingleton<Dio>(() {
    final config = getIt<AppConfig>();
    final dio = Dio(
      BaseOptions(
        baseUrl: config.apiBaseUrl,
        receiveTimeout: const Duration(
          milliseconds: AppConstants.receiveTimeout,
        ),
        connectTimeout: const Duration(
          milliseconds: AppConstants.connectTimeout,
        ),
        sendTimeout: const Duration(milliseconds: AppConstants.sendTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    dio.interceptors.addAll([
      getIt<AuthInterceptor>(),
      LogInterceptor(request: true, requestBody: true, responseBody: true),
    ]);
    return dio;
  });
  getIt.registerLazySingleton<NetworkService>(
    () => DioNetworkService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<NetworkService>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<LocalNotificationService>(
    () => LocalNotificationService(),
  );
  getIt.registerLazySingleton<AlarmService>(() => AlarmService());
  getIt.registerLazySingleton<NotificationService>(
    () => NotificationService(
      getIt<LocalNotificationService>(),
      getIt<AlarmService>(),
    ),
  );
  getIt.registerLazySingleton<LocationService>(() => LocationService());

  getIt.registerLazySingleton<DeviceInfoService>(() => DeviceInfoService());

  getIt.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(getIt<NetworkService>()),
  );
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(getIt<NotificationRemoteDataSource>()),
  );
}
