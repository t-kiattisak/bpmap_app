import 'package:bpmap_app/presentation/pages/home_page.dart';
import 'package:bpmap_app/presentation/pages/login_page.dart';
import 'package:bpmap_app/presentation/pages/map_class_data_page.dart';
import 'package:bpmap_app/presentation/pages/map_page.dart';
import 'package:bpmap_app/presentation/pages/splash_page.dart';
import 'package:bpmap_app/presentation/widgets/maps/map_search_bar.dart';
import 'package:bpmap_app/shared/components/layouts/app_shell.dart';
import 'package:bpmap_app/shared/utility/page_transitions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedShellRoute<AppShellRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/'),
    TypedGoRoute<MapRoute>(path: '/map'),
  ],
)
class AppShellRoute extends ShellRouteData {
  const AppShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    List<Widget> _getTitle(String routeLocation) {
      switch (routeLocation) {
        case '/':
          return [];
        case '/map':
          return [const Expanded(child: MapSearchBar())];
        default:
          return [];
      }
    }

    return AppShell(child: navigator, title: _getTitle(state.matchedLocation));
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class MapRoute extends GoRouteData with $MapRoute {
  const MapRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MapPage();
  }
}

@TypedGoRoute<MapClassDataRoute>(path: '/map-class-data')
class MapClassDataRoute extends GoRouteData with $MapClassDataRoute {
  const MapClassDataRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideRightTransitionPage(
      key: state.pageKey,
      child: const MapClassDataPage(),
    );
  }
}
