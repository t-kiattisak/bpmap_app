import 'package:bpmap_app/shared/domain/providers/app_config_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../constants/app_constants.dart';
import '../../data/remote/dio_network_service.dart';
import '../../data/remote/network_service.dart';
import '../../data/remote/interceptors/auth_interceptor.dart';
import 'storage_provider.dart';

part 'network_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final config = ref.watch(appConfigProvider);
  final dio = Dio(
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

  dio.interceptors.addAll([
    ref.watch(authInterceptorProvider),
    LogInterceptor(request: true, requestBody: true, responseBody: true),
  ]);

  return dio;
}

@riverpod
AuthInterceptor authInterceptor(AuthInterceptorRef ref) {
  final storage = ref.watch(storageServiceProvider);
  return AuthInterceptor(storage);
}

@riverpod
NetworkService network(NetworkRef ref) {
  final dio = ref.watch(dioProvider);
  return DioNetworkService(dio);
}
