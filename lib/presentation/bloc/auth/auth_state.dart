import 'package:bpmap_app/data/models/user_me_model.dart';
import 'package:bpmap_app/domain/entities/auth_credentials.dart';
import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({
    required this.credentials,
    this.userMe,
  });

  final AuthCredentials credentials;
  final UserMeModel? userMe;

  @override
  List<Object?> get props => [credentials, userMe];
}

final class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

final class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
