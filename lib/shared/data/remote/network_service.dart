import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/domain/models/response.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  String get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, Response>> put(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, Response>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
