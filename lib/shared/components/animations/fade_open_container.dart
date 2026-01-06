import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeOpenContainer extends StatelessWidget {
  final Widget Function(BuildContext, VoidCallback) closedBuilder;
  final Widget Function(BuildContext, VoidCallback) openBuilder;
  final ShapeBorder closedShape;
  final Color? closedColor;
  final Duration transitionDuration;
  final double closedElevation;
  final Color? openColor;

  const FadeOpenContainer({
    super.key,
    required this.closedBuilder,
    required this.openBuilder,
    this.closedShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    this.closedColor,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.closedElevation = 0,
    this.openColor,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      transitionDuration: transitionDuration,
      closedElevation: closedElevation,
      closedShape: closedShape,
      closedColor: closedColor ?? context.appColors.surface,
      openColor: openColor ?? context.appColors.surface,
      openBuilder: openBuilder,
      closedBuilder: closedBuilder,
    );
  }
}
