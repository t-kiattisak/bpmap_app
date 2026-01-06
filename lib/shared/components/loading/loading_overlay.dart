import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
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
              ModalBarrier(
                dismissible: false,
                color: context.appColors.textPrimary.withValues(alpha: 0.5),
              ),
              const Center(child: CircularProgressIndicator.adaptive()),
            ],
          ),
      ],
    );
  }
}
