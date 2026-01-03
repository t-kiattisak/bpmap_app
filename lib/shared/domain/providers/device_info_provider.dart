import 'dart:io';

import 'package:bpmap_app/domain/entities/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info_provider.g.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<DeviceInfo> getDeviceInfo() async {
    String deviceId = '';
    String deviceType = '';

    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        deviceId = androidInfo.id;
        deviceType = 'android';
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? '';
        deviceType = 'ios';
      }
    } catch (e) {
      // Handle error or fallback
      // Ideally log the error
    }

    return DeviceInfo(deviceId: deviceId, deviceType: deviceType);
  }
}

@riverpod
DeviceInfoService deviceInfoService(Ref ref) {
  return DeviceInfoService();
}
