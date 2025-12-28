import 'package:bpmap_app/shared/data/remote/network_service.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';

import 'package:bpmap_app/domain/entities/auth_credentials.dart';
import 'package:bpmap_app/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<AppException, AuthCredentials>> login({
    required String username,
    required String password,
  });

  Future<Either<AppException, UserModel>> getMe();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSourceImpl(this._networkService);

  @override
  Future<Either<AppException, AuthCredentials>> login({
    required String username,
    required String password,
  }) async {
    final response = await _networkService.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    );

    return response.fold((exception) => Left(exception), (response) {
      try {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          final credentials = AuthCredentials(
            accessToken: data['accessToken'] ?? data['access_token'] ?? '',
            refreshToken: data['refreshToken'] ?? data['refresh_token'] ?? '',
          );
          return Right(credentials);
        }
        return Left(
          AppException(
            message: 'Invalid response format',
            statusCode: 0,
            identifier: 'AuthRemoteDataSourceImpl.login',
          ),
        );
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to parse response',
            statusCode: 0,
            identifier: 'AuthRemoteDataSourceImpl.login',
          ),
        );
      }
    });
  }

  @override
  Future<Either<AppException, UserModel>> getMe() async {
    final response = await _networkService.get('/auth/me');

    return response.fold((exception) => Left(exception), (response) {
      try {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return Right(UserModel.fromJson(data));
        }
        return Left(
          AppException(
            message: 'Invalid response format',
            statusCode: 0,
            identifier: 'AuthRemoteDataSourceImpl.getMe',
          ),
        );
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to parse response',
            statusCode: 0,
            identifier: 'AuthRemoteDataSourceImpl.getMe',
          ),
        );
      }
    });
  }
}
