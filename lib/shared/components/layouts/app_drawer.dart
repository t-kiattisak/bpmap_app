import 'package:bpmap_app/presentation/providers/auth_provider.dart';
import 'package:bpmap_app/shared/domain/providers/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final me = ref.watch(fetchMeProvider);
    final isLoggedIn = ref.watch(
      loginControllerProvider.select((value) => value.value?.isLogin ?? false),
    );

    return Drawer(
      child: Column(
        children: [
          me.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Container(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://www.transparenttextures.com/patterns/cubes.png',
                  ),
                  colorFilter: ColorFilter.mode(
                    Colors.grey.withValues(alpha: 0.05),
                    BlendMode.srcATop,
                  ),
                  repeat: ImageRepeat.repeat,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[800],
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
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
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.black54),
                ],
              ),
            ),
            data: (data) {
              final user = data.data;
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://www.transparenttextures.com/patterns/cubes.png',
                    ),
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withValues(alpha: 0.05),
                      BlendMode.srcATop,
                    ),
                    repeat: ImageRepeat.repeat,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[800],
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user?.displayName ?? ''}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '(Authenticated)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.black54),
                  ],
                ),
              );
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  _DrawerItem(
                    icon: Icons.home,
                    title: 'หน้าหลัก',
                    onTap: () {},
                    isActive: true,
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
                  ref.read(loadingServiceProvider.notifier).wrap(() async {
                    await ref.read(loginControllerProvider.notifier).logout();
                  });
                },
              ),
            ),
        ],
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
    return ListTile(
      leading: SizedBox(
        width: 24,
        child: Icon(
          icon,
          color: isActive ? Colors.black87 : const Color(0xFF2C3E50),
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
      tileColor: isActive ? Colors.grey[100] : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      dense: true,
      horizontalTitleGap: 16,
    );
  }
}
