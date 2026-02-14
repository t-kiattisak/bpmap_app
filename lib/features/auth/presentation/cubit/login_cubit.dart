import 'package:bpmap_app/features/auth/presentation/form/email_formz.dart';
import 'package:bpmap_app/features/auth/presentation/form/password_formz.dart';
import 'package:bpmap_app/features/auth/presentation/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void emailChanged(String value) {
    emit(state.copyWith(email: EmailFormz.dirty(value)));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: PasswordFormz.dirty(value)));
  }

  void markAllTouched() {
    emit(
      state.copyWith(
        email: EmailFormz.dirty(state.email.value),
        password: PasswordFormz.dirty(state.password.value),
      ),
    );
  }
}
