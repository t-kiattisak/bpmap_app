import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bpmap_app/data/datasources/auth_remote_datasource.dart';
import 'package:bpmap_app/data/repositories/auth_repository_impl.dart';
import 'package:bpmap_app/domain/repositories/auth_repository.dart';
import 'package:bpmap_app/shared/domain/providers/network_provider.dart';
import 'package:bpmap_app/shared/domain/providers/storage_provider.dart';
import 'package:bpmap_app/domain/entities/auth_credentials.dart';

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
  FutureOr<AuthCredentials> build() async {
    final storage = ref.read(storageServiceProvider);
    final accessToken = await storage.getAccessToken();
    final refreshToken = await storage.getRefreshToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.getMe();

      return result.fold(
        (error) async {
          await storage.clearAll();
          return AuthCredentials(accessToken: '', refreshToken: '');
        },
        (user) {
          return AuthCredentials(
            accessToken: accessToken,
            refreshToken: refreshToken ?? '',
          );
        },
      );
    }
    return AuthCredentials(accessToken: '', refreshToken: '');
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(authRepositoryProvider);
    final storage = ref.read(storageServiceProvider);

    final result = await repository.login(
      username: username,
      password: password,
    );

    state = await result.fold(
      (error) => AsyncError(error, StackTrace.current),
      (credentials) async {
        await storage.setAccessToken(credentials.accessToken);
        await storage.setRefreshToken(credentials.refreshToken);

        return AsyncData(credentials);
      },
    );
  }

  Future<void> logout() async {
    final storage = ref.read(storageServiceProvider);
    await storage.clearAll();
    state = const AsyncData(AuthCredentials(accessToken: '', refreshToken: ''));
  }
}
