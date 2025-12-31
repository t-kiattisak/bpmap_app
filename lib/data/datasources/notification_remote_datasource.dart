import 'package:bpmap_app/data/models/notification_subscription_model.dart';
import 'package:bpmap_app/shared/data/remote/network_service.dart';
import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';

abstract class NotificationRemoteDataSource {
  Future<Either<AppException, NotificationSubscriptionModel>> subscribe({
    required List<String> tokens,
  });
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final NetworkService _networkService;

  NotificationRemoteDataSourceImpl(this._networkService);

  @override
  Future<Either<AppException, NotificationSubscriptionModel>> subscribe({
    required List<String> tokens,
  }) async {
    final response = await _networkService.post(
      '/api/notifications/subscribe',
      data: {'tokens': tokens},
    );

    return response.fold((exception) => Left(exception), (response) {
      try {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return Right(NotificationSubscriptionModel.fromJson(data));
        }
        return Left(
          AppException(
            message: 'Invalid response format',
            statusCode: 0,
            identifier: 'NotificationRemoteDataSourceImpl.subscribe',
          ),
        );
      } catch (e) {
        return Left(
          AppException(
            message: 'Failed to parse response: $e',
            statusCode: 0,
            identifier: 'NotificationRemoteDataSourceImpl.subscribe',
          ),
        );
      }
    });
  }
}
