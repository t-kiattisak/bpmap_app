import 'package:bpmap_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:bpmap_app/presentation/bloc/auth/auth_event.dart';
import 'package:bpmap_app/presentation/bloc/auth/auth_state.dart';
import 'package:bpmap_app/presentation/login/cubit/login_cubit.dart';
import 'package:bpmap_app/presentation/login/cubit/login_state.dart';
import 'package:bpmap_app/presentation/login/form/email_formz.dart';
import 'package:bpmap_app/presentation/login/form/password_formz.dart';
import 'package:bpmap_app/shared/components/button/action_button.dart';
import 'package:bpmap_app/shared/components/field/app_text_field.dart';
import 'package:bpmap_app/shared/components/field/password_text_field.dart';
import 'package:bpmap_app/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appColors = context.appColors;

    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            current is AuthError && previous is! AuthError,
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: appColors.error,
              ),
            );
          }
        },
        builder: (context, authState) {
          final isLoading = authState is AuthLoading;

          return BlocBuilder<LoginCubit, LoginState>(
            builder: (context, loginState) {
              return Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Text(
                            'เข้าสู่ระบบ',
                            style: textTheme.headlineMedium,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: ActionButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: appColors.error,
                                ),
                                onPressed: () async {
                                  if (isLoading) return;
                                  context
                                      .read<AuthBloc>()
                                      .add(const AuthGoogleLogin());
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.google,
                                  size: 20,
                                ),
                                label: const Text('With Google'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ActionButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: appColors.brandLine,
                                ),
                                onPressed: () async {
                                  if (isLoading) return;
                                  context
                                      .read<AuthBloc>()
                                      .add(const AuthLineLogin());
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.line,
                                  size: 20,
                                ),
                                label: const Text('With Line'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        AppTextField(
                          value: loginState.email.value,
                          label: 'อีเมล*',
                          keyboardType: TextInputType.emailAddress,
                          enabled: !isLoading,
                          hintText: 'xxxx@xxx.com',
                          suffixIcon: const Icon(
                            Icons.check_circle_outline,
                            size: 20,
                          ),
                          errorText: loginState.email.displayError?.message,
                          onChanged: context.read<LoginCubit>().emailChanged,
                        ),
                        const SizedBox(height: 24),
                        PasswordTextField(
                          value: loginState.password.value,
                          label: 'รหัสผ่าน *',
                          enabled: !isLoading,
                          errorText:
                              loginState.password.displayError?.message,
                          onChanged:
                              context.read<LoginCubit>().passwordChanged,
                        ),
                        const SizedBox(height: 60),
                        ActionButton(
                          onPressed: () async {
                            if (isLoading) return;
                            final cubit = context.read<LoginCubit>();
                            if (!cubit.state.isValid) {
                              cubit.markAllTouched();
                              return;
                            }
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    username: cubit.state.email.value,
                                    password: cubit.state.password.value,
                                  ),
                                );
                          },
                          label: const Text('Log In'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
