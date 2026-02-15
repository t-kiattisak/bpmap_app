import 'package:bpmap_app/features/auth/presentation/form/email_formz.dart';
import 'package:bpmap_app/features/auth/presentation/form/password_formz.dart';
import 'package:bpmap_app/features/auth/presentation/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormProvider =
    NotifierProvider<LoginFormNotifier, LoginState>(LoginFormNotifier.new);

class LoginFormNotifier extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();

  void emailChanged(String value) {
    state = state.copyWith(email: EmailFormz.dirty(value));
  }

  void passwordChanged(String value) {
    state = state.copyWith(password: PasswordFormz.dirty(value));
  }

  void markAllTouched() {
    state = state.copyWith(
      email: EmailFormz.dirty(state.email.value),
      password: PasswordFormz.dirty(state.password.value),
    );
  }
}
