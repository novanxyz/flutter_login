// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_calendar_event_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetCalendarEventEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCalendarEventEventCopyWith<$Res> {
  factory $GetCalendarEventEventCopyWith(GetCalendarEventEvent value,
          $Res Function(GetCalendarEventEvent) then) =
      _$GetCalendarEventEventCopyWithImpl<$Res, GetCalendarEventEvent>;
}

/// @nodoc
class _$GetCalendarEventEventCopyWithImpl<$Res,
        $Val extends GetCalendarEventEvent>
    implements $GetCalendarEventEventCopyWith<$Res> {
  _$GetCalendarEventEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$GetCalendarEventEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'GetCalendarEventEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements GetCalendarEventEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
mixin _$GetCalendarEventState {
  Events? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  GetCalendarEventStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetCalendarEventStateCopyWith<GetCalendarEventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCalendarEventStateCopyWith<$Res> {
  factory $GetCalendarEventStateCopyWith(GetCalendarEventState value,
          $Res Function(GetCalendarEventState) then) =
      _$GetCalendarEventStateCopyWithImpl<$Res, GetCalendarEventState>;
  @useResult
  $Res call({Events? data, String? error, GetCalendarEventStatus status});
}

/// @nodoc
class _$GetCalendarEventStateCopyWithImpl<$Res,
        $Val extends GetCalendarEventState>
    implements $GetCalendarEventStateCopyWith<$Res> {
  _$GetCalendarEventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Events?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GetCalendarEventStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCalendarEventStateImplCopyWith<$Res>
    implements $GetCalendarEventStateCopyWith<$Res> {
  factory _$$GetCalendarEventStateImplCopyWith(
          _$GetCalendarEventStateImpl value,
          $Res Function(_$GetCalendarEventStateImpl) then) =
      __$$GetCalendarEventStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Events? data, String? error, GetCalendarEventStatus status});
}

/// @nodoc
class __$$GetCalendarEventStateImplCopyWithImpl<$Res>
    extends _$GetCalendarEventStateCopyWithImpl<$Res,
        _$GetCalendarEventStateImpl>
    implements _$$GetCalendarEventStateImplCopyWith<$Res> {
  __$$GetCalendarEventStateImplCopyWithImpl(_$GetCalendarEventStateImpl _value,
      $Res Function(_$GetCalendarEventStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
    Object? status = null,
  }) {
    return _then(_$GetCalendarEventStateImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Events?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GetCalendarEventStatus,
    ));
  }
}

/// @nodoc

class _$GetCalendarEventStateImpl implements _GetCalendarEventState {
  const _$GetCalendarEventStateImpl(
      {this.data, this.error, this.status = GetCalendarEventStatus.initial});

  @override
  final Events? data;
  @override
  final String? error;
  @override
  @JsonKey()
  final GetCalendarEventStatus status;

  @override
  String toString() {
    return 'GetCalendarEventState(data: $data, error: $error, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCalendarEventStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, error, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCalendarEventStateImplCopyWith<_$GetCalendarEventStateImpl>
      get copyWith => __$$GetCalendarEventStateImplCopyWithImpl<
          _$GetCalendarEventStateImpl>(this, _$identity);
}

abstract class _GetCalendarEventState implements GetCalendarEventState {
  const factory _GetCalendarEventState(
      {final Events? data,
      final String? error,
      final GetCalendarEventStatus status}) = _$GetCalendarEventStateImpl;

  @override
  Events? get data;
  @override
  String? get error;
  @override
  GetCalendarEventStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$GetCalendarEventStateImplCopyWith<_$GetCalendarEventStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
