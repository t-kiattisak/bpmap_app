import 'package:bpmap_app/data/models/user_me_model.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';
import 'package:bpmap_app/domain/entities/auth_credentials.dart';

abstract class AuthRepository {
  Future<Either<AppException, AuthCredentials>> login({
    required String username,
    required String password,
    required String deviceId,
    required String deviceType,
    required String pushToken,
  });

  Future<Either<AppException, UserMeModel>> getMe();

  Future<Either<AppException, AuthCredentials>> googleLogin({
    required String idToken,
    required String deviceId,
    required String deviceType,
    required String pushToken,
  });

  Future<Either<AppException, AuthCredentials>> lineLogin({
    required String accessToken,
    required String deviceId,
    required String deviceType,
    required String pushToken,
  });
}
