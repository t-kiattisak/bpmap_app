import 'package:bpmap_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bpmap_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  context.read<AuthBloc>().add(const AuthLogout());
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
