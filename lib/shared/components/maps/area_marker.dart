import 'package:flutter/material.dart';

class AreaMarker extends StatelessWidget {
  final String value;
  final VoidCallback? onTap;
  final Color color;

  const AreaMarker({
    super.key,
    required this.value,
    this.onTap,
    this.color = const Color(0xFFFFCC00), // Default yellow
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: const Color(0x33000000),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
