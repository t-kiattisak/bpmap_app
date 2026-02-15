import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:bpmap_app/shared/data/local/hive_service.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:bpmap_app/shared/domain/models/user_location.dart';

@pragma('vm:entry-point')
void headlessTask(bg.HeadlessEvent event) async {
  debugPrint('[BackgroundLocationService] HeadlessTask: $event');

  if (event.name == bg.Event.LOCATION) {
    bg.Location location = event.event;
    await BackgroundLocationService.saveLocationHeadless(location);
  }
}

class BackgroundLocationService {
  final HiveService _hiveService;
  static const String _locationBox = 'user_location';
  static const String _lastLocationKey = 'last_location';

  BackgroundLocationService(this._hiveService);

  Future<void> initialize() async {
    bg.BackgroundGeolocation.registerHeadlessTask(headlessTask);

    bg.BackgroundGeolocation.onLocation(_onLocation, _onLocationError);
    bg.BackgroundGeolocation.onMotionChange(_onMotionChange);
    bg.BackgroundGeolocation.onActivityChange(_onActivityChange);
    bg.BackgroundGeolocation.onProviderChange(_onProviderChange);
    bg.BackgroundGeolocation.onConnectivityChange(_onConnectivityChange);

    await bg.BackgroundGeolocation.ready(
      bg.Config(
        desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 50.0,
        stopOnTerminate: false,
        startOnBoot: true,
        debug: kDebugMode,
        logLevel: bg.Config.LOG_LEVEL_VERBOSE,
        reset: true,
        notification: bg.Notification(
          title: "Location Tracking",
          text: "Background location service is running",
        ),
      ),
    );
  }

  void _onLocation(bg.Location location) {
    debugPrint('[BackgroundLocationService] Location: $location');
    _saveLocation(location);
  }

  void _onLocationError(bg.LocationError error) {
    debugPrint('[BackgroundLocationService] Location Error: $error');
  }

  void _onMotionChange(bg.Location location) {
    debugPrint('[BackgroundLocationService] Motion Change: $location');
  }

  void _onActivityChange(bg.ActivityChangeEvent event) {
    debugPrint('[BackgroundLocationService] Activity Change: $event');
  }

  void _onProviderChange(bg.ProviderChangeEvent event) {
    debugPrint('[BackgroundLocationService] Provider Change: $event');
  }

  void _onConnectivityChange(bg.ConnectivityChangeEvent event) {
    debugPrint('[BackgroundLocationService] Connectivity Change: $event');
  }

  Future<void> _saveLocation(bg.Location location) async {
    try {
      final json = jsonEncode(location.toMap());
      await _hiveService.put<String>(_locationBox, _lastLocationKey, json);
      debugPrint('[BackgroundLocationService] Saved location to Hive');
    } catch (e) {
      debugPrint('[BackgroundLocationService] Failed to save location: $e');
    }
  }

  static Future<void> saveLocationHeadless(bg.Location location) async {
    try {
      final hiveService = HiveService();
      await hiveService.init();

      final json = jsonEncode(location.toMap());
      await hiveService.put<String>(_locationBox, _lastLocationKey, json);
      debugPrint('[BackgroundLocationService] Headless saved location to Hive');
    } catch (e) {
      debugPrint('[BackgroundLocationService] Headless failed to save: $e');
    }
  }

  Future<UserLocation?> getLastLocation() async {
    try {
      final json = await _hiveService.get<String>(
        _locationBox,
        _lastLocationKey,
      );
      if (json != null) {
        debugPrint(
          '[BackgroundLocationService] getLastLocation success: $json',
        );
        final map = jsonDecode(json) as Map<String, dynamic>;
        return UserLocation.fromMap(map);
      } else {
        debugPrint(
          '[BackgroundLocationService] getLastLocation: No location found in Hive',
        );
      }
    } catch (e) {
      debugPrint('[BackgroundLocationService] Failed to get last location: $e');
    }
    return null;
  }

  Future<void> start() async {
    await bg.BackgroundGeolocation.start();
  }

  Future<void> stop() async {
    await bg.BackgroundGeolocation.stop();
  }
}
