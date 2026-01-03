import 'package:bpmap_app/data/models/notification_subscription_model.dart';
import 'package:bpmap_app/presentation/providers/notification_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bpmap_app/data/datasources/notification_remote_datasource.dart';
import 'package:bpmap_app/data/repositories/notification_repository_impl.dart';
import 'package:bpmap_app/domain/repositories/notification_repository.dart';
import 'package:bpmap_app/shared/domain/providers/network_provider.dart';

part 'notification_backend_provider.g.dart';

@riverpod
NotificationRemoteDataSource notificationRemoteDataSource(Ref ref) {
  final networkService = ref.watch(networkProvider);
  return NotificationRemoteDataSourceImpl(networkService);
}

@riverpod
NotificationRepository notificationRepository(Ref ref) {
  final remoteDataSource = ref.watch(notificationRemoteDataSourceProvider);
  return NotificationRepositoryImpl(remoteDataSource);
}

@riverpod
Future<NotificationSubscriptionModel> subscribeToNotifications(Ref ref) async {
  final repository = ref.watch(notificationRepositoryProvider);
  final token = await ref.read(notificationServiceProvider).getToken();
  if (token == null) {
    throw Exception('Failed to get FCM token');
  }
  final result = await repository.subscribe(tokens: [token]);
  return result.fold((error) => throw error, (success) => success);
}
