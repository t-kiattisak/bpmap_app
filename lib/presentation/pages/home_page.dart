import 'package:bpmap_app/presentation/providers/auth_provider.dart';
import 'package:bpmap_app/shared/components/button/action_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ActionButton(
          onPressed: () async {
            await ref.read(loginControllerProvider.notifier).logout();
          },
          label: const Text('Log Out'),
        ),
      ),
    );
  }
}
