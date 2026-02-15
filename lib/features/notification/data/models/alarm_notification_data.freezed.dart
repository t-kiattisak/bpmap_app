// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_notification_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlarmNotificationData {

@JsonKey(name: 'urgency') String? get urgency;@JsonKey(name: 'center') AlarmCenter? get center;@JsonKey(name: 'alarm_id') String? get alarmId;@JsonKey(name: 'type') String? get type;@JsonKey(name: 'signal') String? get signal;@JsonKey(name: 'content') String? get content;
/// Create a copy of AlarmNotificationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmNotificationDataCopyWith<AlarmNotificationData> get copyWith => _$AlarmNotificationDataCopyWithImpl<AlarmNotificationData>(this as AlarmNotificationData, _$identity);

  /// Serializes this AlarmNotificationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmNotificationData&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.center, center) || other.center == center)&&(identical(other.alarmId, alarmId) || other.alarmId == alarmId)&&(identical(other.type, type) || other.type == type)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,urgency,center,alarmId,type,signal,content);

@override
String toString() {
  return 'AlarmNotificationData(urgency: $urgency, center: $center, alarmId: $alarmId, type: $type, signal: $signal, content: $content)';
}


}

/// @nodoc
abstract mixin class $AlarmNotificationDataCopyWith<$Res>  {
  factory $AlarmNotificationDataCopyWith(AlarmNotificationData value, $Res Function(AlarmNotificationData) _then) = _$AlarmNotificationDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'urgency') String? urgency,@JsonKey(name: 'center') AlarmCenter? center,@JsonKey(name: 'alarm_id') String? alarmId,@JsonKey(name: 'type') String? type,@JsonKey(name: 'signal') String? signal,@JsonKey(name: 'content') String? content
});


