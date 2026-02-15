// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationSubscriptionModel _$NotificationSubscriptionModelFromJson(
  Map<String, dynamic> json,
) => _NotificationSubscriptionModel(
  status: (json['status'] as num).toInt(),
  message: json['message'] as String,
  data: Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationSubscriptionModelToJson(
  _NotificationSubscriptionModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
  successTokens: json['success_tokens'] as List<dynamic>,
  failureTokens: (json['failure_tokens'] as List<dynamic>)
      .map((e) => FailureToken.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
  'success_tokens': instance.successTokens,
  'failure_tokens': instance.failureTokens,
};

_FailureToken _$FailureTokenFromJson(Map<String, dynamic> json) =>
    _FailureToken(
      token: json['token'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$FailureTokenToJson(_FailureToken instance) =>
    <String, dynamic>{'token': instance.token, 'reason': instance.reason};
