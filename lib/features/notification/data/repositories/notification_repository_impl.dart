import 'package:bpmap_app/features/notification/data/datasources/notification_remote_datasource.dart';
import 'package:bpmap_app/features/notification/data/models/notification_subscription_model.dart';
import 'package:bpmap_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppException, NotificationSubscriptionModel>> subscribe({
    required List<String> tokens,
  }) async {
    final result = await _remoteDataSource.subscribe(tokens: tokens);
    return result.fold((exception) => Left(exception), (model) => Right(model));
  }
}
