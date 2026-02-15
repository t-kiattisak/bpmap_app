import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_location.freezed.dart';
part 'user_location.g.dart';

@freezed
abstract class UserLocation with _$UserLocation {
  const UserLocation._();

  const factory UserLocation({
    required double latitude,
    required double longitude,
    double? accuracy,
    double? altitude,
    double? speed,
    double? heading,
    DateTime? time,
  }) = _UserLocation;

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final coords = json['coords'] as Map<String, dynamic>?;

    if (coords != null) {
      return UserLocation(
        latitude: (coords['latitude'] as num).toDouble(),
        longitude: (coords['longitude'] as num).toDouble(),
        accuracy: (coords['accuracy'] as num?)?.toDouble(),
        altitude: (coords['altitude'] as num?)?.toDouble(),
        speed: (coords['speed'] as num?)?.toDouble(),
        heading: (coords['heading'] as num?)?.toDouble(),
        time: json['timestamp'] != null
            ? DateTime.tryParse(json['timestamp'].toString())
            : null,
      );
    }

    return UserLocation.fromJson(json);
  }
}
