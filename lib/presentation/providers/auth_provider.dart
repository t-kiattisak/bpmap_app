import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bpmap_app/data/datasources/auth_remote_datasource.dart';
import 'package:bpmap_app/data/repositories/auth_repository_impl.dart';
import 'package:bpmap_app/domain/repositories/auth_repository.dart';
import 'package:bpmap_app/shared/domain/providers/network_provider.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  final networkService = ref.watch(networkProvider);
  return AuthRemoteDataSourceImpl(networkService);
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
}

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {}

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(authRepositoryProvider);
    final result = await repository.login(
      username: username,
      password: password,
    );
    state = result.fold(
      (error) => AsyncError(error, StackTrace.current),
      (user) => const AsyncData(null),
    );
  }
}
