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
    required TResult Function() connectionEstablished,
    required TResult Function(String message) connectionFailed,
    required TResult Function(String text, bool isFinal) transcriptReceived,
    required TResult Function(String text) translationReceived,
    required TResult Function(ArDisplayMode mode) displayModeChanged,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function()? connectionEstablished,
    TResult? Function(String message)? connectionFailed,
    TResult? Function(String text, bool isFinal)? transcriptReceived,
    TResult? Function(String text)? translationReceived,
    TResult? Function(ArDisplayMode mode)? displayModeChanged,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function()? connectionEstablished,
    TResult Function(String message)? connectionFailed,
    TResult Function(String text, bool isFinal)? transcriptReceived,
    TResult Function(String text)? translationReceived,
    TResult Function(ArDisplayMode mode)? displayModeChanged,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeConnectionEstablished value)
        connectionEstablished,
    required TResult Function(TranscribeConnectionFailed value)
        connectionFailed,
    required TResult Function(TranscribeTranscriptReceived value)
        transcriptReceived,
    required TResult Function(TranscribeTranslationReceived value)
        translationReceived,
    required TResult Function(TranscribeDisplayModeChanged value)
        displayModeChanged,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult? Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult? Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult? Function(TranscribeTranslationReceived value)? translationReceived,
    TResult? Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult Function(TranscribeTranslationReceived value)? translationReceived,
    TResult Function(TranscribeDisplayModeChanged value)? displayModeChanged,
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
    required TResult Function() connectionEstablished,
    required TResult Function(String message) connectionFailed,
    required TResult Function(String text, bool isFinal) transcriptReceived,
    required TResult Function(String text) translationReceived,
    required TResult Function(ArDisplayMode mode) displayModeChanged,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return started(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function()? connectionEstablished,
    TResult? Function(String message)? connectionFailed,
    TResult? Function(String text, bool isFinal)? transcriptReceived,
    TResult? Function(String text)? translationReceived,
    TResult? Function(ArDisplayMode mode)? displayModeChanged,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return started?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function()? connectionEstablished,
    TResult Function(String message)? connectionFailed,
    TResult Function(String text, bool isFinal)? transcriptReceived,
    TResult Function(String text)? translationReceived,
    TResult Function(ArDisplayMode mode)? displayModeChanged,
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
    required TResult Function(TranscribeConnectionEstablished value)
        connectionEstablished,
    required TResult Function(TranscribeConnectionFailed value)
        connectionFailed,
    required TResult Function(TranscribeTranscriptReceived value)
        transcriptReceived,
    required TResult Function(TranscribeTranslationReceived value)
        translationReceived,
    required TResult Function(TranscribeDisplayModeChanged value)
        displayModeChanged,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult? Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult? Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult? Function(TranscribeTranslationReceived value)? translationReceived,
    TResult? Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult Function(TranscribeTranslationReceived value)? translationReceived,
    TResult Function(TranscribeDisplayModeChanged value)? displayModeChanged,
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
abstract class _$$TranscribeConnectionEstablishedImplCopyWith<$Res> {
  factory _$$TranscribeConnectionEstablishedImplCopyWith(
          _$TranscribeConnectionEstablishedImpl value,
          $Res Function(_$TranscribeConnectionEstablishedImpl) then) =
      __$$TranscribeConnectionEstablishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TranscribeConnectionEstablishedImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res,
        _$TranscribeConnectionEstablishedImpl>
    implements _$$TranscribeConnectionEstablishedImplCopyWith<$Res> {
  __$$TranscribeConnectionEstablishedImplCopyWithImpl(
      _$TranscribeConnectionEstablishedImpl _value,
      $Res Function(_$TranscribeConnectionEstablishedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TranscribeConnectionEstablishedImpl
    implements TranscribeConnectionEstablished {
  const _$TranscribeConnectionEstablishedImpl();

  @override
  String toString() {
    return 'TranscribeEvent.connectionEstablished()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeConnectionEstablishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function() connectionEstablished,
    required TResult Function(String message) connectionFailed,
    required TResult Function(String text, bool isFinal) transcriptReceived,
    required TResult Function(String text) translationReceived,
    required TResult Function(ArDisplayMode mode) displayModeChanged,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return connectionEstablished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function()? connectionEstablished,
    TResult? Function(String message)? connectionFailed,
    TResult? Function(String text, bool isFinal)? transcriptReceived,
    TResult? Function(String text)? translationReceived,
    TResult? Function(ArDisplayMode mode)? displayModeChanged,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return connectionEstablished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function()? connectionEstablished,
    TResult Function(String message)? connectionFailed,
    TResult Function(String text, bool isFinal)? transcriptReceived,
    TResult Function(String text)? translationReceived,
    TResult Function(ArDisplayMode mode)? displayModeChanged,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (connectionEstablished != null) {
      return connectionEstablished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeConnectionEstablished value)
        connectionEstablished,
    required TResult Function(TranscribeConnectionFailed value)
        connectionFailed,
    required TResult Function(TranscribeTranscriptReceived value)
        transcriptReceived,
    required TResult Function(TranscribeTranslationReceived value)
        translationReceived,
    required TResult Function(TranscribeDisplayModeChanged value)
        displayModeChanged,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return connectionEstablished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult? Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult? Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult? Function(TranscribeTranslationReceived value)? translationReceived,
    TResult? Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return connectionEstablished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult Function(TranscribeTranslationReceived value)? translationReceived,
    TResult Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (connectionEstablished != null) {
      return connectionEstablished(this);
    }
    return orElse();
  }
}

abstract class TranscribeConnectionEstablished implements TranscribeEvent {
  const factory TranscribeConnectionEstablished() =
      _$TranscribeConnectionEstablishedImpl;
}

/// @nodoc
abstract class _$$TranscribeConnectionFailedImplCopyWith<$Res> {
  factory _$$TranscribeConnectionFailedImplCopyWith(
          _$TranscribeConnectionFailedImpl value,
          $Res Function(_$TranscribeConnectionFailedImpl) then) =
      __$$TranscribeConnectionFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TranscribeConnectionFailedImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res,
        _$TranscribeConnectionFailedImpl>
    implements _$$TranscribeConnectionFailedImplCopyWith<$Res> {
  __$$TranscribeConnectionFailedImplCopyWithImpl(
      _$TranscribeConnectionFailedImpl _value,
      $Res Function(_$TranscribeConnectionFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TranscribeConnectionFailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TranscribeConnectionFailedImpl implements TranscribeConnectionFailed {
  const _$TranscribeConnectionFailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TranscribeEvent.connectionFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeConnectionFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscribeConnectionFailedImplCopyWith<_$TranscribeConnectionFailedImpl>
      get copyWith => __$$TranscribeConnectionFailedImplCopyWithImpl<
          _$TranscribeConnectionFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function() connectionEstablished,
    required TResult Function(String message) connectionFailed,
    required TResult Function(String text, bool isFinal) transcriptReceived,
    required TResult Function(String text) translationReceived,
    required TResult Function(ArDisplayMode mode) displayModeChanged,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return connectionFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function()? connectionEstablished,
    TResult? Function(String message)? connectionFailed,
    TResult? Function(String text, bool isFinal)? transcriptReceived,
    TResult? Function(String text)? translationReceived,
    TResult? Function(ArDisplayMode mode)? displayModeChanged,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return connectionFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function()? connectionEstablished,
    TResult Function(String message)? connectionFailed,
    TResult Function(String text, bool isFinal)? transcriptReceived,
    TResult Function(String text)? translationReceived,
    TResult Function(ArDisplayMode mode)? displayModeChanged,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (connectionFailed != null) {
      return connectionFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeConnectionEstablished value)
        connectionEstablished,
    required TResult Function(TranscribeConnectionFailed value)
        connectionFailed,
    required TResult Function(TranscribeTranscriptReceived value)
        transcriptReceived,
    required TResult Function(TranscribeTranslationReceived value)
        translationReceived,
    required TResult Function(TranscribeDisplayModeChanged value)
        displayModeChanged,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return connectionFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult? Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult? Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult? Function(TranscribeTranslationReceived value)? translationReceived,
    TResult? Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return connectionFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult Function(TranscribeTranslationReceived value)? translationReceived,
    TResult Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (connectionFailed != null) {
      return connectionFailed(this);
    }
    return orElse();
  }
}

abstract class TranscribeConnectionFailed implements TranscribeEvent {
  const factory TranscribeConnectionFailed(final String message) =
      _$TranscribeConnectionFailedImpl;

  String get message;

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscribeConnectionFailedImplCopyWith<_$TranscribeConnectionFailedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranscribeTranscriptReceivedImplCopyWith<$Res> {
  factory _$$TranscribeTranscriptReceivedImplCopyWith(
          _$TranscribeTranscriptReceivedImpl value,
          $Res Function(_$TranscribeTranscriptReceivedImpl) then) =
      __$$TranscribeTranscriptReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text, bool isFinal});
}

/// @nodoc
class __$$TranscribeTranscriptReceivedImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res,
        _$TranscribeTranscriptReceivedImpl>
    implements _$$TranscribeTranscriptReceivedImplCopyWith<$Res> {
  __$$TranscribeTranscriptReceivedImplCopyWithImpl(
      _$TranscribeTranscriptReceivedImpl _value,
      $Res Function(_$TranscribeTranscriptReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isFinal = null,
  }) {
    return _then(_$TranscribeTranscriptReceivedImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      null == isFinal
          ? _value.isFinal
          : isFinal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TranscribeTranscriptReceivedImpl
    implements TranscribeTranscriptReceived {
  const _$TranscribeTranscriptReceivedImpl(this.text, this.isFinal);

  @override
  final String text;
  @override
  final bool isFinal;

  @override
  String toString() {
    return 'TranscribeEvent.transcriptReceived(text: $text, isFinal: $isFinal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeTranscriptReceivedImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isFinal, isFinal) || other.isFinal == isFinal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, isFinal);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscribeTranscriptReceivedImplCopyWith<
          _$TranscribeTranscriptReceivedImpl>
      get copyWith => __$$TranscribeTranscriptReceivedImplCopyWithImpl<
          _$TranscribeTranscriptReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function() connectionEstablished,
    required TResult Function(String message) connectionFailed,
    required TResult Function(String text, bool isFinal) transcriptReceived,
    required TResult Function(String text) translationReceived,
    required TResult Function(ArDisplayMode mode) displayModeChanged,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return transcriptReceived(text, isFinal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function()? connectionEstablished,
    TResult? Function(String message)? connectionFailed,
    TResult? Function(String text, bool isFinal)? transcriptReceived,
    TResult? Function(String text)? translationReceived,
    TResult? Function(ArDisplayMode mode)? displayModeChanged,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return transcriptReceived?.call(text, isFinal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function()? connectionEstablished,
    TResult Function(String message)? connectionFailed,
    TResult Function(String text, bool isFinal)? transcriptReceived,
    TResult Function(String text)? translationReceived,
    TResult Function(ArDisplayMode mode)? displayModeChanged,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (transcriptReceived != null) {
      return transcriptReceived(text, isFinal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeConnectionEstablished value)
        connectionEstablished,
    required TResult Function(TranscribeConnectionFailed value)
        connectionFailed,
    required TResult Function(TranscribeTranscriptReceived value)
        transcriptReceived,
    required TResult Function(TranscribeTranslationReceived value)
        translationReceived,
    required TResult Function(TranscribeDisplayModeChanged value)
        displayModeChanged,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return transcriptReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult? Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult? Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult? Function(TranscribeTranslationReceived value)? translationReceived,
    TResult? Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return transcriptReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult Function(TranscribeTranslationReceived value)? translationReceived,
    TResult Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (transcriptReceived != null) {
      return transcriptReceived(this);
    }
    return orElse();
  }
}

abstract class TranscribeTranscriptReceived implements TranscribeEvent {
  const factory TranscribeTranscriptReceived(
          final String text, final bool isFinal) =
      _$TranscribeTranscriptReceivedImpl;

  String get text;
  bool get isFinal;

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscribeTranscriptReceivedImplCopyWith<
          _$TranscribeTranscriptReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranscribeTranslationReceivedImplCopyWith<$Res> {
  factory _$$TranscribeTranslationReceivedImplCopyWith(
          _$TranscribeTranslationReceivedImpl value,
          $Res Function(_$TranscribeTranslationReceivedImpl) then) =
      __$$TranscribeTranslationReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$TranscribeTranslationReceivedImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res,
        _$TranscribeTranslationReceivedImpl>
    implements _$$TranscribeTranslationReceivedImplCopyWith<$Res> {
  __$$TranscribeTranslationReceivedImplCopyWithImpl(
      _$TranscribeTranslationReceivedImpl _value,
      $Res Function(_$TranscribeTranslationReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$TranscribeTranslationReceivedImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TranscribeTranslationReceivedImpl
    implements TranscribeTranslationReceived {
  const _$TranscribeTranslationReceivedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'TranscribeEvent.translationReceived(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeTranslationReceivedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscribeTranslationReceivedImplCopyWith<
          _$TranscribeTranslationReceivedImpl>
      get copyWith => __$$TranscribeTranslationReceivedImplCopyWithImpl<
          _$TranscribeTranslationReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function() connectionEstablished,
    required TResult Function(String message) connectionFailed,
    required TResult Function(String text, bool isFinal) transcriptReceived,
    required TResult Function(String text) translationReceived,
    required TResult Function(ArDisplayMode mode) displayModeChanged,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return translationReceived(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function()? connectionEstablished,
    TResult? Function(String message)? connectionFailed,
    TResult? Function(String text, bool isFinal)? transcriptReceived,
    TResult? Function(String text)? translationReceived,
    TResult? Function(ArDisplayMode mode)? displayModeChanged,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return translationReceived?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function()? connectionEstablished,
    TResult Function(String message)? connectionFailed,
    TResult Function(String text, bool isFinal)? transcriptReceived,
    TResult Function(String text)? translationReceived,
    TResult Function(ArDisplayMode mode)? displayModeChanged,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (translationReceived != null) {
      return translationReceived(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeConnectionEstablished value)
        connectionEstablished,
    required TResult Function(TranscribeConnectionFailed value)
        connectionFailed,
    required TResult Function(TranscribeTranscriptReceived value)
        transcriptReceived,
    required TResult Function(TranscribeTranslationReceived value)
        translationReceived,
    required TResult Function(TranscribeDisplayModeChanged value)
        displayModeChanged,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return translationReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult? Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult? Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult? Function(TranscribeTranslationReceived value)? translationReceived,
    TResult? Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return translationReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult Function(TranscribeTranslationReceived value)? translationReceived,
    TResult Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (translationReceived != null) {
      return translationReceived(this);
    }
    return orElse();
  }
}

abstract class TranscribeTranslationReceived implements TranscribeEvent {
  const factory TranscribeTranslationReceived(final String text) =
      _$TranscribeTranslationReceivedImpl;

  String get text;

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscribeTranslationReceivedImplCopyWith<
          _$TranscribeTranslationReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranscribeDisplayModeChangedImplCopyWith<$Res> {
  factory _$$TranscribeDisplayModeChangedImplCopyWith(
          _$TranscribeDisplayModeChangedImpl value,
          $Res Function(_$TranscribeDisplayModeChangedImpl) then) =
      __$$TranscribeDisplayModeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ArDisplayMode mode});
}

/// @nodoc
class __$$TranscribeDisplayModeChangedImplCopyWithImpl<$Res>
    extends _$TranscribeEventCopyWithImpl<$Res,
        _$TranscribeDisplayModeChangedImpl>
    implements _$$TranscribeDisplayModeChangedImplCopyWith<$Res> {
  __$$TranscribeDisplayModeChangedImplCopyWithImpl(
      _$TranscribeDisplayModeChangedImpl _value,
      $Res Function(_$TranscribeDisplayModeChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(_$TranscribeDisplayModeChangedImpl(
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ArDisplayMode,
    ));
  }
}

/// @nodoc

class _$TranscribeDisplayModeChangedImpl
    implements TranscribeDisplayModeChanged {
  const _$TranscribeDisplayModeChangedImpl(this.mode);

  @override
  final ArDisplayMode mode;

  @override
  String toString() {
    return 'TranscribeEvent.displayModeChanged(mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeDisplayModeChangedImpl &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscribeDisplayModeChangedImplCopyWith<
          _$TranscribeDisplayModeChangedImpl>
      get copyWith => __$$TranscribeDisplayModeChangedImplCopyWithImpl<
          _$TranscribeDisplayModeChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppSettings settings) started,
    required TResult Function() connectionEstablished,
    required TResult Function(String message) connectionFailed,
    required TResult Function(String text, bool isFinal) transcriptReceived,
    required TResult Function(String text) translationReceived,
    required TResult Function(ArDisplayMode mode) displayModeChanged,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return displayModeChanged(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function()? connectionEstablished,
    TResult? Function(String message)? connectionFailed,
    TResult? Function(String text, bool isFinal)? transcriptReceived,
    TResult? Function(String text)? translationReceived,
    TResult? Function(ArDisplayMode mode)? displayModeChanged,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return displayModeChanged?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function()? connectionEstablished,
    TResult Function(String message)? connectionFailed,
    TResult Function(String text, bool isFinal)? transcriptReceived,
    TResult Function(String text)? translationReceived,
    TResult Function(ArDisplayMode mode)? displayModeChanged,
    TResult Function()? stopped,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (displayModeChanged != null) {
      return displayModeChanged(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TranscribeStarted value) started,
    required TResult Function(TranscribeConnectionEstablished value)
        connectionEstablished,
    required TResult Function(TranscribeConnectionFailed value)
        connectionFailed,
    required TResult Function(TranscribeTranscriptReceived value)
        transcriptReceived,
    required TResult Function(TranscribeTranslationReceived value)
        translationReceived,
    required TResult Function(TranscribeDisplayModeChanged value)
        displayModeChanged,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return displayModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult? Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult? Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult? Function(TranscribeTranslationReceived value)? translationReceived,
    TResult? Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return displayModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult Function(TranscribeTranslationReceived value)? translationReceived,
    TResult Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult Function(TranscribeStopped value)? stopped,
    TResult Function(TranscribeReset value)? reset,
    required TResult orElse(),
  }) {
    if (displayModeChanged != null) {
      return displayModeChanged(this);
    }
    return orElse();
  }
}

abstract class TranscribeDisplayModeChanged implements TranscribeEvent {
  const factory TranscribeDisplayModeChanged(final ArDisplayMode mode) =
      _$TranscribeDisplayModeChangedImpl;

  ArDisplayMode get mode;

  /// Create a copy of TranscribeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscribeDisplayModeChangedImplCopyWith<
          _$TranscribeDisplayModeChangedImpl>
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
    required TResult Function() connectionEstablished,
    required TResult Function(String message) connectionFailed,
    required TResult Function(String text, bool isFinal) transcriptReceived,
    required TResult Function(String text) translationReceived,
    required TResult Function(ArDisplayMode mode) displayModeChanged,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function()? connectionEstablished,
    TResult? Function(String message)? connectionFailed,
    TResult? Function(String text, bool isFinal)? transcriptReceived,
    TResult? Function(String text)? translationReceived,
    TResult? Function(ArDisplayMode mode)? displayModeChanged,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return stopped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function()? connectionEstablished,
    TResult Function(String message)? connectionFailed,
    TResult Function(String text, bool isFinal)? transcriptReceived,
    TResult Function(String text)? translationReceived,
    TResult Function(ArDisplayMode mode)? displayModeChanged,
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
    required TResult Function(TranscribeConnectionEstablished value)
        connectionEstablished,
    required TResult Function(TranscribeConnectionFailed value)
        connectionFailed,
    required TResult Function(TranscribeTranscriptReceived value)
        transcriptReceived,
    required TResult Function(TranscribeTranslationReceived value)
        translationReceived,
    required TResult Function(TranscribeDisplayModeChanged value)
        displayModeChanged,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult? Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult? Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult? Function(TranscribeTranslationReceived value)? translationReceived,
    TResult? Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult Function(TranscribeTranslationReceived value)? translationReceived,
    TResult Function(TranscribeDisplayModeChanged value)? displayModeChanged,
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
    required TResult Function() connectionEstablished,
    required TResult Function(String message) connectionFailed,
    required TResult Function(String text, bool isFinal) transcriptReceived,
    required TResult Function(String text) translationReceived,
    required TResult Function(ArDisplayMode mode) displayModeChanged,
    required TResult Function() stopped,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppSettings settings)? started,
    TResult? Function()? connectionEstablished,
    TResult? Function(String message)? connectionFailed,
    TResult? Function(String text, bool isFinal)? transcriptReceived,
    TResult? Function(String text)? translationReceived,
    TResult? Function(ArDisplayMode mode)? displayModeChanged,
    TResult? Function()? stopped,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppSettings settings)? started,
    TResult Function()? connectionEstablished,
    TResult Function(String message)? connectionFailed,
    TResult Function(String text, bool isFinal)? transcriptReceived,
    TResult Function(String text)? translationReceived,
    TResult Function(ArDisplayMode mode)? displayModeChanged,
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
    required TResult Function(TranscribeConnectionEstablished value)
        connectionEstablished,
    required TResult Function(TranscribeConnectionFailed value)
        connectionFailed,
    required TResult Function(TranscribeTranscriptReceived value)
        transcriptReceived,
    required TResult Function(TranscribeTranslationReceived value)
        translationReceived,
    required TResult Function(TranscribeDisplayModeChanged value)
        displayModeChanged,
    required TResult Function(TranscribeStopped value) stopped,
    required TResult Function(TranscribeReset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TranscribeStarted value)? started,
    TResult? Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult? Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult? Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult? Function(TranscribeTranslationReceived value)? translationReceived,
    TResult? Function(TranscribeDisplayModeChanged value)? displayModeChanged,
    TResult? Function(TranscribeStopped value)? stopped,
    TResult? Function(TranscribeReset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TranscribeStarted value)? started,
    TResult Function(TranscribeConnectionEstablished value)?
        connectionEstablished,
    TResult Function(TranscribeConnectionFailed value)? connectionFailed,
    TResult Function(TranscribeTranscriptReceived value)? transcriptReceived,
    TResult Function(TranscribeTranslationReceived value)? translationReceived,
    TResult Function(TranscribeDisplayModeChanged value)? displayModeChanged,
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
