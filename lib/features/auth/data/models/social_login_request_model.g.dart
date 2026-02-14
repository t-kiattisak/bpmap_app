// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialLoginRequestModel _$SocialLoginRequestModelFromJson(
  Map<String, dynamic> json,
) => _SocialLoginRequestModel(
  provider: json['provider'] as String,
  accessToken: json['access_token'] as String,
  deviceId: json['device_id'] as String,
  deviceType: json['device_type'] as String,
  pushToken: json['push_token'] as String,
);

Map<String, dynamic> _$SocialLoginRequestModelToJson(
  _SocialLoginRequestModel instance,
) => <String, dynamic>{
  'provider': instance.provider,
  'access_token': instance.accessToken,
  'device_id': instance.deviceId,
  'device_type': instance.deviceType,
  'push_token': instance.pushToken,
};
