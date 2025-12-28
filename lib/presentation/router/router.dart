import 'package:bpmap_app/presentation/pages/home_page.dart';
import 'package:bpmap_app/presentation/pages/login_page.dart';
import 'package:bpmap_app/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  String get location => $SplashRouteExtension(this).location;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  String get location => $LoginRouteExtension(this).location;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  String get location => $HomeRouteExtension(this).location;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyHomePage(title: 'BP Map');
  }
}
