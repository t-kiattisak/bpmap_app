import 'package:bpmap_app/presentation/router/router.dart';
import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellMenuItem {
  const ShellMenuItem({
    required this.location,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.go,
  });

  final String location;
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final void Function(BuildContext context) go;
}

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.title = const [],
    this.titleBuilder,
  });

  final Widget child;
  final Color backgroundColor;
  final List<Widget> title;
  final List<Widget> Function(BuildContext)? titleBuilder;

  static final List<ShellMenuItem> _menuItems = [
    ShellMenuItem(
      location: HomeRoute().location,
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'หน้าหลัก',
      go: (c) => const HomeRoute().go(c),
    ),
    ShellMenuItem(
      location: ReportRoute().location,
      icon: Icons.add_circle_outline,
      activeIcon: Icons.add_circle,
      label: 'แจ้งปัญหา',
      go: (c) => const ReportRoute().go(c),
    ),
    ShellMenuItem(
      location: MapRoute().location,
      icon: Icons.map_outlined,
      activeIcon: Icons.map,
      label: 'แผนที่',
      go: (c) => const MapRoute().go(c),
    ),
    ShellMenuItem(
      location: ProfileRoute().location,
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'ฉัน',
      go: (c) => const ProfileRoute().go(c),
    ),
  ];

  static int _selectedIndexForLocation(String location) {
    final index = _menuItems.indexWhere((m) => m.location == location);
    return index >= 0 ? index : 0;
  }

  static void _onTabTap(BuildContext context, int index) {
    _menuItems[index].go(context);
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final appColors = context.appColors;

    final bottomNav = BottomNavigationBar(
      currentIndex: _selectedIndexForLocation(location),
      onTap: (index) => _onTabTap(context, index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: appColors.brandBlue,
      unselectedItemColor: appColors.textSecondary,
      items: _menuItems
          .map(
            (m) => BottomNavigationBarItem(
              icon: Icon(m.icon),
              activeIcon: Icon(m.activeIcon),
              label: m.label,
            ),
          )
          .toList(),
    );

    return Material(
      color: context.appColors.surface,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: backgroundColor,
        body: child,
        bottomNavigationBar: bottomNav,
      ),
    );
  }
}
