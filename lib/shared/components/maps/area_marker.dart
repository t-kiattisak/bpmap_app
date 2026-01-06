import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class AreaMarker extends StatelessWidget {
  final String value;
  final VoidCallback? onTap;
  final Color? color;

  const AreaMarker({super.key, required this.value, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final markerColor = color ?? appColors.warning;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 30,
        decoration: BoxDecoration(
          color: markerColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: appColors.textPrimary.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: appColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
