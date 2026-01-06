import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExpansionCheckboxList<T> extends HookWidget {
  final String title;
  final List<T> items;
  final String Function(T) labelBuilder;
  final bool Function(T) isSelected;
  final void Function(T item, bool value) onChanged;
  final bool initiallyExpanded;

  const ExpansionCheckboxList({
    super.key,
    required this.title,
    required this.items,
    required this.labelBuilder,
    required this.isSelected,
    required this.onChanged,
    this.initiallyExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(initiallyExpanded);

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        key: PageStorageKey(title),
        initiallyExpanded: isExpanded.value,
        onExpansionChanged: (value) => isExpanded.value = value,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        childrenPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        leading: Icon(
          isExpanded.value
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          color: Colors.grey[400],
          size: 28,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        trailing: const SizedBox.shrink(),
        children: items.map((item) {
          final selected = isSelected(item);
          return Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CheckboxListTile(
              value: selected,
              onChanged: (bool? value) {
                if (value != null) {
                  onChanged(item, value);
                }
              },
              title: Text(
                labelBuilder(item),
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              dense: true,
              activeColor: Colors.black87,
              checkColor: Colors.white,
              side: const BorderSide(color: Colors.grey),
              visualDensity: VisualDensity.compact,
            ),
          );
        }).toList(),
      ),
    );
  }
}
