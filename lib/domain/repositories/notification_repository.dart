import 'package:bpmap_app/shared/domain/models/either.dart';
import 'package:bpmap_app/shared/exceptions/http_exception.dart';
import 'package:bpmap_app/data/models/notification_subscription_model.dart';

abstract class NotificationRepository {
  Future<Either<AppException, NotificationSubscriptionModel>> subscribe({
    required List<String> tokens,
  });
}
