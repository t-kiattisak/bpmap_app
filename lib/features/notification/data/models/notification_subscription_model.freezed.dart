// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_subscription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationSubscriptionModel {

@JsonKey(name: "status") int get status;@JsonKey(name: "message") String get message;@JsonKey(name: "data") Data get data;
/// Create a copy of NotificationSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationSubscriptionModelCopyWith<NotificationSubscriptionModel> get copyWith => _$NotificationSubscriptionModelCopyWithImpl<NotificationSubscriptionModel>(this as NotificationSubscriptionModel, _$identity);

  /// Serializes this NotificationSubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationSubscriptionModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'NotificationSubscriptionModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $NotificationSubscriptionModelCopyWith<$Res>  {
  factory $NotificationSubscriptionModelCopyWith(NotificationSubscriptionModel value, $Res Function(NotificationSubscriptionModel) _then) = _$NotificationSubscriptionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") int status,@JsonKey(name: "message") String message,@JsonKey(name: "data") Data data
});


$DataCopyWith<$Res> get data;

}
/// @nodoc
class _$NotificationSubscriptionModelCopyWithImpl<$Res>
    implements $NotificationSubscriptionModelCopyWith<$Res> {
  _$NotificationSubscriptionModelCopyWithImpl(this._self, this._then);

  final NotificationSubscriptionModel _self;
  final $Res Function(NotificationSubscriptionModel) _then;

/// Create a copy of NotificationSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data,
  ));
}
/// Create a copy of NotificationSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res> get data {
  
  return $DataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationSubscriptionModel].
extension NotificationSubscriptionModelPatterns on NotificationSubscriptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationSubscriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationSubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationSubscriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationSubscriptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationSubscriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationSubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  int status, @JsonKey(name: "message")  String message, @JsonKey(name: "data")  Data data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationSubscriptionModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  int status, @JsonKey(name: "message")  String message, @JsonKey(name: "data")  Data data)  $default,) {final _that = this;
switch (_that) {
case _NotificationSubscriptionModel():
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  int status, @JsonKey(name: "message")  String message, @JsonKey(name: "data")  Data data)?  $default,) {final _that = this;
switch (_that) {
case _NotificationSubscriptionModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationSubscriptionModel implements NotificationSubscriptionModel {
  const _NotificationSubscriptionModel({@JsonKey(name: "status") required this.status, @JsonKey(name: "message") required this.message, @JsonKey(name: "data") required this.data});
  factory _NotificationSubscriptionModel.fromJson(Map<String, dynamic> json) => _$NotificationSubscriptionModelFromJson(json);

@override@JsonKey(name: "status") final  int status;
@override@JsonKey(name: "message") final  String message;
@override@JsonKey(name: "data") final  Data data;

/// Create a copy of NotificationSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationSubscriptionModelCopyWith<_NotificationSubscriptionModel> get copyWith => __$NotificationSubscriptionModelCopyWithImpl<_NotificationSubscriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationSubscriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationSubscriptionModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'NotificationSubscriptionModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$NotificationSubscriptionModelCopyWith<$Res> implements $NotificationSubscriptionModelCopyWith<$Res> {
  factory _$NotificationSubscriptionModelCopyWith(_NotificationSubscriptionModel value, $Res Function(_NotificationSubscriptionModel) _then) = __$NotificationSubscriptionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") int status,@JsonKey(name: "message") String message,@JsonKey(name: "data") Data data
});


@override $DataCopyWith<$Res> get data;

}
/// @nodoc
class __$NotificationSubscriptionModelCopyWithImpl<$Res>
    implements _$NotificationSubscriptionModelCopyWith<$Res> {
  __$NotificationSubscriptionModelCopyWithImpl(this._self, this._then);

  final _NotificationSubscriptionModel _self;
  final $Res Function(_NotificationSubscriptionModel) _then;

/// Create a copy of NotificationSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_NotificationSubscriptionModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data,
  ));
}

/// Create a copy of NotificationSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res> get data {
  
  return $DataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$Data {

@JsonKey(name: "success_tokens") List<dynamic> get successTokens;@JsonKey(name: "failure_tokens") List<FailureToken> get failureTokens;
/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<Data> get copyWith => _$DataCopyWithImpl<Data>(this as Data, _$identity);

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data&&const DeepCollectionEquality().equals(other.successTokens, successTokens)&&const DeepCollectionEquality().equals(other.failureTokens, failureTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(successTokens),const DeepCollectionEquality().hash(failureTokens));

@override
String toString() {
  return 'Data(successTokens: $successTokens, failureTokens: $failureTokens)';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<$Res>  {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) = _$DataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success_tokens") List<dynamic> successTokens,@JsonKey(name: "failure_tokens") List<FailureToken> failureTokens
});




}
/// @nodoc
class _$DataCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? successTokens = null,Object? failureTokens = null,}) {
  return _then(_self.copyWith(
successTokens: null == successTokens ? _self.successTokens : successTokens // ignore: cast_nullable_to_non_nullable
as List<dynamic>,failureTokens: null == failureTokens ? _self.failureTokens : failureTokens // ignore: cast_nullable_to_non_nullable
as List<FailureToken>,
  ));
}

}


