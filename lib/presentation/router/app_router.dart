import 'package:bpmap_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:bpmap_app/presentation/bloc/auth/auth_state.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

/// Listenable that notifies when [AuthBloc] state changes, for GoRouter refresh.
class AuthRefreshListenable extends ChangeNotifier {
  AuthRefreshListenable(this._authBloc) {
    _subscription = _authBloc.stream.listen((_) {
      notifyListeners();
    });
  }

  final AuthBloc _authBloc;
  late final dynamic _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter createAppRouter(AuthBloc authBloc, Listenable refreshListenable) {
  return GoRouter(
    initialLocation: const SplashRoute().location,
    refreshListenable: refreshListenable,
    routes: $appRoutes,
    navigatorKey: _routerKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isSplash = state.uri.path == const SplashRoute().location;
      final isLoggingIn = state.uri.path == const LoginRoute().location;
      final authState = authBloc.state;

      switch (authState) {
        case AuthError():
          return const LoginRoute().location;
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
