import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _LocationCard(address: 'คอนโด ไลฟ์ ลุนจิบทิท 48', onTap: () {}),
              const SizedBox(height: 16),
              SizedBox(
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/report'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColors.brandBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 24),
                  label: const Text('แจ้งปัญหา'),
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'รายการแจ้งของฉัน',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: appColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _IssueListItem(
                icon: Icons.water_drop,
                iconColor: appColors.brandBlue,
                title: 'น้ำรั่ว',
                subtitle: 'ถนนสุขุมวิท 48',
                timeAgo: 'เมื่อ 2 ชม.ที่แล้ว',
                onMenuTap: () {},
              ),
              const SizedBox(height: 8),
              _IssueListItem(
                icon: Icons.bolt,
                iconColor: Colors.amber,
                title: 'ไฟดับ',
                subtitle: 'ถนนสุขุมวิท 50',
                timeAgo: 'เมื่อ 2 ชม.ที่แล้ว',
                onMenuTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({required this.address, required this.onTap});

  final String address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: appColors.brandBlue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: appColors.brandBlue.withValues(alpha: 0.5)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(Icons.location_on, color: appColors.brandBlue, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ตำแหน่งปัจจุบัน',
                    style: textTheme.bodySmall?.copyWith(
                      color: appColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    address,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: appColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: appColors.textSecondary, size: 24),
          ],
        ),
      ),
    );
  }
}

class _IssueListItem extends StatelessWidget {
  const _IssueListItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    required this.onMenuTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String timeAgo;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: appColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: appColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              timeAgo,
              style: textTheme.bodySmall?.copyWith(
                color: appColors.textSecondary,
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: appColors.textSecondary),
              onPressed: onMenuTap,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ],
        ),
      ),
    );
  }
}
