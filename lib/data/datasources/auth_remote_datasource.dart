import 'package:bpmap_app/data/models/user_me_model.dart';
import 'package:bpmap_app/shared/data/remote/network_service.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';
import 'package:bpmap_app/data/models/auth_response_model.dart';
import 'package:bpmap_app/data/models/login_request_model.dart';
import 'package:bpmap_app/data/models/social_login_request_model.dart';

import 'package:bpmap_app/domain/entities/auth_credentials.dart';

abstract class AuthRemoteDataSource {
  Future<Either<AppException, AuthCredentials>> login(
    LoginRequestModel request,
  );

  Future<Either<AppException, UserMeModel>> getMe();

  Future<Either<AppException, AuthCredentials>> googleLogin(
    SocialLoginRequestModel request,
  );

  Future<Either<AppException, AuthCredentials>> lineLogin(
    SocialLoginRequestModel request,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSourceImpl(this._networkService);

  @override
  Future<Either<AppException, AuthCredentials>> login(
    LoginRequestModel request,
  ) async {
    final response = await _networkService.post(
      '/api/auth/login',
      data: request.toJson(),
    );

    return response.fold((exception) => Left(exception), (response) {
      try {
        final resData = response.data;
        final authResponse = AuthResponseModel.fromJson(resData);
        final credentials = AuthCredentials(
          accessToken: authResponse.data.accessToken,
          refreshToken: authResponse.data.accessToken,
        );
        return Right(credentials);
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
  Future<Either<AppException, AuthCredentials>> googleLogin(
    SocialLoginRequestModel request,
  ) async {
    final response = await _networkService.post(
      '/api/auth/login',
      data: request.toJson(),
    );

    return response.fold((exception) => Left(exception), (response) {
      try {
        final resData = response.data;
        final authResponse = AuthResponseModel.fromJson(resData);
        final credentials = AuthCredentials(
          accessToken: authResponse.data.accessToken,
          refreshToken: authResponse.data.accessToken,
        );
        return Right(credentials);
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to parse response',
            statusCode: 0,
            identifier: 'AuthRemoteDataSourceImpl.googleLogin',
          ),
        );
      }
    });
  }

  @override
  Future<Either<AppException, AuthCredentials>> lineLogin(
    SocialLoginRequestModel request,
  ) async {
    final response = await _networkService.post(
      '/api/auth/login',
      data: request.toJson(),
    );

    return response.fold((exception) => Left(exception), (response) {
      try {
        final resData = response.data;
        final authResponse = AuthResponseModel.fromJson(resData);
        final credentials = AuthCredentials(
          accessToken: authResponse.data.accessToken,
          refreshToken: authResponse.data.accessToken,
        );
        return Right(credentials);
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to parse response',
            statusCode: 0,
            identifier: 'AuthRemoteDataSourceImpl.lineLogin',
          ),
        );
      }
    });
  }

  @override
  Future<Either<AppException, UserMeModel>> getMe() async {
    final response = await _networkService.get('/api/users/me');

    return response.fold((exception) => Left(exception), (response) {
      try {
        final data = response.data;
        return Right(UserMeModel.fromJson(data));
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
