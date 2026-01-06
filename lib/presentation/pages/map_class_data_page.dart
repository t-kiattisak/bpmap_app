import 'package:bpmap_app/presentation/widgets/maps/layer_filter_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MapClassDataPage extends HookWidget {
  const MapClassDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = useState<List<LayerGroup>>([
      const LayerGroup(
        title: 'ข้อมูลพื้นฐาน',
        items: [
          LayerItem(id: 'building_map', label: 'แผนที่อาสาร'),
          LayerItem(
            id: 'municipality',
            label: 'ขอบเขตเทศบาล (กรมโยธาธิการและผังเมือง)',
          ),
          LayerItem(id: 'fire_alert', label: 'การประกาศดับไฟ'),
          LayerItem(
            id: 'mea_meter',
            label: 'ข้อมูลตำแหน่งเครื่องวัดไฟฟ้า (กฟน.)',
          ),
          LayerItem(id: 'mea_building', label: 'ข้อมูลขอบเขตอาคาร (กฟน.)'),
          LayerItem(
            id: 'pea_meter',
            label: 'ข้อมูลตำแหน่งเครื่องวัดไฟฟ้า (กฟภ.)',
          ),
          LayerItem(id: 'gistda_roof', label: 'ตำแหน่งหลังคาเรือน (GISTDA)'),
          LayerItem(id: 'village', label: 'หมู่บ้าน'),
          LayerItem(id: 'municipality_border', label: 'ขอบเขตเทศบาลเมือง'),
        ],
      ),
      const LayerGroup(
        title: 'ด้านภัยพิบัติ',
        items: [
          LayerItem(
            id: 'flood_risk_jun_66',
            label: 'ข้อมูลพื้นที่เสี่ยงอุทกภัย (มิ.ย. 66)',
          ),
          LayerItem(
            id: 'flood_risk_may_66',
            label: 'ข้อมูลพื้นที่เสี่ยงอุทกภัย (พ.ค. 66)',
          ),
        ],
      ),
    ]);

    void onLayerToggle(String layerId, bool isSelected) {
      final newGroups = groups.value.map((group) {
        final newItems = group.items.map((item) {
          if (item.id == layerId) {
            return LayerItem(
              id: item.id,
              label: item.label,
              isSelected: isSelected,
            );
          }
          return item;
        }).toList();
        return LayerGroup(title: group.title, items: newItems);
      }).toList();
      groups.value = newGroups;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ชั้นข้อมูลที่แสดง',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayerFilterPanel(
          groups: groups.value,
          onLayerToggle: onLayerToggle,
        ),
      ),
    );
  }
}
