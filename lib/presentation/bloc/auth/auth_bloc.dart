import 'dart:developer';

import 'package:bpmap_app/data/models/user_me_model.dart';
import 'package:bpmap_app/domain/entities/auth_credentials.dart';
import 'package:bpmap_app/domain/repositories/auth_repository.dart';
import 'package:bpmap_app/presentation/bloc/auth/auth_event.dart';
import 'package:bpmap_app/presentation/bloc/auth/auth_state.dart';
import 'package:bpmap_app/shared/data/local/storage_service.dart';
import 'package:bpmap_app/shared/domain/models/app_config.dart';
import 'package:bpmap_app/shared/services/device_info_service.dart';
import 'package:bpmap_app/shared/services/notification_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
    required StorageService storage,
    required DeviceInfoService deviceInfoService,
    required NotificationService notificationService,
    required AppConfig appConfig,
  }) : _authRepository = authRepository,
       _storage = storage,
       _deviceInfoService = deviceInfoService,
       _notificationService = notificationService,
       _appConfig = appConfig,
       super(const AuthInitial()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthLogin>(_onAuthLogin);
    on<AuthLogout>(_onAuthLogout);
    on<AuthGoogleLogin>(_onAuthGoogleLogin);
    on<AuthLineLogin>(_onAuthLineLogin);
  }

  final AuthRepository _authRepository;
  final StorageService _storage;
  final DeviceInfoService _deviceInfoService;
  final NotificationService _notificationService;
  final AppConfig _appConfig;

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final accessToken = await _storage.getAccessToken();
    final refreshToken = await _storage.getRefreshToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      final result = await _authRepository.getMe();

      await result.fold(
        (error) async {
          log('Auto-login failed: $error');
          if (error.statusCode == 401) {
            await _storage.clearAll();
          }
          emit(const AuthUnauthenticated());
        },
        (user) async {
          final credentials = AuthCredentials(
            accessToken: accessToken,
            refreshToken: refreshToken ?? '',
          );
          emit(AuthAuthenticated(credentials: credentials, userMe: user));
        },
      );
    } else {
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final deviceInfo = await _deviceInfoService.getDeviceInfo();
    final fcmToken = await _notificationService.getToken() ?? '';

    final result = await _authRepository.login(
      username: event.username,
      password: event.password,
      deviceId: deviceInfo.deviceId,
      deviceType: deviceInfo.deviceType,
      pushToken: fcmToken,
    );

    await result.fold(
      (error) async {
        emit(AuthError(error.toString()));
      },
      (credentials) async {
        await _storage.setAccessToken(credentials.accessToken);
        await _storage.setRefreshToken(credentials.refreshToken);
        final meResult = await _authRepository.getMe();
        UserMeModel? userMe;
        meResult.fold((_) => null, (me) => userMe = me);
        emit(AuthAuthenticated(credentials: credentials, userMe: userMe));
      },
    );
  }

  Future<void> _onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
    await _storage.clearAll();
    emit(const AuthUnauthenticated());
  }

  Future<void> _onAuthGoogleLogin(
    AuthGoogleLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId: _appConfig.googleServerClientId,
      );
      final GoogleSignIn signIn = GoogleSignIn.instance;
      final GoogleSignInAccount googleUser = await signIn.authenticate();
      final googleAuth = googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        emit(const AuthError('Google Sign-In failed: No ID Token'));
        return;
      }

      final deviceInfo = await _deviceInfoService.getDeviceInfo();
      final fcmToken = await _notificationService.getToken() ?? '';

      final result = await _authRepository.googleLogin(
        idToken: idToken,
        deviceId: deviceInfo.deviceId,
        deviceType: deviceInfo.deviceType,
        pushToken: fcmToken,
      );

      await result.fold(
        (error) async {
          emit(AuthError(error.toString()));
        },
        (credentials) async {
          await _storage.setAccessToken(credentials.accessToken);
          await _storage.setRefreshToken(credentials.refreshToken);
          final meResult = await _authRepository.getMe();
          UserMeModel? userMe;
          meResult.fold((_) => null, (me) => userMe = me);
          emit(AuthAuthenticated(credentials: credentials, userMe: userMe));
        },
      );
    } catch (e, _) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onAuthLineLogin(
    AuthLineLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await LineSDK.instance.setup(_appConfig.lineChannelId);
      final result = await LineSDK.instance.login(
        scopes: ['profile', 'openid', 'email'],
      );
      final idToken = result.accessToken.idTokenRaw;
      if (idToken == null) {
        emit(const AuthError('Line Sign-In failed: No ID Token'));
        return;
      }

      final deviceInfo = await _deviceInfoService.getDeviceInfo();
      final fcmToken = await _notificationService.getToken() ?? '';

      final authResult = await _authRepository.lineLogin(
        accessToken: idToken,
        deviceId: deviceInfo.deviceId,
        deviceType: deviceInfo.deviceType,
        pushToken: fcmToken,
      );

      await authResult.fold(
        (error) async {
          emit(AuthError(error.toString()));
        },
        (credentials) async {
          await _storage.setAccessToken(credentials.accessToken);
          await _storage.setRefreshToken(credentials.refreshToken);
          final meResult = await _authRepository.getMe();
          UserMeModel? userMe;
          meResult.fold((_) => null, (me) => userMe = me);
          emit(AuthAuthenticated(credentials: credentials, userMe: userMe));
        },
      );
    } catch (e, _) {
      emit(AuthError(e.toString()));
    }
  }
}
