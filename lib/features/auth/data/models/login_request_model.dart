import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
abstract class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    required String username,
    required String password,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'device_type') required String deviceType,
    @JsonKey(name: 'push_token') required String pushToken,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}
