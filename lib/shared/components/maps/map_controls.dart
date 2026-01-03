import 'package:flutter/material.dart';

class MapControls extends StatelessWidget {
  final VoidCallback onCurrentLocation;
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;

  const MapControls({
    super.key,
    required this.onCurrentLocation,
    required this.onZoomIn,
    required this.onZoomOut,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MapControlButton(
          icon: Icons.my_location,
          onPressed: onCurrentLocation,
        ),
        const SizedBox(height: 8),
        _MapControlButton(icon: Icons.add, onPressed: onZoomIn),
        const SizedBox(height: 8),
        _MapControlButton(icon: Icons.remove, onPressed: onZoomOut),
      ],
    );
  }
}

class _MapControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _MapControlButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black87),
        onPressed: onPressed,
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
      ),
    );
  }
}
