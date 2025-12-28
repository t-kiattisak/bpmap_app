import 'package:bpmap_app/shared/hooks/use_side_effect.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ActionButton extends HookWidget {
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.disabled = false,
    this.style,
  });
  final AsyncCallback onPressed;
  final Widget label;
  final Widget? icon;
  final ButtonStyle? style;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final (clear: _, :mutate, :snapshot) = useSideEffect<void>();
    Future<void> pressButton() async {
      if (disabled) return;

      final future = onPressed();
      mutate(future);
      try {
        await future;
      } catch (exception) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong $exception')),
        );
      }
    }

    final isLoading = snapshot.connectionState == ConnectionState.waiting;

    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: disabled ? null : pressButton,
        style: style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading) ...[
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
            label,
          ],
        ),
      ),
    );
  }
}
