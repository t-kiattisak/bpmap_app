import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_notification_data.freezed.dart';
part 'alarm_notification_data.g.dart';

/// Payload ของการแจ้งเตือนประเภท alarm จาก FCM (message.data)
@freezed
abstract class AlarmNotificationData with _$AlarmNotificationData {
  const factory AlarmNotificationData({
    @JsonKey(name: 'urgency') String? urgency,
    @JsonKey(name: 'center') AlarmCenter? center,
    @JsonKey(name: 'alarm_id') String? alarmId,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'signal') String? signal,
    @JsonKey(name: 'content') String? content,
  }) = _AlarmNotificationData;

  factory AlarmNotificationData.fromJson(Map<String, dynamic> json) =>
      _$AlarmNotificationDataFromJson(json);

  /// สร้างจาก FCM message.data (ค่าเป็น String ได้; center อาจเป็น JSON string)
  factory AlarmNotificationData.fromMessageData(Map<String, dynamic> data) {
    AlarmCenter? center;
    final centerRaw = data['center'];
    if (centerRaw != null) {
      if (centerRaw is Map<String, dynamic>) {
        center = AlarmCenter.fromJson(centerRaw);
      } else if (centerRaw is String) {
        try {
          final decoded = jsonDecode(centerRaw) as Map<String, dynamic>;
          center = AlarmCenter.fromJson(decoded);
        } catch (_) {
          center = null;
        }
      }
    }
    return AlarmNotificationData(
      urgency: data['urgency']?.toString(),
      center: center,
      alarmId: data['alarm_id']?.toString(),
      type: data['type']?.toString(),
      signal: data['signal']?.toString(),
      content: data['content']?.toString(),
    );
  }
}

@freezed
abstract class AlarmCenter with _$AlarmCenter {
  const factory AlarmCenter({
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'lng') double? lng,
    @JsonKey(name: 'radius') num? radius,
  }) = _AlarmCenter;

  factory AlarmCenter.fromJson(Map<String, dynamic> json) =>
      _$AlarmCenterFromJson(json);
}
