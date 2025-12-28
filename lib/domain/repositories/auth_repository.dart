import 'package:bpmap_app/domain/entities/user.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';

abstract class AuthRepository {
  Future<Either<AppException, User>> login({
    required String username,
    required String password,
  });
}
