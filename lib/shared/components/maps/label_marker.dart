import 'package:flutter/material.dart';

class LabelMarker extends StatelessWidget {
  final String label;

  const LabelMarker({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BubblePainter(),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 16),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
        ),
      ),
    );
  }
}

class _BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.grey.shade400
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
    canvas.drawShadow(combinedPath, Colors.black.withOpacity(0.1), 4.0, true);

    // Draw filled shape
    canvas.drawPath(combinedPath, paint);

    // Draw border
    canvas.drawPath(combinedPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