$AlarmCenterCopyWith<$Res>? get center;

}
/// @nodoc
class _$AlarmNotificationDataCopyWithImpl<$Res>
    implements $AlarmNotificationDataCopyWith<$Res> {
  _$AlarmNotificationDataCopyWithImpl(this._self, this._then);

  final AlarmNotificationData _self;
  final $Res Function(AlarmNotificationData) _then;

/// Create a copy of AlarmNotificationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? urgency = freezed,Object? center = freezed,Object? alarmId = freezed,Object? type = freezed,Object? signal = freezed,Object? content = freezed,}) {
  return _then(_self.copyWith(
urgency: freezed == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as String?,center: freezed == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as AlarmCenter?,alarmId: freezed == alarmId ? _self.alarmId : alarmId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,signal: freezed == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AlarmNotificationData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlarmCenterCopyWith<$Res>? get center {
    if (_self.center == null) {
    return null;
  }

  return $AlarmCenterCopyWith<$Res>(_self.center!, (value) {
    return _then(_self.copyWith(center: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlarmNotificationData].
extension AlarmNotificationDataPatterns on AlarmNotificationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmNotificationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmNotificationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmNotificationData value)  $default,){
final _that = this;
switch (_that) {
case _AlarmNotificationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmNotificationData value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmNotificationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'urgency')  String? urgency, @JsonKey(name: 'center')  AlarmCenter? center, @JsonKey(name: 'alarm_id')  String? alarmId, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'signal')  String? signal, @JsonKey(name: 'content')  String? content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmNotificationData() when $default != null:
return $default(_that.urgency,_that.center,_that.alarmId,_that.type,_that.signal,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'urgency')  String? urgency, @JsonKey(name: 'center')  AlarmCenter? center, @JsonKey(name: 'alarm_id')  String? alarmId, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'signal')  String? signal, @JsonKey(name: 'content')  String? content)  $default,) {final _that = this;
switch (_that) {
case _AlarmNotificationData():
return $default(_that.urgency,_that.center,_that.alarmId,_that.type,_that.signal,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'urgency')  String? urgency, @JsonKey(name: 'center')  AlarmCenter? center, @JsonKey(name: 'alarm_id')  String? alarmId, @JsonKey(name: 'type')  String? type, @JsonKey(name: 'signal')  String? signal, @JsonKey(name: 'content')  String? content)?  $default,) {final _that = this;
switch (_that) {
case _AlarmNotificationData() when $default != null:
return $default(_that.urgency,_that.center,_that.alarmId,_that.type,_that.signal,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlarmNotificationData implements AlarmNotificationData {
  const _AlarmNotificationData({@JsonKey(name: 'urgency') this.urgency, @JsonKey(name: 'center') this.center, @JsonKey(name: 'alarm_id') this.alarmId, @JsonKey(name: 'type') this.type, @JsonKey(name: 'signal') this.signal, @JsonKey(name: 'content') this.content});
  factory _AlarmNotificationData.fromJson(Map<String, dynamic> json) => _$AlarmNotificationDataFromJson(json);

@override@JsonKey(name: 'urgency') final  String? urgency;
@override@JsonKey(name: 'center') final  AlarmCenter? center;
@override@JsonKey(name: 'alarm_id') final  String? alarmId;
@override@JsonKey(name: 'type') final  String? type;
@override@JsonKey(name: 'signal') final  String? signal;
@override@JsonKey(name: 'content') final  String? content;

/// Create a copy of AlarmNotificationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmNotificationDataCopyWith<_AlarmNotificationData> get copyWith => __$AlarmNotificationDataCopyWithImpl<_AlarmNotificationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlarmNotificationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmNotificationData&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.center, center) || other.center == center)&&(identical(other.alarmId, alarmId) || other.alarmId == alarmId)&&(identical(other.type, type) || other.type == type)&&(identical(other.signal, signal) || other.signal == signal)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,urgency,center,alarmId,type,signal,content);

@override
String toString() {
  return 'AlarmNotificationData(urgency: $urgency, center: $center, alarmId: $alarmId, type: $type, signal: $signal, content: $content)';
}


}

/// @nodoc
abstract mixin class _$AlarmNotificationDataCopyWith<$Res> implements $AlarmNotificationDataCopyWith<$Res> {
  factory _$AlarmNotificationDataCopyWith(_AlarmNotificationData value, $Res Function(_AlarmNotificationData) _then) = __$AlarmNotificationDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'urgency') String? urgency,@JsonKey(name: 'center') AlarmCenter? center,@JsonKey(name: 'alarm_id') String? alarmId,@JsonKey(name: 'type') String? type,@JsonKey(name: 'signal') String? signal,@JsonKey(name: 'content') String? content
});


@override $AlarmCenterCopyWith<$Res>? get center;

}
/// @nodoc
class __$AlarmNotificationDataCopyWithImpl<$Res>
    implements _$AlarmNotificationDataCopyWith<$Res> {
  __$AlarmNotificationDataCopyWithImpl(this._self, this._then);

  final _AlarmNotificationData _self;
  final $Res Function(_AlarmNotificationData) _then;

/// Create a copy of AlarmNotificationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? urgency = freezed,Object? center = freezed,Object? alarmId = freezed,Object? type = freezed,Object? signal = freezed,Object? content = freezed,}) {
  return _then(_AlarmNotificationData(
urgency: freezed == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as String?,center: freezed == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as AlarmCenter?,alarmId: freezed == alarmId ? _self.alarmId : alarmId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,signal: freezed == signal ? _self.signal : signal // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AlarmNotificationData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlarmCenterCopyWith<$Res>? get center {
    if (_self.center == null) {
    return null;
  }

  return $AlarmCenterCopyWith<$Res>(_self.center!, (value) {
    return _then(_self.copyWith(center: value));
  });
}
}


/// @nodoc
mixin _$AlarmCenter {

@JsonKey(name: 'lat') double? get lat;@JsonKey(name: 'lng') double? get lng;@JsonKey(name: 'radius') num? get radius;
/// Create a copy of AlarmCenter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmCenterCopyWith<AlarmCenter> get copyWith => _$AlarmCenterCopyWithImpl<AlarmCenter>(this as AlarmCenter, _$identity);

  /// Serializes this AlarmCenter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmCenter&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.radius, radius) || other.radius == radius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,radius);

@override
String toString() {
  return 'AlarmCenter(lat: $lat, lng: $lng, radius: $radius)';
}


}

/// @nodoc
abstract mixin class $AlarmCenterCopyWith<$Res>  {
  factory $AlarmCenterCopyWith(AlarmCenter value, $Res Function(AlarmCenter) _then) = _$AlarmCenterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lat') double? lat,@JsonKey(name: 'lng') double? lng,@JsonKey(name: 'radius') num? radius
});




}
/// @nodoc
class _$AlarmCenterCopyWithImpl<$Res>
    implements $AlarmCenterCopyWith<$Res> {
  _$AlarmCenterCopyWithImpl(this._self, this._then);

  final AlarmCenter _self;
  final $Res Function(AlarmCenter) _then;

/// Create a copy of AlarmCenter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = freezed,Object? lng = freezed,Object? radius = freezed,}) {
  return _then(_self.copyWith(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,radius: freezed == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlarmCenter].
extension AlarmCenterPatterns on AlarmCenter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmCenter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmCenter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmCenter value)  $default,){
final _that = this;
switch (_that) {
case _AlarmCenter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmCenter value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmCenter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lat')  double? lat, @JsonKey(name: 'lng')  double? lng, @JsonKey(name: 'radius')  num? radius)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmCenter() when $default != null:
return $default(_that.lat,_that.lng,_that.radius);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lat')  double? lat, @JsonKey(name: 'lng')  double? lng, @JsonKey(name: 'radius')  num? radius)  $default,) {final _that = this;
switch (_that) {
case _AlarmCenter():
return $default(_that.lat,_that.lng,_that.radius);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lat')  double? lat, @JsonKey(name: 'lng')  double? lng, @JsonKey(name: 'radius')  num? radius)?  $default,) {final _that = this;
switch (_that) {
case _AlarmCenter() when $default != null:
return $default(_that.lat,_that.lng,_that.radius);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlarmCenter implements AlarmCenter {
  const _AlarmCenter({@JsonKey(name: 'lat') this.lat, @JsonKey(name: 'lng') this.lng, @JsonKey(name: 'radius') this.radius});
  factory _AlarmCenter.fromJson(Map<String, dynamic> json) => _$AlarmCenterFromJson(json);

@override@JsonKey(name: 'lat') final  double? lat;
@override@JsonKey(name: 'lng') final  double? lng;
@override@JsonKey(name: 'radius') final  num? radius;

/// Create a copy of AlarmCenter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmCenterCopyWith<_AlarmCenter> get copyWith => __$AlarmCenterCopyWithImpl<_AlarmCenter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlarmCenterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmCenter&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.radius, radius) || other.radius == radius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,radius);

@override
String toString() {
  return 'AlarmCenter(lat: $lat, lng: $lng, radius: $radius)';
}


}

/// @nodoc
abstract mixin class _$AlarmCenterCopyWith<$Res> implements $AlarmCenterCopyWith<$Res> {
  factory _$AlarmCenterCopyWith(_AlarmCenter value, $Res Function(_AlarmCenter) _then) = __$AlarmCenterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lat') double? lat,@JsonKey(name: 'lng') double? lng,@JsonKey(name: 'radius') num? radius
});




}
/// @nodoc
class __$AlarmCenterCopyWithImpl<$Res>
    implements _$AlarmCenterCopyWith<$Res> {
  __$AlarmCenterCopyWithImpl(this._self, this._then);

  final _AlarmCenter _self;
  final $Res Function(_AlarmCenter) _then;

/// Create a copy of AlarmCenter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = freezed,Object? lng = freezed,Object? radius = freezed,}) {
  return _then(_AlarmCenter(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,radius: freezed == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}


}

// dart format on
