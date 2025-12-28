import 'package:bpmap_app/data/datasources/auth_remote_datasource.dart';

import 'package:bpmap_app/domain/repositories/auth_repository.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';
import 'package:bpmap_app/domain/entities/auth_credentials.dart';
import 'package:bpmap_app/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  @override
  Future<Either<AppException, AuthCredentials>> login({
    required String username,
    required String password,
  }) async {
    final result = await _remoteDataSource.login(
      username: username,
      password: password,
    );

    return result.fold((exception) => Left(exception), (data) => Right(data));
  }

  @override
  Future<Either<AppException, User>> getMe() async {
    final result = await _remoteDataSource.getMe();
    return result.fold((exception) => Left(exception), (user) => Right(user));
  }
}
