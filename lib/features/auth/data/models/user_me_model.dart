import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_me_model.freezed.dart';
part 'user_me_model.g.dart';

@freezed
abstract class UserMeModel with _$UserMeModel {
  const factory UserMeModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") UserData? data,
  }) = _UserMeModel;

  factory UserMeModel.fromJson(Map<String, dynamic> json) =>
      _$UserMeModelFromJson(json);
}

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "display_name") String? displayName,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "social_accounts") List<SocialAccount>? socialAccounts,
    @JsonKey(name: "devices") List<Device>? devices,
    @JsonKey(name: "sessions") List<Session>? sessions,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@freezed
abstract class Device with _$Device {
  const factory Device({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "push_token") String? pushToken,
    @JsonKey(name: "provider") String? provider,
    @JsonKey(name: "device_type") String? deviceType,
    @JsonKey(name: "last_seen") DateTime? lastSeen,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

@freezed
abstract class Session with _$Session {
  const factory Session({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "refresh_token") String? refreshToken,
    @JsonKey(name: "device_id") String? deviceId,
    @JsonKey(name: "expires_at") DateTime? expiresAt,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

@freezed
abstract class SocialAccount with _$SocialAccount {
  const factory SocialAccount({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "provider") String? provider,
    @JsonKey(name: "provider_id") String? providerId,
  }) = _SocialAccount;

  factory SocialAccount.fromJson(Map<String, dynamic> json) =>
      _$SocialAccountFromJson(json);
}
