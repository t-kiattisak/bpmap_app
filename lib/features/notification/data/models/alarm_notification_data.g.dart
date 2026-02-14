// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlarmNotificationData _$AlarmNotificationDataFromJson(
  Map<String, dynamic> json,
) => _AlarmNotificationData(
  urgency: json['urgency'] as String?,
  center: json['center'] == null
      ? null
      : AlarmCenter.fromJson(json['center'] as Map<String, dynamic>),
  alarmId: json['alarm_id'] as String?,
  type: json['type'] as String?,
  signal: json['signal'] as String?,
  content: json['content'] as String?,
);

Map<String, dynamic> _$AlarmNotificationDataToJson(
  _AlarmNotificationData instance,
) => <String, dynamic>{
  'urgency': instance.urgency,
  'center': instance.center,
  'alarm_id': instance.alarmId,
  'type': instance.type,
  'signal': instance.signal,
  'content': instance.content,
};

_AlarmCenter _$AlarmCenterFromJson(Map<String, dynamic> json) => _AlarmCenter(
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  radius: json['radius'] as num?,
);

Map<String, dynamic> _$AlarmCenterToJson(_AlarmCenter instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'radius': instance.radius,
    };
