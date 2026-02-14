// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequestModel {

 String get username; String get password;@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'device_type') String get deviceType;@JsonKey(name: 'push_token') String get pushToken;
/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestModelCopyWith<LoginRequestModel> get copyWith => _$LoginRequestModelCopyWithImpl<LoginRequestModel>(this as LoginRequestModel, _$identity);

  /// Serializes this LoginRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequestModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.pushToken, pushToken) || other.pushToken == pushToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,deviceId,deviceType,pushToken);

@override
String toString() {
  return 'LoginRequestModel(username: $username, password: $password, deviceId: $deviceId, deviceType: $deviceType, pushToken: $pushToken)';
}


}

/// @nodoc
abstract mixin class $LoginRequestModelCopyWith<$Res>  {
  factory $LoginRequestModelCopyWith(LoginRequestModel value, $Res Function(LoginRequestModel) _then) = _$LoginRequestModelCopyWithImpl;
@useResult
$Res call({
 String username, String password,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_type') String deviceType,@JsonKey(name: 'push_token') String pushToken
});




}
/// @nodoc
class _$LoginRequestModelCopyWithImpl<$Res>
    implements $LoginRequestModelCopyWith<$Res> {
  _$LoginRequestModelCopyWithImpl(this._self, this._then);

  final LoginRequestModel _self;
  final $Res Function(LoginRequestModel) _then;

/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,Object? deviceId = null,Object? deviceType = null,Object? pushToken = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,pushToken: null == pushToken ? _self.pushToken : pushToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequestModel].
extension LoginRequestModelPatterns on LoginRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequestModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_type')  String deviceType, @JsonKey(name: 'push_token')  String pushToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that.username,_that.password,_that.deviceId,_that.deviceType,_that.pushToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_type')  String deviceType, @JsonKey(name: 'push_token')  String pushToken)  $default,) {final _that = this;
switch (_that) {
case _LoginRequestModel():
return $default(_that.username,_that.password,_that.deviceId,_that.deviceType,_that.pushToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_type')  String deviceType, @JsonKey(name: 'push_token')  String pushToken)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that.username,_that.password,_that.deviceId,_that.deviceType,_that.pushToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequestModel implements LoginRequestModel {
  const _LoginRequestModel({required this.username, required this.password, @JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'device_type') required this.deviceType, @JsonKey(name: 'push_token') required this.pushToken});
  factory _LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

@override final  String username;
@override final  String password;
@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'device_type') final  String deviceType;
@override@JsonKey(name: 'push_token') final  String pushToken;

/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestModelCopyWith<_LoginRequestModel> get copyWith => __$LoginRequestModelCopyWithImpl<_LoginRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequestModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.pushToken, pushToken) || other.pushToken == pushToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password,deviceId,deviceType,pushToken);

@override
String toString() {
  return 'LoginRequestModel(username: $username, password: $password, deviceId: $deviceId, deviceType: $deviceType, pushToken: $pushToken)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestModelCopyWith<$Res> implements $LoginRequestModelCopyWith<$Res> {
  factory _$LoginRequestModelCopyWith(_LoginRequestModel value, $Res Function(_LoginRequestModel) _then) = __$LoginRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String username, String password,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_type') String deviceType,@JsonKey(name: 'push_token') String pushToken
});




}
/// @nodoc
class __$LoginRequestModelCopyWithImpl<$Res>
    implements _$LoginRequestModelCopyWith<$Res> {
  __$LoginRequestModelCopyWithImpl(this._self, this._then);

  final _LoginRequestModel _self;
  final $Res Function(_LoginRequestModel) _then;

/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,Object? deviceId = null,Object? deviceType = null,Object? pushToken = null,}) {
  return _then(_LoginRequestModel(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,pushToken: null == pushToken ? _self.pushToken : pushToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
