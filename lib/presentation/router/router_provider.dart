import 'package:bpmap_app/domain/entities/auth_credentials.dart';
import 'package:bpmap_app/presentation/providers/auth_provider.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

final _routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
GoRouter router(RouterRef ref) {
  // Use GlobalKey<NavigatorState> if you need to access NavigatorState without context
  // final rootNavigatorKey = GlobalKey<NavigatorState>();

  final auth = ValueNotifier<AsyncValue<AuthCredentials>>(
    const AsyncLoading<AuthCredentials>(),
  );

  ref.onDispose(auth.dispose);

  ref.listen<AsyncValue<AuthCredentials>>(loginControllerProvider, (
    previous,
    next,
  ) {
    auth.value = next;
  });

  final router = GoRouter(
    initialLocation: SplashRoute().location,
    refreshListenable: auth,
    routes: $appRoutes,
    navigatorKey: _routerKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isSplash = state.uri.path == const SplashRoute().location;
      final isLoggingIn = state.uri.path == const LoginRoute().location;

      switch (auth.value) {
        case AsyncError():
          return const LoginRoute().location;
        case AsyncLoading():
          return const SplashRoute().location;
        case AsyncData(:final value):
          {
            if (value.isLogin) {
              if (isSplash || isLoggingIn) return const HomeRoute().location;
            } else {
              if (!isLoggingIn) return const LoginRoute().location;
            }
            return null;
          }
      }
      return null;
    },
  );
  ref.onDispose(router.dispose);

  return router;
}
