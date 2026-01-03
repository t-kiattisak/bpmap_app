import 'dart:developer';

import 'package:bpmap_app/presentation/providers/notification_provider.dart';
import 'package:bpmap_app/shared/domain/providers/app_config_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bpmap_app/data/datasources/auth_remote_datasource.dart';
import 'package:bpmap_app/data/repositories/auth_repository_impl.dart';
import 'package:bpmap_app/domain/repositories/auth_repository.dart';
import 'package:bpmap_app/shared/domain/providers/network_provider.dart';
import 'package:bpmap_app/shared/domain/providers/storage_provider.dart';
import 'package:bpmap_app/domain/entities/auth_credentials.dart';
import 'package:bpmap_app/shared/domain/providers/device_info_provider.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final networkService = ref.watch(networkProvider);
  return AuthRemoteDataSourceImpl(networkService);
}

@riverpod
AuthRepository authRepository(Ref ref) {
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
          log('Auto-login failed: $error');
          if (error.statusCode == 401) {
            await storage.clearAll();
          }
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
    final deviceInfoService = ref.read(deviceInfoServiceProvider);
    final notificationService = ref.read(notificationServiceProvider);

    final deviceInfo = await deviceInfoService.getDeviceInfo();
    final fcmToken = await notificationService.getToken() ?? '';

    final result = await repository.login(
      username: username,
      password: password,
      deviceId: deviceInfo.deviceId,
      deviceType: deviceInfo.deviceType,
      pushToken: fcmToken,
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

  Future<void> googleLogin() async {
    state = const AsyncLoading();
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId: ref.read(appConfigProvider).googleServerClientId,
      );
      final GoogleSignIn signIn = GoogleSignIn.instance;
      final GoogleSignInAccount? googleUser = await signIn.authenticate();
      if (googleUser == null) {
        state = AsyncError(
          Exception('Google Sign-In failed: No User'),
          StackTrace.current,
        );
        return;
      }

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        state = AsyncError(
          Exception('Google Sign-In failed: No ID Token'),
          StackTrace.current,
        );
        return;
      }

      final repository = ref.read(authRepositoryProvider);
      final storage = ref.read(storageServiceProvider);
      final deviceInfoService = ref.read(deviceInfoServiceProvider);
      final notificationService = ref.read(notificationServiceProvider);

      final deviceInfo = await deviceInfoService.getDeviceInfo();
      final fcmToken = await notificationService.getToken() ?? '';

      final result = await repository.googleLogin(
        idToken: idToken,
        deviceId: deviceInfo.deviceId,
        deviceType: deviceInfo.deviceType,
        pushToken: fcmToken,
      );
      state = await result.fold(
        (error) => AsyncError(error, StackTrace.current),
        (credentials) async {
          await storage.setAccessToken(credentials.accessToken);
          await storage.setRefreshToken(credentials.refreshToken);

          return AsyncData(credentials);
        },
      );
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> lineLogin() async {
    state = const AsyncLoading();
    try {
      await LineSDK.instance.setup(ref.read(appConfigProvider).lineChannelId);
      final result = await LineSDK.instance.login(
        scopes: ['profile', 'openid', 'email'],
      );
      final idToken = result.accessToken.idTokenRaw;
      if (idToken == null) {
        state = AsyncError(
          Exception('Line Sign-In failed: No ID Token'),
          StackTrace.current,
        );
        return;
      }

      final repository = ref.read(authRepositoryProvider);
      final storage = ref.read(storageServiceProvider);
      final deviceInfoService = ref.read(deviceInfoServiceProvider);
      final notificationService = ref.read(notificationServiceProvider);

      final deviceInfo = await deviceInfoService.getDeviceInfo();
      final fcmToken = await notificationService.getToken() ?? '';

      final authResult = await repository.lineLogin(
        accessToken: idToken,
        deviceId: deviceInfo.deviceId,
        deviceType: deviceInfo.deviceType,
        pushToken: fcmToken,
      );
      state = await authResult.fold(
        (error) => AsyncError(error, StackTrace.current),
        (credentials) async {
          await storage.setAccessToken(credentials.accessToken);
          await storage.setRefreshToken(credentials.refreshToken);

          return AsyncData(credentials);
        },
      );
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
