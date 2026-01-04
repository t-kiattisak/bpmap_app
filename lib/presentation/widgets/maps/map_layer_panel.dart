import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MapLayerPanel extends HookWidget {
  final List<MapLayer> layers;
  final Function(MapLayer) onDelete;

  const MapLayerPanel({
    super.key,
    required this.layers,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = useState(false);
    final visibleLayerIds = useState<Set<String>>({});
    final selectedBaseMap = useState('ถนน');

    void showBaseMapSelector() {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 32,
                  left: 16,
                  right: 16,
                ),
                child: RadioGroup<String>(
                  groupValue: selectedBaseMap.value,
                  onChanged: (value) {
                    if (value != null) {
                      selectedBaseMap.value = value;
                      setState(() {});
                    }
                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'แผนที่ฐาน',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.red),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const Divider(),
                      ...[
                        'สถานที่',
                        'ถนน',
                        'จราจร',
                        'เขตการปกครอง',
                        'ดาวเทียม (ไทยโชต)',
                      ].map((type) {
                        return RadioListTile<String>(
                          value: type,
                          title: Text(type),
                          contentPadding: EdgeInsets.zero,
                          activeColor: Colors.red,
                          controlAffinity: ListTileControlAffinity.leading,
                        );
                      }),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            _LayerButton(
              icon: Icons.layers,
              isActive: false,
              onTap: showBaseMapSelector,
            ),
            const SizedBox(width: 8),
            _LayerButton(
              icon: Icons.filter_none,
              isActive: isOpen.value,
              onTap: () => isOpen.value = !isOpen.value,
            ),
          ],
        ),
        PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeScaleTransition(
              animation: primaryAnimation,
              child: child,
            );
          },
          child: isOpen.value
              ? Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: 300,
                    constraints: const BoxConstraints(maxHeight: 300),
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Colors.black87,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${layers.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'ชั้นข้อมูลที่แสดง',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...layers.map((layer) {
                                  final index = layers.indexOf(layer);
                                  final isVisible = visibleLayerIds.value
                                      .contains(layer.id);
                                  return Column(
                                    children: [
                                      if (index > 0) const Divider(height: 1),
                                      _LayerItem(
                                        name: layer.name,
                                        isVisible: isVisible,
                                        onVisibilityChanged: () {
                                          final newVisibleIds =
                                              Set<String>.from(
                                                visibleLayerIds.value,
                                              );
                                          if (isVisible) {
                                            newVisibleIds.remove(layer.id);
                                          } else {
                                            newVisibleIds.add(layer.id);
                                          }
                                          visibleLayerIds.value = newVisibleIds;
                                        },
                                        onDelete: () => onDelete(layer),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _LayerButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _LayerButton({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isActive ? Colors.black87 : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.black87,
          size: 20,
        ),
      ),
    );
  }
}

class _LayerItem extends StatelessWidget {
  final String name;
  final bool isVisible;
  final VoidCallback onVisibilityChanged;
  final VoidCallback onDelete;

  const _LayerItem({
    required this.name,
    required this.isVisible,
    required this.onVisibilityChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.drag_indicator, color: Colors.red, size: 20),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onVisibilityChanged,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                Icons.visibility,
                color: isVisible
                    ? Colors.black87
                    : Colors.grey.withValues(
                        alpha: 0.3,
                      ), // Updated visual here too
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14,
                color: isVisible ? Colors.black87 : Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onDelete,
            child: const Padding(
              padding: EdgeInsets.only(top: 2),
              child: Icon(Icons.delete_outline, color: Colors.grey, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}

class MapLayer {
  final String id;
  final String name;

  const MapLayer({required this.id, required this.name});
}
