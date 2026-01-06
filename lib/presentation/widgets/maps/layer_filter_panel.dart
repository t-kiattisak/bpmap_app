import 'package:bpmap_app/shared/components/selection/expansion_checkbox_list.dart';
import 'package:flutter/material.dart';

class LayerFilterPanel extends StatelessWidget {
  final List<LayerGroup> groups;
  final Function(String layerId, bool isSelected) onLayerToggle;

  const LayerFilterPanel({
    super.key,
    required this.groups,
    required this.onLayerToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: groups.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final group = groups[index];
          return ExpansionCheckboxList<LayerItem>(
            title: group.title,
            items: group.items,
            labelBuilder: (item) => item.label,
            isSelected: (item) => item.isSelected,
            onChanged: (item, value) {
              onLayerToggle(item.id, value);
            },
          );
        },
      ),
    );
  }
}

class LayerGroup {
  final String title;
  final List<LayerItem> items;

  const LayerGroup({required this.title, required this.items});
}

class LayerItem {
  final String id;
  final String label;
  final bool isSelected;

  const LayerItem({
    required this.id,
    required this.label,
    this.isSelected = false,
  });
}