/// Adds pattern-matching-related methods to [Data].
extension DataPatterns on Data {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Data value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Data value)  $default,){
final _that = this;
switch (_that) {
case _Data():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Data value)?  $default,){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success_tokens")  List<dynamic> successTokens, @JsonKey(name: "failure_tokens")  List<FailureToken> failureTokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Data() when $default != null:
return $default(_that.successTokens,_that.failureTokens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success_tokens")  List<dynamic> successTokens, @JsonKey(name: "failure_tokens")  List<FailureToken> failureTokens)  $default,) {final _that = this;
switch (_that) {
case _Data():
return $default(_that.successTokens,_that.failureTokens);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success_tokens")  List<dynamic> successTokens, @JsonKey(name: "failure_tokens")  List<FailureToken> failureTokens)?  $default,) {final _that = this;
switch (_that) {
case _Data() when $default != null:
return $default(_that.successTokens,_that.failureTokens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Data implements Data {
  const _Data({@JsonKey(name: "success_tokens") required final  List<dynamic> successTokens, @JsonKey(name: "failure_tokens") required final  List<FailureToken> failureTokens}): _successTokens = successTokens,_failureTokens = failureTokens;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

 final  List<dynamic> _successTokens;
@override@JsonKey(name: "success_tokens") List<dynamic> get successTokens {
  if (_successTokens is EqualUnmodifiableListView) return _successTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_successTokens);
}

 final  List<FailureToken> _failureTokens;
@override@JsonKey(name: "failure_tokens") List<FailureToken> get failureTokens {
  if (_failureTokens is EqualUnmodifiableListView) return _failureTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_failureTokens);
}


/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&const DeepCollectionEquality().equals(other._successTokens, _successTokens)&&const DeepCollectionEquality().equals(other._failureTokens, _failureTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_successTokens),const DeepCollectionEquality().hash(_failureTokens));

@override
String toString() {
  return 'Data(successTokens: $successTokens, failureTokens: $failureTokens)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success_tokens") List<dynamic> successTokens,@JsonKey(name: "failure_tokens") List<FailureToken> failureTokens
});




}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? successTokens = null,Object? failureTokens = null,}) {
  return _then(_Data(
successTokens: null == successTokens ? _self._successTokens : successTokens // ignore: cast_nullable_to_non_nullable
as List<dynamic>,failureTokens: null == failureTokens ? _self._failureTokens : failureTokens // ignore: cast_nullable_to_non_nullable
as List<FailureToken>,
  ));
}


}


/// @nodoc
mixin _$FailureToken {

@JsonKey(name: "token") String get token;@JsonKey(name: "reason") String get reason;
/// Create a copy of FailureToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureTokenCopyWith<FailureToken> get copyWith => _$FailureTokenCopyWithImpl<FailureToken>(this as FailureToken, _$identity);

  /// Serializes this FailureToken to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureToken&&(identical(other.token, token) || other.token == token)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,reason);

@override
String toString() {
  return 'FailureToken(token: $token, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $FailureTokenCopyWith<$Res>  {
  factory $FailureTokenCopyWith(FailureToken value, $Res Function(FailureToken) _then) = _$FailureTokenCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "token") String token,@JsonKey(name: "reason") String reason
});




}
/// @nodoc
class _$FailureTokenCopyWithImpl<$Res>
    implements $FailureTokenCopyWith<$Res> {
  _$FailureTokenCopyWithImpl(this._self, this._then);

  final FailureToken _self;
  final $Res Function(FailureToken) _then;

/// Create a copy of FailureToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? reason = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FailureToken].
extension FailureTokenPatterns on FailureToken {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FailureToken value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FailureToken() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FailureToken value)  $default,){
final _that = this;
switch (_that) {
case _FailureToken():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FailureToken value)?  $default,){
final _that = this;
switch (_that) {
case _FailureToken() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "token")  String token, @JsonKey(name: "reason")  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FailureToken() when $default != null:
return $default(_that.token,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "token")  String token, @JsonKey(name: "reason")  String reason)  $default,) {final _that = this;
switch (_that) {
case _FailureToken():
return $default(_that.token,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "token")  String token, @JsonKey(name: "reason")  String reason)?  $default,) {final _that = this;
switch (_that) {
case _FailureToken() when $default != null:
return $default(_that.token,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FailureToken implements FailureToken {
  const _FailureToken({@JsonKey(name: "token") required this.token, @JsonKey(name: "reason") required this.reason});
  factory _FailureToken.fromJson(Map<String, dynamic> json) => _$FailureTokenFromJson(json);

@override@JsonKey(name: "token") final  String token;
@override@JsonKey(name: "reason") final  String reason;

/// Create a copy of FailureToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureTokenCopyWith<_FailureToken> get copyWith => __$FailureTokenCopyWithImpl<_FailureToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FailureTokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureToken&&(identical(other.token, token) || other.token == token)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,reason);

@override
String toString() {
  return 'FailureToken(token: $token, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$FailureTokenCopyWith<$Res> implements $FailureTokenCopyWith<$Res> {
  factory _$FailureTokenCopyWith(_FailureToken value, $Res Function(_FailureToken) _then) = __$FailureTokenCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "token") String token,@JsonKey(name: "reason") String reason
});




}
/// @nodoc
class __$FailureTokenCopyWithImpl<$Res>
    implements _$FailureTokenCopyWith<$Res> {
  __$FailureTokenCopyWithImpl(this._self, this._then);

  final _FailureToken _self;
  final $Res Function(_FailureToken) _then;

/// Create a copy of FailureToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? reason = null,}) {
  return _then(_FailureToken(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
