import 'dart:async';

import 'package:bpmap_app/presentation/providers/loading_provider.dart';
import 'package:bpmap_app/presentation/providers/router_provider.dart';

import 'package:bpmap_app/shared/components/loading/loading_overlay.dart';
import 'package:bpmap_app/shared/components/alarm/alarm_floating_action_button.dart';
import 'package:bpmap_app/shared/providers/di_providers.dart';
import 'package:bpmap_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final isLoading = ref.watch(loadingProvider);
    final appConfig = ref.watch(appConfigProvider);

    return _AppScaffold(
      router: router,
      isLoading: isLoading,
      appName: appConfig.appName,
    );
  }
}

class _AppScaffold extends ConsumerStatefulWidget {
  const _AppScaffold({
    required this.router,
    required this.isLoading,
    required this.appName,
  });

  final GoRouter router;
  final bool isLoading;
  final String appName;

  @override
  ConsumerState<_AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends ConsumerState<_AppScaffold> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeNotifications();
      _initializeLocationService();
    });
  }

  Future<void> _initializeNotifications() async {
    try {
      final notificationService = ref.read(notificationServiceProvider);
      await notificationService.initialize();
      debugPrint('Notification service initialized');

      final notificationRepository = ref.read(notificationRepositoryProvider);
      final token = await notificationService.getToken();
      if (token != null && token.isNotEmpty) {
        await notificationRepository.subscribe(tokens: [token]);
      }
    } catch (e, stack) {
      debugPrint('Notification init/subscribe failed: $e');
      debugPrint(stack.toString());
    }
  }

  Future<void> _initializeLocationService() async {
    try {
      final locationService = ref.read(backgroundLocationServiceProvider);
      await locationService.initialize();
      await locationService.start();
      debugPrint('BackgroundLocationService initialized and started');
    } catch (e) {
      debugPrint('BackgroundLocationService init failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: widget.appName,
      theme: AppTheme.lightTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: widget.router,
      builder: (context, child) {
        return AlarmFloatingActionButton(
          child: LoadingOverlay(isLoading: widget.isLoading, child: child!),
        );
      },
    );
  }
}
