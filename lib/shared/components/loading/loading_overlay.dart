import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget? child;
  final bool isLoading;

  const LoadingOverlay({super.key, this.child, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (child != null) child!,
        if (isLoading)
          Stack(
            children: [
              const ModalBarrier(dismissible: false, color: Colors.black54),
              Center(child: CircularProgressIndicator.adaptive()),
            ],
          ),
      ],
    );
  }
}
