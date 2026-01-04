import 'package:bpmap_app/presentation/widgets/maps/map_search_bar.dart';
import 'package:bpmap_app/shared/components/layouts/main_layout.dart';
import 'package:bpmap_app/shared/components/maps/label_marker.dart';
import 'package:bpmap_app/shared/components/maps/map.dart';
import 'package:bpmap_app/presentation/widgets/maps/map_layer_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final layers = useState<List<MapLayer>>([
      const MapLayer(id: '1', name: 'ภาพดาวเทียมไทยโชต (THEOS)'),
      const MapLayer(
        id: '2',
        name:
            'สถานีตรวจวัดคุณภาพอากาศ\nจากกรมควบคุมมลพิษ (ราย\nวันเฉลี่ย 24 ชั่วโมง)',
      ),
      const MapLayer(
        id: '3',
        name:
            'สถานีตรวจวัดคุณภาพอากาศ\nจากกรมควบคุมมลพิษ (ราย\nวันเฉลี่ย 24 ชั่วโมง)',
      ),
      const MapLayer(
        id: '4',
        name:
            'สถานีตรวจวัดคุณภาพอากาศ\nจากกรมควบคุมมลพิษ (ราย\nวันเฉลี่ย 24 ชั่วโมง)',
      ),
      const MapLayer(
        id: '5',
        name:
            'สถานีตรวจวัดคุณภาพอากาศ\nจากกรมควบคุมมลพิษ (ราย\nวันเฉลี่ย 24 ชั่วโมง)',
      ),
    ]);

    final markersData = [
      (
        point: const LatLng(13.7563, 100.5018),
        color: Colors.blue,
        data: {
          'score': '23',
          'title': 'ระดับความล่อแหลม (ก่อน/หลัง)',
          'items': [
            '1. ภัย : 23(22)',
            '2. เศรษฐกิจ : 10(8)',
            '3. การศึกษา : 20(3)',
          ],
        },
      ),
      (
        point: const LatLng(13.7663, 100.5118),
        color: Colors.red,
        data: {
          'score': '30',
          'title': 'ระดับความล่อแหลม (ก่อน/หลัง)',
          'items': [
            '1. ภัย : 30(25)',
            '2. เศรษฐกิจ : 15(12)',
            '3. การศึกษา : 10(5)',
          ],
        },
      ),
      (
        point: const LatLng(13.7463, 100.4918),
        color: Colors.green,
        data: {
          'score': '10',
          'title': 'ระดับความล่อแหลม (ก่อน/หลัง)',
          'items': [
            '1. ภัย : 10(5)',
            '2. เศรษฐกิจ : 20(18)',
            '3. การศึกษา : 25(22)',
          ],
        },
      ),
    ];

    final markers = markersData
        .map(
          (item) => Marker(
            point: item.point,
            width: 80,
            height: 60,
            child: LabelMarker(label: '${item.data['score']}'),
          ),
        )
        .toList();

    final map = Map(
      initialCenter: const LatLng(13.7563, 100.5018),
      initialZoom: 13.0,
      markers: markers,
      polygons: const [],
      popupBuilder: (context, marker) {
        final data = markersData.firstWhere(
          (element) => element.point == marker.point,
          orElse: () => markersData.first,
        );
        final info = data.data;

        return GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info['title'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...(info['items'] as List<String>).map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF34495E),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return MainLayout(
      title: [const Expanded(child: MapSearchBar())],
      child: Stack(
        children: [
          map,
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: MapLayerPanel(
                    layers: layers.value,
                    onDelete: (layer) {
                      final newLayers = List<MapLayer>.from(layers.value);
                      newLayers.remove(layer);
                      layers.value = newLayers;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
