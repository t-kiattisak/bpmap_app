import 'package:bpmap_app/features/auth/presentation/state/auth_state.dart';
import 'package:bpmap_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:bpmap_app/presentation/router/app_router.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:bpmap_app/shared/domain/models/app_config.dart';
import 'package:bpmap_app/shared/providers/di_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final authNotifier = ValueNotifier<AsyncValue<AuthState>>(
    const AsyncLoading<AuthState>(),
  );
  ref.onDispose(authNotifier.dispose);

  ref.listen<AsyncValue<AuthState>>(authProvider, (prev, next) {
    authNotifier.value = next;
  });

  final appConfig = ref.watch(appConfigProvider);
  final router = GoRouter(
    initialLocation: const SplashRoute().location,
    refreshListenable: authNotifier,
    routes: $appRoutes,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: appConfig.environment == Environment.dev,
    redirect: (context, state) {
      final isSplash = state.uri.path == const SplashRoute().location;
      final isLoggingIn = state.uri.path == const LoginRoute().location;
      final authValue = authNotifier.value;

      if (authValue is AsyncError<AuthState>) {
        return isLoggingIn ? null : const LoginRoute().location;
      }
      if (authValue is AsyncLoading<AuthState>) {
        return isLoggingIn ? null : const SplashRoute().location;
      }
      if (authValue is AsyncData<AuthState>) {
        final value = authValue.value;
        switch (value) {
          case AuthError():
            return isLoggingIn ? null : const LoginRoute().location;
          case AuthInitial():
          case AuthLoading():
            return null;
          case AuthAuthenticated():
            return (isSplash || isLoggingIn) ? const HomeRoute().location : null;
          case AuthUnauthenticated():
            return isLoggingIn ? null : const LoginRoute().location;
        }
      }
      return null;
    },
  );
  ref.onDispose(router.dispose);
  return router;
}
