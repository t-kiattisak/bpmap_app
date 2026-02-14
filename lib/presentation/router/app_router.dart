import 'dart:async';

import 'package:bpmap_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bpmap_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');

enum _RedirectCategory { splash, authenticated, unauthenticated }

class AuthRefreshListenable extends ChangeNotifier {
  AuthRefreshListenable(this._authBloc) {
    var prevCategory = _redirectCategory(_authBloc.state);
    _subscription = _authBloc.stream.listen((state) {
      final category = _redirectCategory(state);
      if (category != prevCategory) {
        prevCategory = category;
        notifyListeners();
      }
    });
  }

  static _RedirectCategory _redirectCategory(AuthState state) {
    return switch (state) {
      AuthInitial() || AuthLoading() => _RedirectCategory.splash,
      AuthAuthenticated() => _RedirectCategory.authenticated,
      AuthUnauthenticated() || AuthError() => _RedirectCategory.unauthenticated,
    };
  }

  final AuthBloc _authBloc;
  late final StreamSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter createAppRouter(
  AuthBloc authBloc,
  Listenable refreshListenable, {
  bool debugLogDiagnostics = false,
}) {
  return GoRouter(
    initialLocation: const SplashRoute().location,
    refreshListenable: refreshListenable,
    routes: $appRoutes,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: debugLogDiagnostics,
    redirect: (context, state) {
      final isSplash = state.uri.path == const SplashRoute().location;
      final isLoggingIn = state.uri.path == const LoginRoute().location;
      final authState = authBloc.state;

      switch (authState) {
        case AuthError():
          if (!isLoggingIn) return const LoginRoute().location;
          return null;
        case AuthInitial():
        case AuthLoading():
          if (isLoggingIn) return null;
          return const SplashRoute().location;
        case AuthAuthenticated():
          if (isSplash || isLoggingIn) return const HomeRoute().location;
          return null;
        case AuthUnauthenticated():
          if (!isLoggingIn) return const LoginRoute().location;
          return null;
      }
    },
  );
}
