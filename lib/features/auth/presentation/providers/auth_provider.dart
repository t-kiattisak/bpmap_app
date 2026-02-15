import 'dart:developer';

import 'package:bpmap_app/features/auth/data/models/user_me_model.dart';
import 'package:bpmap_app/features/auth/domain/entities/auth_credentials.dart';
import 'package:bpmap_app/features/auth/presentation/state/auth_state.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';
import 'package:bpmap_app/shared/providers/di_providers.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

const _defaultAuthErrorMessage = 'ไม่สามารถเข้าสู่ระบบได้ กรุณาลองใหม่';

String _userMessage(Object error) {
  if (error is AppException) {
    if (error.statusCode == 401) return 'อีเมลหรือรหัสผ่านไม่ถูกต้อง';
    return error.message.isNotEmpty ? error.message : _defaultAuthErrorMessage;
  }
  return _defaultAuthErrorMessage;
}

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  Future<AuthState> build() async {
    final storage = ref.read(storageServiceProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final accessToken = await storage.getAccessToken();
    final refreshToken = await storage.getRefreshToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      final result = await authRepository.getMe();
      return result.fold(
        (error) async {
          log('Auto-login failed: $error');
          if (error.statusCode == 401) await storage.clearAll();
          return const AuthUnauthenticated();
        },
        (user) {
          final credentials = AuthCredentials(
            accessToken: accessToken,
            refreshToken: refreshToken ?? '',
          );
          return AuthAuthenticated(credentials: credentials, userMe: user);
        },
      );
    }
    return const AuthUnauthenticated();
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    final deviceInfoService = ref.read(deviceInfoServiceProvider);
    final gateway = ref.read(fcmGatewayProvider);

    final deviceInfo = await deviceInfoService.getDeviceInfo();
    final fcmToken = await gateway.getToken() ?? '';

    final result = await authRepository.login(
      username: username,
      password: password,
      deviceId: deviceInfo.deviceId,
      deviceType: deviceInfo.deviceType,
      pushToken: fcmToken,
    );

    state = await result.fold(
      (error) => AsyncError(AuthError(_userMessage(error)), StackTrace.current),
      (credentials) async {
        final userMe = await _saveCredentialsAndLoadUser(credentials);
        return AsyncData(
          AuthAuthenticated(credentials: credentials, userMe: userMe),
        );
      },
    );
  }

  Future<void> logout() async {
    await ref.read(storageServiceProvider).clearAll();
    state = const AsyncData(AuthUnauthenticated());
  }

  Future<void> googleLogin() async {
    state = const AsyncLoading();
    try {
      final appConfig = ref.read(appConfigProvider);
      await GoogleSignIn.instance.initialize(
        serverClientId: appConfig.googleServerClientId,
      );
      final googleUser = await GoogleSignIn.instance.authenticate();
      final idToken = googleUser.authentication.idToken;
      if (idToken == null || idToken.isEmpty) {
        state = AsyncError(
          const AuthError('Google Sign-In ไม่สำเร็จ ไม่พบ ID Token'),
          StackTrace.current,
        );
        return;
      }

      final authRepository = ref.read(authRepositoryProvider);
      final deviceInfoService = ref.read(deviceInfoServiceProvider);
      final gateway = ref.read(fcmGatewayProvider);
      final deviceInfo = await deviceInfoService.getDeviceInfo();
      final fcmToken = await gateway.getToken() ?? '';

      final result = await authRepository.googleLogin(
        idToken: idToken,
        deviceId: deviceInfo.deviceId,
        deviceType: deviceInfo.deviceType,
        pushToken: fcmToken,
      );

      state = await result.fold(
        (error) =>
            AsyncError(AuthError(_userMessage(error)), StackTrace.current),
        (credentials) async {
          final userMe = await _saveCredentialsAndLoadUser(credentials);
          return AsyncData(
            AuthAuthenticated(credentials: credentials, userMe: userMe),
          );
        },
      );
    } catch (e, st) {
      state = AsyncError(AuthError(_userMessage(e)), st);
    }
  }

  Future<void> lineLogin() async {
    state = const AsyncLoading();
    try {
      final appConfig = ref.read(appConfigProvider);
      await LineSDK.instance.setup(appConfig.lineChannelId);
      final result = await LineSDK.instance.login(
        scopes: ['profile', 'openid', 'email'],
      );
      final idToken = result.accessToken.idTokenRaw;
      if (idToken == null || idToken.isEmpty) {
        state = AsyncError(
          const AuthError('Line Sign-In ไม่สำเร็จ ไม่พบ ID Token'),
          StackTrace.current,
        );
        return;
      }

      final authRepository = ref.read(authRepositoryProvider);
      final deviceInfoService = ref.read(deviceInfoServiceProvider);
      final gateway = ref.read(fcmGatewayProvider);
      final deviceInfo = await deviceInfoService.getDeviceInfo();
      final fcmToken = await gateway.getToken() ?? '';

      final authResult = await authRepository.lineLogin(
        accessToken: idToken,
        deviceId: deviceInfo.deviceId,
        deviceType: deviceInfo.deviceType,
        pushToken: fcmToken,
      );

      state = await authResult.fold(
        (error) =>
            AsyncError(AuthError(_userMessage(error)), StackTrace.current),
        (credentials) async {
          final userMe = await _saveCredentialsAndLoadUser(credentials);
          return AsyncData(
            AuthAuthenticated(credentials: credentials, userMe: userMe),
          );
        },
      );
    } catch (e, st) {
      state = AsyncError(AuthError(_userMessage(e)), st);
    }
  }

  Future<UserMeModel?> _saveCredentialsAndLoadUser(
    AuthCredentials credentials,
  ) async {
    final storage = ref.read(storageServiceProvider);
    final authRepository = ref.read(authRepositoryProvider);
    await storage.setAccessToken(credentials.accessToken);
    await storage.setRefreshToken(credentials.refreshToken);
    final meResult = await authRepository.getMe();
    return meResult.fold((_) => null, (me) => me);
  }
}
