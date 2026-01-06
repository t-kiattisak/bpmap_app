import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:bpmap_app/shared/components/layouts/app_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppShell extends HookWidget {
  final Widget child;
  final List<Widget>? actions;
  final Color backgroundColor;
  final List<Widget> title;

  const AppShell({
    super.key,
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.actions,
    this.title = const [],
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final isDrawerOpen = useState(false);

    final slideAnimation = Tween<double>(begin: 0, end: 280).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    final scaleAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    final radiusAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    void toggleDrawer() {
      if (isDrawerOpen.value) {
        animationController.reverse();
      } else {
        animationController.forward();
      }
      isDrawerOpen.value = !isDrawerOpen.value;
    }

    return Material(
      color: context.appColors.surface,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: slideAnimation,
            builder: (context, child) {
              return Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                width: slideAnimation.value,
                child: OverflowBox(
                  minWidth: 280,
                  maxWidth: 280,
                  alignment: Alignment.centerRight,
                  child: AppDrawer(toogleDrawer: toggleDrawer),
                ),
              );
            },
          ),

          AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              final appColors = context.appColors;
              return Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translateByDouble(slideAnimation.value, 0.0, 0.0, 1.0)
                  ..scaleByDouble(
                    scaleAnimation.value,
                    scaleAnimation.value,
                    scaleAnimation.value,
                    1.0,
                  ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radiusAnimation.value),
                  child: Stack(
                    children: [
                      Scaffold(
                        extendBodyBehindAppBar: true,
                        backgroundColor: backgroundColor,
                        appBar: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: Builder(
                            builder: (context) {
                              return IconButton(
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: appColors.surface,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: appColors.textPrimary.withValues(
                                          alpha: 0.1,
                                        ),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    isDrawerOpen.value
                                        ? Icons.close
                                        : Icons.list,
                                    color: appColors.iconPrimary,
                                  ),
                                ),
                                onPressed: toggleDrawer,
                              );
                            },
                          ),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: title,
                          ),
                          centerTitle: true,
                          actions: actions,
                        ),
                        body: child,
                      ),

                      if (isDrawerOpen.value)
                        GestureDetector(
                          onTap: toggleDrawer,
                          child: Container(
                            color: Colors.transparent,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
