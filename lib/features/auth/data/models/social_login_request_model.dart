import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_login_request_model.freezed.dart';
part 'social_login_request_model.g.dart';

@freezed
abstract class SocialLoginRequestModel with _$SocialLoginRequestModel {
  const factory SocialLoginRequestModel({
    required String provider,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'device_type') required String deviceType,
    @JsonKey(name: 'push_token') required String pushToken,
  }) = _SocialLoginRequestModel;

  factory SocialLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginRequestModelFromJson(json);
}
