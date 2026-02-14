import 'package:bpmap_app/shared/di/di.dart';
import 'package:bpmap_app/domain/repositories/auth_repository.dart';
import 'package:bpmap_app/domain/repositories/notification_repository.dart';
import 'package:bpmap_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:bpmap_app/shared/data/local/storage_service.dart';
import 'package:bpmap_app/shared/domain/models/app_config.dart';
import 'package:bpmap_app/shared/services/device_info_service.dart';
import 'package:bpmap_app/shared/services/notification_service.dart';
import 'package:bpmap_app/presentation/bloc/auth/auth_event.dart';
import 'package:bpmap_app/presentation/cubit/loading_cubit.dart';
import 'package:bpmap_app/presentation/router/app_router.dart';
import 'package:bpmap_app/shared/components/loading/loading_overlay.dart';
import 'package:bpmap_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppWithBloc extends StatefulWidget {
  const AppWithBloc({super.key});

  @override
  State<AppWithBloc> createState() => _AppWithBlocState();
}

class _AppWithBlocState extends State<AppWithBloc> {
  late final AuthBloc _authBloc;
  late final LoadingCubit _loadingCubit;
  late final AuthRefreshListenable _authRefreshListenable;
  late final GoRouter _router;
  late final AppConfig _appConfig;

  @override
  void initState() {
    super.initState();
    final authRepository = getIt<AuthRepository>();
    final storage = getIt<StorageService>();
    final deviceInfoService = getIt<DeviceInfoService>();
    final notificationService = getIt<NotificationService>();
    _appConfig = getIt<AppConfig>();

    _authBloc = AuthBloc(
      authRepository: authRepository,
      storage: storage,
      deviceInfoService: deviceInfoService,
      notificationService: notificationService,
      appConfig: _appConfig,
    )..add(const AuthStarted());

    _loadingCubit = LoadingCubit();
    _authRefreshListenable = AuthRefreshListenable(_authBloc);
    _router = createAppRouter(
      _authBloc,
      _authRefreshListenable,
      debugLogDiagnostics: _appConfig.environment == Environment.dev,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => _subscribeToNotifications());
  }

  Future<void> _subscribeToNotifications() async {
    try {
      final token = await getIt<NotificationService>().getToken();
      if (token != null && token.isNotEmpty) {
        await getIt<NotificationRepository>().subscribe(tokens: [token]);
      }
    } catch (e, stack) {
      debugPrint('Subscribe to notifications failed: $e');
      debugPrint(stack.toString());
    }
  }

  @override
  void dispose() {
    _authRefreshListenable.dispose();
    _router.dispose();
    _authBloc.close();
    _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(value: _authBloc),
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
      ],
      child: MaterialApp.router(
        title: _appConfig.appName,
        theme: AppTheme.lightTheme.copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
        routerConfig: _router,
        builder: (context, child) {
          return BlocBuilder<LoadingCubit, bool>(
            bloc: _loadingCubit,
            buildWhen: (prev, next) => prev != next,
            builder: (context, isLoading) {
              return LoadingOverlay(isLoading: isLoading, child: child!);
            },
          );
        },
      ),
    );
  }
}
