import 'package:bpmap_app/shared/components/maps/map_controls.dart';
import 'package:bpmap_app/shared/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';

class Map extends HookWidget {
  final LatLng initialCenter;
  final double initialZoom;
  final List<Marker> markers;
  final List<Polygon> polygons;
  final MapController? mapController;
  final PopupController? popupController;
  final Widget Function(BuildContext, Marker)? popupBuilder;
  /// If provided, used to wrap async work (e.g. loading overlay). From [loadingProvider.notifier].wrap.
  final Future<T> Function<T>(Future<T> Function())? wrapLoading;
  final LocationService locationService;

  const Map({
    super.key,
    this.initialCenter = const LatLng(13.7563, 100.5018), // Bangkok default
    this.initialZoom = 13.0,
    this.markers = const [],
    this.polygons = const [],
    this.mapController,
    this.popupController,
    this.popupBuilder,
    this.wrapLoading,
    required this.locationService,
  });

  @override
  Widget build(BuildContext context) {
    final MapController controller =
        mapController ?? useMemoized(() => MapController());
    final currentZoom = useState(initialZoom);

    final locationService = this.locationService;

    final PopupController popController =
        popupController ?? useMemoized(() => PopupController());

    void onVersions(MapCamera position, bool hasGesture) {
      currentZoom.value = position.zoom;
    }

    Future<void> _getCurrentLocation() async {
      final run = wrapLoading ?? (f) => f();
      await run(() async {
        final position = await locationService.getCurrentLocation();
        if (position != null) {
          controller.move(LatLng(position.latitude, position.longitude), 15.0);
          currentZoom.value = 15.0;
        }
      });
    }

    return Stack(
      children: [
        FlutterMap(
          mapController: controller,
          options: MapOptions(
            keepAlive: true,
            initialCenter: initialCenter,
            initialZoom: initialZoom,
            onPositionChanged: onVersions,
            onTap: (_, __) => popController.hideAllPopups(),
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.bpmap.disaster',
              tileProvider: CancellableNetworkTileProvider(),
            ),
            if (polygons.isNotEmpty) PolygonLayer(polygons: polygons),
            if (markers.isNotEmpty)
              popupBuilder != null
                  ? PopupMarkerLayer(
                      options: PopupMarkerLayerOptions(
                        popupController: popController,
                        markers: markers,
                        popupDisplayOptions: PopupDisplayOptions(
                          builder: (BuildContext context, Marker marker) =>
                              popupBuilder!(context, marker),
                        ),
                      ),
                    )
                  : MarkerLayer(markers: markers),
          ],
        ),
        Positioned(
          bottom: 80,
          left: 8,
          child: MapControls(
            onCurrentLocation: _getCurrentLocation,
            onZoomIn: () {
              final newZoom = currentZoom.value + 1;
              controller.move(controller.camera.center, newZoom);
              currentZoom.value = newZoom;
            },
            onZoomOut: () {
              final newZoom = currentZoom.value - 1;
              controller.move(controller.camera.center, newZoom);
              currentZoom.value = newZoom;
            },
          ),
        ),
      ],
    );
  }
}
