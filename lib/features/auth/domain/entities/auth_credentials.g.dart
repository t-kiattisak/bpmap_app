// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthCredentials _$AuthCredentialsFromJson(Map<String, dynamic> json) =>
    _AuthCredentials(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$AuthCredentialsToJson(_AuthCredentials instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
