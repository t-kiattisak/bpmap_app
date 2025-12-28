import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({super.key, required this.label, this.required = false});

  final String label;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
