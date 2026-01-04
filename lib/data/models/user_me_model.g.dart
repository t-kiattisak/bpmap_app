// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_me_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMeModel _$UserMeModelFromJson(Map<String, dynamic> json) => _UserMeModel(
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : UserData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserMeModelToJson(_UserMeModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  id: json['id'] as String?,
  email: json['email'] as String?,
  displayName: json['display_name'] as String?,
  role: json['role'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  socialAccounts: (json['social_accounts'] as List<dynamic>?)
      ?.map((e) => SocialAccount.fromJson(e as Map<String, dynamic>))
      .toList(),
  devices: (json['devices'] as List<dynamic>?)
      ?.map((e) => Device.fromJson(e as Map<String, dynamic>))
      .toList(),
  sessions: (json['sessions'] as List<dynamic>?)
      ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'display_name': instance.displayName,
  'role': instance.role,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'social_accounts': instance.socialAccounts,
  'devices': instance.devices,
  'sessions': instance.sessions,
};

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
  pushToken: json['push_token'] as String?,
  provider: json['provider'] as String?,
  deviceType: json['device_type'] as String?,
  lastSeen: json['last_seen'] == null
      ? null
      : DateTime.parse(json['last_seen'] as String),
);

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'push_token': instance.pushToken,
  'provider': instance.provider,
  'device_type': instance.deviceType,
  'last_seen': instance.lastSeen?.toIso8601String(),
};

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
  refreshToken: json['refresh_token'] as String?,
  deviceId: json['device_id'] as String?,
  expiresAt: json['expires_at'] == null
      ? null
      : DateTime.parse(json['expires_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'refresh_token': instance.refreshToken,
  'device_id': instance.deviceId,
  'expires_at': instance.expiresAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
};

_SocialAccount _$SocialAccountFromJson(Map<String, dynamic> json) =>
    _SocialAccount(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      provider: json['provider'] as String?,
      providerId: json['provider_id'] as String?,
    );

Map<String, dynamic> _$SocialAccountToJson(_SocialAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'provider': instance.provider,
      'provider_id': instance.providerId,
    };
