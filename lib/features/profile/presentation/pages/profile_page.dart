import 'package:bpmap_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = context.appColors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ฉัน'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: appColors.error,
                  side: BorderSide(color: appColors.error),
                ),
                child: const Text('ออกจากระบบ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
