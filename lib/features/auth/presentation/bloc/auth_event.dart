import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class AuthStarted extends AuthEvent {
  const AuthStarted();
}

final class AuthLogin extends AuthEvent {
  const AuthLogin({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}

final class AuthLogout extends AuthEvent {
  const AuthLogout();
}

final class AuthGoogleLogin extends AuthEvent {
  const AuthGoogleLogin();
}

final class AuthLineLogin extends AuthEvent {
  const AuthLineLogin();
}
