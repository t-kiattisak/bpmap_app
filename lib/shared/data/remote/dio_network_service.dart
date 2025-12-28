import 'package:bpmap_app/shared/data/remote/network_service.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/exception_handler_mixin.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';
import 'package:dio/dio.dart';
import 'package:bpmap_app/shared/domain/models/response.dart' as response;

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio _dio;

  DioNetworkService(this._dio);

  @override
  String get baseUrl => _dio.options.baseUrl;

  @override
  String get headers => _dio.options.headers.toString();

  @override
  void updateHeader(Map<String, dynamic> data) {
    data.forEach((key, value) {
      _dio.options.headers[key] = value;
    });
  }

  @override
  Future<Either<AppException, response.Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    return handleException(
      () => _dio.get(endpoint, queryParameters: queryParameters),
      endpoint: endpoint,
    );
  }

  @override
  Future<Either<AppException, response.Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => _dio.post(endpoint, data: data),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> put(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    return handleException(
      () => _dio.put(endpoint, data: data),
      endpoint: endpoint,
    );
  }

  @override
  Future<Either<AppException, response.Response>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    return handleException(
      () => _dio.delete(endpoint, data: data),
      endpoint: endpoint,
    );
  }
}
