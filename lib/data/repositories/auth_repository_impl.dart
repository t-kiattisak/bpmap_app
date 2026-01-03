import 'package:bpmap_app/data/datasources/auth_remote_datasource.dart';

import 'package:bpmap_app/data/models/login_request_model.dart';
import 'package:bpmap_app/data/models/social_login_request_model.dart';
import 'package:bpmap_app/domain/repositories/auth_repository.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';
import 'package:bpmap_app/domain/entities/auth_credentials.dart';
import 'package:bpmap_app/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppException, AuthCredentials>> login({
    required String username,
    required String password,
    required String deviceId,
    required String deviceType,
    required String pushToken,
  }) async {
    final request = LoginRequestModel(
      username: username,
      password: password,
      deviceId: deviceId,
      deviceType: deviceType,
      pushToken: pushToken,
    );
    final result = await _remoteDataSource.login(request);

    return result.fold((exception) => Left(exception), (data) => Right(data));
  }

  @override
  Future<Either<AppException, User>> getMe() async {
    final result = await _remoteDataSource.getMe();
    return result.fold((exception) => Left(exception), (user) => Right(user));
  }

  @override
  Future<Either<AppException, AuthCredentials>> googleLogin({
    required String idToken,
    required String deviceId,
    required String deviceType,
    required String pushToken,
  }) async {
    final request = SocialLoginRequestModel(
      provider: 'google',
      accessToken: idToken,
      deviceId: deviceId,
      deviceType: deviceType,
      pushToken: pushToken,
    );
    final result = await _remoteDataSource.googleLogin(request);
    return result;
  }

  @override
  Future<Either<AppException, AuthCredentials>> lineLogin({
    required String accessToken,
    required String deviceId,
    required String deviceType,
    required String pushToken,
  }) async {
    final request = SocialLoginRequestModel(
      provider: 'line',
      accessToken: accessToken,
      deviceId: deviceId,
      deviceType: deviceType,
      pushToken: pushToken,
    );
    final result = await _remoteDataSource.lineLogin(request);
    return result;
  }
}
