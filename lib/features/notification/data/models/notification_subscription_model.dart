import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_subscription_model.freezed.dart';
part 'notification_subscription_model.g.dart';

@freezed
abstract class NotificationSubscriptionModel
    with _$NotificationSubscriptionModel {
  const factory NotificationSubscriptionModel({
    @JsonKey(name: "status") required int status,
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "data") required Data data,
  }) = _NotificationSubscriptionModel;

  factory NotificationSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationSubscriptionModelFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: "success_tokens") required List<dynamic> successTokens,
    @JsonKey(name: "failure_tokens") required List<FailureToken> failureTokens,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class FailureToken with _$FailureToken {
  const factory FailureToken({
    @JsonKey(name: "token") required String token,
    @JsonKey(name: "reason") required String reason,
  }) = _FailureToken;

  factory FailureToken.fromJson(Map<String, dynamic> json) =>
      _$FailureTokenFromJson(json);
}
