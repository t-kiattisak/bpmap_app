import 'package:bpmap_app/features/auth/presentation/state/auth_state.dart';
import 'package:bpmap_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:bpmap_app/presentation/providers/loading_provider.dart';
import 'package:bpmap_app/presentation/router/router.dart';
import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends ConsumerWidget {
  final VoidCallback? toggleDrawer;
  const AppDrawer({super.key, this.toggleDrawer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPath = GoRouterState.of(context).uri.toString();
    final appColors = context.appColors;
    final authAsync = ref.watch(authProvider);
    final authState = authAsync is AsyncData<AuthState> ? authAsync.value : null;
    final isLoggedIn = authState is AuthAuthenticated;

    Widget header;
    if (authAsync.isLoading) {
          header = const Center(child: CircularProgressIndicator());
        } else if (authState is AuthAuthenticated && authState.userMe != null) {
          final user = authState.userMe!.data;
          header = Container(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
            decoration: BoxDecoration(
              color: appColors.surface,
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.transparenttextures.com/patterns/cubes.png',
                ),
                colorFilter: ColorFilter.mode(
                  appColors.textSecondary.withValues(alpha: 0.05),
                  BlendMode.srcATop,
                ),
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: appColors.textPrimary.withValues(alpha: 0.8),
                  child: Icon(
                    Icons.person,
                    color: appColors.surface,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.displayName ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: appColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '(Authenticated)',
                        style: TextStyle(
                          fontSize: 12,
                          color: appColors.success.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: appColors.textSecondary),
              ],
            ),
          );
        } else {
          header = Container(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
            decoration: BoxDecoration(
              color: appColors.surface,
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.transparenttextures.com/patterns/cubes.png',
                ),
                colorFilter: ColorFilter.mode(
                  appColors.textPrimary.withValues(alpha: 0.05),
                  BlendMode.srcATop,
                ),
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: appColors.textPrimary.withValues(alpha: 0.8),
                  child: Icon(
                    Icons.person,
                    color: appColors.surface,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'เข้าสู่ระบบ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: appColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: appColors.textSecondary),
              ],
            ),
          );
        }

        return Drawer(
          elevation: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border(right: BorderSide(color: appColors.border)),
            ),
            child: Column(
              children: [
                header,
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        _DrawerItem(
                          icon: Icons.home,
                          title: 'หน้าหลัก',
                          onTap: () {
                            toggleDrawer?.call();
                            HomeRoute().go(context);
                          },
                          isActive: currentPath == HomeRoute().location,
                        ),
                        _DrawerItem(
                          icon: FontAwesomeIcons.newspaper,
                          title: 'แมพ',
                          onTap: () {
                            toggleDrawer?.call();
                            MapRoute().go(context);
                          },
                          isActive: currentPath == MapRoute().location,
                        ),
                        _DrawerItem(
                          icon: FontAwesomeIcons.newspaper,
                          title: 'ข่าวสาร',
                          onTap: () {},
                        ),
                        _DrawerItem(
                          icon: FontAwesomeIcons.bullhorn,
                          title: 'แจ้งภัย และคำร้อง',
                          onTap: () {},
                        ),
                        _DrawerItem(
                          icon: FontAwesomeIcons.truck,
                          title: 'ติดตามความช่วยเหลือ',
                          onTap: () {},
                        ),
                        _DrawerItem(
                          icon: FontAwesomeIcons.boxOpen,
                          title: 'หน่วยสนับสนุน',
                          onTap: () {},
                        ),
                        const Divider(),
                        _DrawerItem(
                          icon: Icons.article_outlined,
                          title: 'e-Learning',
                          onTap: () {},
                        ),
                        _DrawerItem(
                          icon: FontAwesomeIcons.headset,
                          title: 'สายด่วน',
                          onTap: () {},
                        ),
                        _DrawerItem(
                          icon: FontAwesomeIcons.globe,
                          title: 'เว็บไซต์',
                          onTap: () {},
                        ),
                        _DrawerItem(
                          icon: FontAwesomeIcons.circleInfo,
                          title: 'เกี่ยวกับเรา',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                if (isLoggedIn)
                  SafeArea(
                    bottom: true,
                    child: _DrawerItem(
                      icon: Icons.logout,
                      title: 'ออกจากระบบ',
                      onTap: () {
                        ref.read(loadingProvider.notifier).wrap(() async {
                          ref.read(authProvider.notifier).logout();
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return ListTile(
      leading: SizedBox(
        width: 24,
        child: Icon(
          icon,
          color: isActive ? appColors.iconPrimary : appColors.textSecondary,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: appColors.textPrimary,
        ),
      ),
      onTap: onTap,
      tileColor: isActive
          ? appColors.textSecondary.withValues(alpha: 0.1)
          : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      dense: true,
      horizontalTitleGap: 16,
    );
  }
}
