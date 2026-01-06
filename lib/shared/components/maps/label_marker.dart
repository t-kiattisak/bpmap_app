import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:bpmap_app/shared/theme/app_color_theme.dart';

class LabelMarker extends StatelessWidget {
  final String label;

  const LabelMarker({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return CustomPaint(
      painter: _BubblePainter(appColors: appColors),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 16),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: appColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _BubblePainter extends CustomPainter {
  final AppColorTheme appColors;

  _BubblePainter({required this.appColors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = appColors.surface
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = appColors.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    const radius = 8.0;
    const arrowHeight = 8.0;
    const arrowWidth = 16.0;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height - arrowHeight),
      const Radius.circular(radius),
    );

    path.addRRect(rect);

    // Create arrow path
    final arrowPath = Path()
      ..moveTo(size.width / 2 - arrowWidth / 2, size.height - arrowHeight - 1)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width / 2 + arrowWidth / 2, size.height - arrowHeight - 1)
      ..close();

    // Combine paths
    final combinedPath = Path.combine(PathOperation.union, path, arrowPath);

    // Draw shadow
    canvas.drawShadow(
      combinedPath,
      appColors.textPrimary.withValues(alpha: 0.1),
      4.0,
      true,
    );

    // Draw filled shape
    canvas.drawPath(combinedPath, paint);

    // Draw border
    canvas.drawPath(combinedPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _BubblePainter oldDelegate) =>
      oldDelegate.appColors != appColors;
}
