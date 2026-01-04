import 'package:flutter/material.dart';
import 'package:bpmap_app/shared/components/layouts/app_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainLayout extends HookWidget {
  final Widget child;
  final List<Widget> title;
  final List<Widget>? actions;

  const MainLayout({
    super.key,
    required this.child,
    this.title = const [],
    this.actions,
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
      color: const Color(0xFFF5F5F5),
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
                child: const OverflowBox(
                  minWidth: 280,
                  maxWidth: 280,
                  alignment: Alignment.centerRight,
                  child: AppDrawer(),
                ),
              );
            },
          ),

          AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
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
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: Builder(
                            builder: (context) {
                              return IconButton(
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
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
                                    color: Colors.black87,
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
