// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcribe_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TranscribeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function(String text) livePreviewUpdated,
    required TResult Function() chunkTimerFired,
    required TResult Function(String text) voskSegmentAdded,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function(String text)? livePreviewUpdated,
    TResult? Function()? chunkTimerFired,
    TResult? Function(String text)? voskSegmentAdded,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function(String text)? livePreviewUpdated,
    TResult Function()? chunkTimerFired,
    TResult Function(String text)? voskSegmentAdded,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeLivePreviewUpdated value)
        livePreviewUpdated,
    required TResult Function(TranscribeChunkTimerFired value) chunkTimerFired,
    required TResult Function(TranscribeVoskSegmentAdded value)
        voskSegmentAdded,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult? Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult? Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscribeEventCopyWith<$Res> {
  factory $TranscribeEventCopyWith(
          TranscribeEvent value, $Res Function(TranscribeEvent) then) =
      _$TranscribeEventCopyWithImpl<$Res, TranscribeEvent>;
}

/// @nodoc
class _$TranscribeEventCopyWithImpl<$Res, $Val extends TranscribeEvent>
    implements $TranscribeEventCopyWith<$Res> {
  _$TranscribeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TranscribeStartedImplCopyWith<$Res> {
  factory _$$TranscribeStartedImplCopyWith(_$TranscribeStartedImpl value,
          $Res Function(_$TranscribeStartedImpl) then) =
      __$$TranscribeStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppSettings settings});

  $AppSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$TranscribeStartedImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res, _$TranscribeStartedImpl>
    implements _$$TranscribeStartedImplCopyWith<$Res> {
  __$$TranscribeStartedImplCopyWithImpl(_$TranscribeStartedImpl _value,
      $Res Function(_$TranscribeStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
  }) {
    return _then(_$TranscribeStartedImpl(
      null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettings,
    ));
  }

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<$Res> get settings {
    return $AppSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc

class _$TranscribeStartedImpl implements TranscribeStarted {
  const _$TranscribeStartedImpl(this.settings);

  @override
  final AppSettings settings;

  @override
  String toString() {
    return 'TranscribeEvent.started(settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeStartedImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscribeStartedImplCopyWith<_$TranscribeStartedImpl> get copyWith =>
      __$$TranscribeStartedImplCopyWithImpl<_$TranscribeStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function(String text) livePreviewUpdated,
    required TResult Function() chunkTimerFired,
    required TResult Function(String text) voskSegmentAdded,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return started(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function(String text)? livePreviewUpdated,
    TResult? Function()? chunkTimerFired,
    TResult? Function(String text)? voskSegmentAdded,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return started?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function(String text)? livePreviewUpdated,
    TResult Function()? chunkTimerFired,
    TResult Function(String text)? voskSegmentAdded,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeLivePreviewUpdated value)
        livePreviewUpdated,
    required TResult Function(TranscribeChunkTimerFired value) chunkTimerFired,
    required TResult Function(TranscribeVoskSegmentAdded value)
        voskSegmentAdded,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult? Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult? Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class TranscribeStarted implements TranscribeEvent {
  const factory TranscribeStarted(final AppSettings settings) =
      _$TranscribeStartedImpl;

  AppSettings get settings;

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscribeStartedImplCopyWith<_$TranscribeStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranscribeLivePreviewUpdatedImplCopyWith<$Res> {
  factory _$$TranscribeLivePreviewUpdatedImplCopyWith(
          _$TranscribeLivePreviewUpdatedImpl value,
          $Res Function(_$TranscribeLivePreviewUpdatedImpl) then) =
      __$$TranscribeLivePreviewUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$TranscribeLivePreviewUpdatedImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res,
        _$TranscribeLivePreviewUpdatedImpl>
    implements _$$TranscribeLivePreviewUpdatedImplCopyWith<$Res> {
  __$$TranscribeLivePreviewUpdatedImplCopyWithImpl(
      _$TranscribeLivePreviewUpdatedImpl _value,
      $Res Function(_$TranscribeLivePreviewUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$TranscribeLivePreviewUpdatedImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TranscribeLivePreviewUpdatedImpl
    implements TranscribeLivePreviewUpdated {
  const _$TranscribeLivePreviewUpdatedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'TranscribeEvent.livePreviewUpdated(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeLivePreviewUpdatedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscribeLivePreviewUpdatedImplCopyWith<
          _$TranscribeLivePreviewUpdatedImpl>
      get copyWith => __$$TranscribeLivePreviewUpdatedImplCopyWithImpl<
          _$TranscribeLivePreviewUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function(String text) livePreviewUpdated,
    required TResult Function() chunkTimerFired,
    required TResult Function(String text) voskSegmentAdded,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return livePreviewUpdated(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function(String text)? livePreviewUpdated,
    TResult? Function()? chunkTimerFired,
    TResult? Function(String text)? voskSegmentAdded,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return livePreviewUpdated?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function(String text)? livePreviewUpdated,
    TResult Function()? chunkTimerFired,
    TResult Function(String text)? voskSegmentAdded,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (livePreviewUpdated != null) {
      return livePreviewUpdated(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeLivePreviewUpdated value)
        livePreviewUpdated,
    required TResult Function(TranscribeChunkTimerFired value) chunkTimerFired,
    required TResult Function(TranscribeVoskSegmentAdded value)
        voskSegmentAdded,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return livePreviewUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult? Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult? Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return livePreviewUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (livePreviewUpdated != null) {
      return livePreviewUpdated(this);
    }
    return orElse();
  }
}

abstract class TranscribeLivePreviewUpdated implements TranscribeEvent {
  const factory TranscribeLivePreviewUpdated(final String text) =
      _$TranscribeLivePreviewUpdatedImpl;

  String get text;

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscribeLivePreviewUpdatedImplCopyWith<
          _$TranscribeLivePreviewUpdatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranscribeChunkTimerFiredImplCopyWith<$Res> {
  factory _$$TranscribeChunkTimerFiredImplCopyWith(
          _$TranscribeChunkTimerFiredImpl value,
          $Res Function(_$TranscribeChunkTimerFiredImpl) then) =
      __$$TranscribeChunkTimerFiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TranscribeChunkTimerFiredImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res, _$TranscribeChunkTimerFiredImpl>
    implements _$$TranscribeChunkTimerFiredImplCopyWith<$Res> {
  __$$TranscribeChunkTimerFiredImplCopyWithImpl(
      _$TranscribeChunkTimerFiredImpl _value,
      $Res Function(_$TranscribeChunkTimerFiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TranscribeChunkTimerFiredImpl implements TranscribeChunkTimerFired {
  const _$TranscribeChunkTimerFiredImpl();

  @override
  String toString() {
    return 'TranscribeEvent.chunkTimerFired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeChunkTimerFiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function(String text) livePreviewUpdated,
    required TResult Function() chunkTimerFired,
    required TResult Function(String text) voskSegmentAdded,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return chunkTimerFired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function(String text)? livePreviewUpdated,
    TResult? Function()? chunkTimerFired,
    TResult? Function(String text)? voskSegmentAdded,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return chunkTimerFired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function(String text)? livePreviewUpdated,
    TResult Function()? chunkTimerFired,
    TResult Function(String text)? voskSegmentAdded,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (chunkTimerFired != null) {
      return chunkTimerFired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeLivePreviewUpdated value)
        livePreviewUpdated,
    required TResult Function(TranscribeChunkTimerFired value) chunkTimerFired,
    required TResult Function(TranscribeVoskSegmentAdded value)
        voskSegmentAdded,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return chunkTimerFired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult? Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult? Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return chunkTimerFired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (chunkTimerFired != null) {
      return chunkTimerFired(this);
    }
    return orElse();
  }
}

abstract class TranscribeChunkTimerFired implements TranscribeEvent {
  const factory TranscribeChunkTimerFired() = _$TranscribeChunkTimerFiredImpl;
}

/// @nodoc
abstract class _$$TranscribeVoskSegmentAddedImplCopyWith<$Res> {
  factory _$$TranscribeVoskSegmentAddedImplCopyWith(
          _$TranscribeVoskSegmentAddedImpl value,
          $Res Function(_$TranscribeVoskSegmentAddedImpl) then) =
      __$$TranscribeVoskSegmentAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$TranscribeVoskSegmentAddedImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res,
        _$TranscribeVoskSegmentAddedImpl>
    implements _$$TranscribeVoskSegmentAddedImplCopyWith<$Res> {
  __$$TranscribeVoskSegmentAddedImplCopyWithImpl(
      _$TranscribeVoskSegmentAddedImpl _value,
      $Res Function(_$TranscribeVoskSegmentAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$TranscribeVoskSegmentAddedImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TranscribeVoskSegmentAddedImpl implements TranscribeVoskSegmentAdded {
  const _$TranscribeVoskSegmentAddedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'TranscribeEvent.voskSegmentAdded(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeVoskSegmentAddedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscribeVoskSegmentAddedImplCopyWith<_$TranscribeVoskSegmentAddedImpl>
      get copyWith => __$$TranscribeVoskSegmentAddedImplCopyWithImpl<
          _$TranscribeVoskSegmentAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function(String text) livePreviewUpdated,
    required TResult Function() chunkTimerFired,
    required TResult Function(String text) voskSegmentAdded,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return voskSegmentAdded(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function(String text)? livePreviewUpdated,
    TResult? Function()? chunkTimerFired,
    TResult? Function(String text)? voskSegmentAdded,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return voskSegmentAdded?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function(String text)? livePreviewUpdated,
    TResult Function()? chunkTimerFired,
    TResult Function(String text)? voskSegmentAdded,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (voskSegmentAdded != null) {
      return voskSegmentAdded(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeLivePreviewUpdated value)
        livePreviewUpdated,
    required TResult Function(TranscribeChunkTimerFired value) chunkTimerFired,
    required TResult Function(TranscribeVoskSegmentAdded value)
        voskSegmentAdded,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return voskSegmentAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult? Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult? Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return voskSegmentAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (voskSegmentAdded != null) {
      return voskSegmentAdded(this);
    }
    return orElse();
  }
}

abstract class TranscribeVoskSegmentAdded implements TranscribeEvent {
  const factory TranscribeVoskSegmentAdded(final String text) =
      _$TranscribeVoskSegmentAddedImpl;

  String get text;

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscribeVoskSegmentAddedImplCopyWith<_$TranscribeVoskSegmentAddedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranscribeStoppedImplCopyWith<$Res> {
  factory _$$TranscribeStoppedImplCopyWith(_$TranscribeStoppedImpl value,
          $Res Function(_$TranscribeStoppedImpl) then) =
      __$$TranscribeStoppedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TranscribeStoppedImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res, _$TranscribeStoppedImpl>
    implements _$$TranscribeStoppedImplCopyWith<$Res> {
  __$$TranscribeStoppedImplCopyWithImpl(_$TranscribeStoppedImpl _value,
      $Res Function(_$TranscribeStoppedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TranscribeStoppedImpl implements TranscribeStopped {
  const _$TranscribeStoppedImpl();

  @override
  String toString() {
    return 'TranscribeEvent.stopped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TranscribeStoppedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function(String text) livePreviewUpdated,
    required TResult Function() chunkTimerFired,
    required TResult Function(String text) voskSegmentAdded,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function(String text)? livePreviewUpdated,
    TResult? Function()? chunkTimerFired,
    TResult? Function(String text)? voskSegmentAdded,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return stopped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function(String text)? livePreviewUpdated,
    TResult Function()? chunkTimerFired,
    TResult Function(String text)? voskSegmentAdded,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeLivePreviewUpdated value)
        livePreviewUpdated,
    required TResult Function(TranscribeChunkTimerFired value) chunkTimerFired,
    required TResult Function(TranscribeVoskSegmentAdded value)
        voskSegmentAdded,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult? Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult? Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class TranscribeStopped implements TranscribeEvent {
  const factory TranscribeStopped() = _$TranscribeStoppedImpl;
}

/// @nodoc
abstract class _$$TranscribeResetImplCopyWith<$Res> {
  factory _$$TranscribeResetImplCopyWith(_$TranscribeResetImpl value,
          $Res Function(_$TranscribeResetImpl) then) =
      __$$TranscribeResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TranscribeResetImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res, _$TranscribeResetImpl>
    implements _$$TranscribeResetImplCopyWith<$Res> {
  __$$TranscribeResetImplCopyWithImpl(
      _$TranscribeResetImpl _value, $Res Function(_$TranscribeResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TranscribeResetImpl implements TranscribeReset {
  const _$TranscribeResetImpl();

  @override
  String toString() {
    return 'TranscribeEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TranscribeResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function(String text) livePreviewUpdated,
    required TResult Function() chunkTimerFired,
    required TResult Function(String text) voskSegmentAdded,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function(String text)? livePreviewUpdated,
    TResult? Function()? chunkTimerFired,
    TResult? Function(String text)? voskSegmentAdded,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function(String text)? livePreviewUpdated,
    TResult Function()? chunkTimerFired,
    TResult Function(String text)? voskSegmentAdded,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeLivePreviewUpdated value)
        livePreviewUpdated,
    required TResult Function(TranscribeChunkTimerFired value) chunkTimerFired,
    required TResult Function(TranscribeVoskSegmentAdded value)
        voskSegmentAdded,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult? Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult? Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeLivePreviewUpdated value)? livePreviewUpdated,
    TResult Function(TranscribeChunkTimerFired value)? chunkTimerFired,
    TResult Function(TranscribeVoskSegmentAdded value)? voskSegmentAdded,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class TranscribeReset implements TranscribeEvent {
  const factory TranscribeReset() = _$TranscribeResetImpl;
}
