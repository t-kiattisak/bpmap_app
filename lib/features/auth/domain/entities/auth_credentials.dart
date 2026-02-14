import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_credentials.freezed.dart';
part 'auth_credentials.g.dart';

@freezed
abstract class AuthCredentials with _$AuthCredentials {
  const AuthCredentials._();

  const factory AuthCredentials({
    @Default('') String accessToken,
    @Default('') String refreshToken,
  }) = _AuthCredentials;

  bool get isLogin => accessToken.isNotEmpty;

  factory AuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$AuthCredentialsFromJson(json);
}
