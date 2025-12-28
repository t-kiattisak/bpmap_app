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
    final storage = ref.read(secureStorageProvider);
    final accessToken = await storage.read(key: 'access_token');
    final refreshToken = await storage.read(key: 'refresh_token');

    if (accessToken != null && accessToken.isNotEmpty) {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.getMe();

      return result.fold(
        (error) async {
          await storage.deleteAll();
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
    final storage = ref.read(secureStorageProvider);

    final result = await repository.login(
      username: username,
      password: password,
    );

    state = await result.fold(
      (error) => AsyncError(error, StackTrace.current),
      (credentials) async {
        await storage.write(
          key: 'access_token',
          value: credentials.accessToken,
        );
        await storage.write(
          key: 'refresh_token',
          value: credentials.refreshToken,
        );

        return AsyncData(credentials);
      },
    );
  }

  Future<void> logout() async {
    final storage = ref.read(secureStorageProvider);
    await storage.deleteAll();
    state = const AsyncData(AuthCredentials(accessToken: '', refreshToken: ''));
  }
}
