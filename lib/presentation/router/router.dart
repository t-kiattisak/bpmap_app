import 'package:bpmap_app/features/auth/presentation/pages/login_page.dart';
import 'package:bpmap_app/features/home/presentation/pages/home_page.dart';
import 'package:bpmap_app/features/home/presentation/pages/report_issue_page.dart';
import 'package:bpmap_app/features/incident/presentation/pages/incident_guideline_page.dart';
import 'package:bpmap_app/features/map/presentation/pages/map_class_data_page.dart';
import 'package:bpmap_app/features/map/presentation/pages/map_page.dart';
import 'package:bpmap_app/features/profile/presentation/pages/profile_page.dart';
import 'package:bpmap_app/features/splash/presentation/pages/splash_page.dart';
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
    TypedGoRoute<ReportRoute>(path: '/report'),
    TypedGoRoute<MapRoute>(path: '/map'),
    TypedGoRoute<ProfileRoute>(path: '/profile'),
  ],
)
class AppShellRoute extends ShellRouteData {
  const AppShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppShell(child: navigator);
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: const HomePage());
  }
}

class ReportRoute extends GoRouteData with $ReportRoute {
  const ReportRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: const ReportIssuePage());
  }
}

class MapRoute extends GoRouteData with $MapRoute {
  const MapRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: const MapPage());
  }
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: const ProfilePage());
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

@TypedGoRoute<IncidentGuidelineRoute>(path: '/incident-guideline/:id')
class IncidentGuidelineRoute extends GoRouteData with $IncidentGuidelineRoute {
  const IncidentGuidelineRoute({required this.id});

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideRightTransitionPage(
      key: state.pageKey,
      child: IncidentGuidelinePage(id: id),
    );
  }
}
