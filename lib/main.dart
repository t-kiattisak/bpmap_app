import 'package:bpmap_app/presentation/providers/notification_backend_provider.dart';
import 'package:bpmap_app/shared/components/loading/loading_overlay.dart';
import 'package:bpmap_app/shared/domain/providers/app_config_provider.dart';
import 'package:bpmap_app/shared/domain/providers/loading_provider.dart';
import 'package:bpmap_app/presentation/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bpmap_app/shared/theme/app_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(appConfigProvider);
    final router = ref.watch(routerProvider);
    ref.watch(subscribeToNotificationsProvider);

    final isLoading = ref.watch(loadingServiceProvider);

    return MaterialApp.router(
      title: config.appName,
      theme: AppTheme.lightTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: router,
      builder: (context, child) {
        return LoadingOverlay(isLoading: isLoading, child: child);
      },
    );
  }
}
