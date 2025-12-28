import 'package:bpmap_app/shared/domain/providers/app_config_provider.dart';
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

    return MaterialApp.router(
      title: config.appName,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
