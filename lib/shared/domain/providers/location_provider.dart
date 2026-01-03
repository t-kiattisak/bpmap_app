import 'package:bpmap_app/shared/services/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

@riverpod
LocationService locationService(Ref ref) {
  return LocationService();
}
