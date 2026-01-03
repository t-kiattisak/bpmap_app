import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info.freezed.dart';

@freezed
abstract class DeviceInfo with _$DeviceInfo {
  const factory DeviceInfo({
    required String deviceId,
    required String deviceType,
  }) = _DeviceInfo;
}
