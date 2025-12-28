import 'package:bpmap_app/data/datasources/auth_remote_datasource.dart';
import 'package:bpmap_app/domain/entities/user.dart';
import 'package:bpmap_app/domain/repositories/auth_repository.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppException, User>> login({
    required String username,
    required String password,
  }) async {
    final result = await _remoteDataSource.login(
      username: username,
      password: password,
    );

    // Explicit conversion (though UserModel extends User, Either types need explicit mapping usually if generic types are strict)
    return result.fold(
      (exception) => Left(exception),
      (userModel) => Right(userModel),
    );
  }
}
