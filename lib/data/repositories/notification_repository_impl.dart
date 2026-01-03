import 'package:bpmap_app/data/datasources/notification_remote_datasource.dart';
import 'package:bpmap_app/domain/repositories/notification_repository.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';
import 'package:bpmap_app/data/models/notification_subscription_model.dart';

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
