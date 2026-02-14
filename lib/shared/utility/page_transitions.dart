import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideRightTransitionPage<T> extends CustomTransitionPage<T> {
  SlideRightTransitionPage({
    required super.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    super.maintainState,
    super.fullscreenDialog,
    super.opaque,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
  }) : super(
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           const begin = Offset(1.0, 0.0);
           const end = Offset.zero;
           const curve = Curves.easeInOut;
           var tween = Tween(
             begin: begin,
             end: end,
           ).chain(CurveTween(curve: curve));

           return SlideTransition(
             position: animation.drive(tween),
             child: child,
           );
         },
       );
}
