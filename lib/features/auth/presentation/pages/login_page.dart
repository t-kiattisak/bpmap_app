import 'package:bpmap_app/features/auth/presentation/state/auth_state.dart';
import 'package:bpmap_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:bpmap_app/features/auth/presentation/form/email_formz.dart';
import 'package:bpmap_app/features/auth/presentation/form/password_formz.dart';
import 'package:bpmap_app/features/auth/presentation/providers/login_form_provider.dart';
import 'package:bpmap_app/shared/components/button/action_button.dart';
import 'package:bpmap_app/shared/components/field/app_text_field.dart';
import 'package:bpmap_app/shared/components/field/password_text_field.dart';
import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final appColors = context.appColors;

    ref.listen<AsyncValue<AuthState>>(authProvider, (prev, next) {
      next.whenOrNull(
        error: (err, _) {
          final message = err is AuthError ? err.message : 'เกิดข้อผิดพลาด';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: appColors.error,
            ),
          );
        },
      );
    });

    final authAsync = ref.watch(authProvider);
    final isLoading = authAsync.isLoading;
    final loginState = ref.watch(loginFormProvider);
    final loginNotifier = ref.read(loginFormProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Icon(
                Icons.shield_outlined,
                size: 56,
                color: appColors.brandBlue,
              ),
              const SizedBox(height: 16),
              Text(
                'เข้าสู่ระบบ',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              ActionButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: appColors.textPrimary,
                  side: BorderSide(color: appColors.border),
                ),
                onPressed: () async {
                  if (isLoading) return;
                  ref.read(authProvider.notifier).googleLogin();
                },
                icon: const FaIcon(FontAwesomeIcons.google, size: 20),
                label: const Text('เข้าสู่ระบบด้วย Google'),
              ),
              const SizedBox(height: 12),
              ActionButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.brandLine,
                ),
                onPressed: () async {
                  if (isLoading) return;
                  ref.read(authProvider.notifier).lineLogin();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.line,
                  size: 20,
                  color: Colors.white,
                ),
                label: const Text(
                  'เข้าสู่ระบบด้วย LINE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'หรือ',
                      style: textTheme.bodyMedium?.copyWith(
                        color: appColors.textSecondary,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
              AppTextField(
                value: loginState.email.value,
                keyboardType: TextInputType.emailAddress,
                enabled: !isLoading,
                hintText: 'เบอร์โทรศัพท์หรืออีเมล',
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: 20,
                  color: appColors.textSecondary,
                ),
                errorText: loginState.email.displayError?.message,
                onChanged: loginNotifier.emailChanged,
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                value: loginState.password.value,
                enabled: !isLoading,
                hintText: 'รหัสผ่าน',
                prefixIcon: Icon(
                  Icons.lock_outline,
                  size: 20,
                  color: appColors.textSecondary,
                ),
                errorText: loginState.password.displayError?.message,
                onChanged: loginNotifier.passwordChanged,
              ),
              const SizedBox(height: 24),
              ActionButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.brandBlue,
                ),
                onPressed: () async {
                  if (isLoading) return;
                  if (!loginState.isValid) {
                    loginNotifier.markAllTouched();
                    return;
                  }
                  ref.read(authProvider.notifier).login(
                        username: loginState.email.value,
                        password: loginState.password.value,
                      );
                },
                label: const Text('เข้าสู่ระบบ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
