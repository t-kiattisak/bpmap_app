import 'dart:async';
import 'dart:convert';

import 'package:alarm/alarm.dart';
import 'package:alarm/utils/alarm_set.dart';
import 'package:bpmap_app/features/auth/presentation/state/auth_state.dart';
import 'package:bpmap_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:bpmap_app/presentation/providers/loading_provider.dart';
import 'package:bpmap_app/presentation/providers/router_provider.dart';
import 'package:bpmap_app/presentation/router/app_router.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:bpmap_app/shared/components/loading/loading_overlay.dart';
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

class _AppScaffoldState extends ConsumerState<_AppScaffold>
    with WidgetsBindingObserver {
  AlarmSet? _lastRingingAlarms;
  StreamSubscription<AlarmSet>? _ringingSub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _ringingSub = Alarm.ringing.listen((alarmSet) {
      _lastRingingAlarms = alarmSet;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeNotifications();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    final authValue = ref.read(authProvider);
    if (authValue is! AsyncData || authValue.value is! AuthAuthenticated) return;
    final alarms = _lastRingingAlarms?.alarms;
    if (alarms == null || alarms.isEmpty) return;
    final first = alarms.first;
    final payload = first.payload;
    if (payload == null || payload.isEmpty) return;
    try {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      final id = data['alarm_id']?.toString() ?? 'unknown';
      rootNavigatorKey.currentContext
          ?.push(IncidentGuidelineRoute(id: id).location);
    } catch (_) {}
  }

  Future<void> _initializeNotifications() async {
    try {
      final gateway = ref.read(fcmGatewayProvider);
      final handleAlarm = ref.read(handleAlarmNotificationUseCaseProvider);
      final handleDefault = ref.read(handleDefaultNotificationUseCaseProvider);

      gateway.registerHandler('alarm', (msg, {openedFromNotification = false}) =>
          handleAlarm.execute(msg, openedFromNotification: openedFromNotification));
      gateway.registerHandler('default', (msg, {openedFromNotification = false}) =>
          handleDefault.execute(msg, openedFromNotification: openedFromNotification));

      await gateway.initialize();
      debugPrint('FCM gateway initialized');
      final notificationRepository = ref.read(notificationRepositoryProvider);
      final token = await gateway.getToken();
      if (token != null && token.isNotEmpty) {
        await notificationRepository.subscribe(tokens: [token]);
      }
    } catch (e, stack) {
      debugPrint('Notification init/subscribe failed: $e');
      debugPrint(stack.toString());
    }
  }

  @override
  void dispose() {
    _ringingSub?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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
        return LoadingOverlay(isLoading: widget.isLoading, child: child!);
      },
    );
  }
}
