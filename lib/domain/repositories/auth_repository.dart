import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';
import 'package:bpmap_app/domain/entities/auth_credentials.dart';
import 'package:bpmap_app/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<AppException, AuthCredentials>> login({
    required String username,
    required String password,
  });

  Future<Either<AppException, User>> getMe();

  Future<Either<AppException, AuthCredentials>> googleLogin({
    required String idToken,
  });
}
