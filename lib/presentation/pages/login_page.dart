import 'package:bpmap_app/presentation/providers/auth_provider.dart';
import 'package:bpmap_app/shared/components/button/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:bpmap_app/shared/components/field/app_text_field.dart';
import 'package:bpmap_app/shared/components/field/password_text_field.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(loginControllerProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    });

    final loginState = ref.watch(loginControllerProvider);
    final isLoading = loginState is AsyncLoading;

    Future<void> handleLogin() async {
      await Future.delayed(const Duration(minutes: 1));
      if (formKey.currentState!.validate()) {
        await ref
            .read(loginControllerProvider.notifier)
            .login(
              username: emailController.text,
              password: passwordController.text,
            );
      }
    }

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text('เข้าสู่ระบบ', style: textTheme.headlineMedium),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.error,
                      ),
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.google, size: 20),
                      label: const Text('With Google'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.line, size: 20),
                      label: const Text('With Line'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Form
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTextField(
                      controller: emailController,
                      label: 'อีเมล*',
                      keyboardType: TextInputType.emailAddress,
                      enabled: !isLoading,
                      hintText: 'xxxx@xxx.com',
                      suffixIcon: const Icon(
                        Icons.check_circle_outline,
                        size: 20,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกอีเมล';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    PasswordTextField(
                      controller: passwordController,
                      label: 'รหัสผ่าน *',
                      enabled: !isLoading,
                    ),

                    const SizedBox(height: 60),
                    ActionButton(
                      onPressed: handleLogin,
                      label: const Text('Log In'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
