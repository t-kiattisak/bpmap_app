import 'package:bpmap_app/features/auth/presentation/form/email_formz.dart';
import 'package:bpmap_app/features/auth/presentation/form/password_formz.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const EmailFormz.pure(),
    this.password = const PasswordFormz.pure(),
  });

  final EmailFormz email;
  final PasswordFormz password;

  bool get isValid => Formz.validate([email, password]);

  LoginState copyWith({
    EmailFormz? email,
    PasswordFormz? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [email, password];
}
