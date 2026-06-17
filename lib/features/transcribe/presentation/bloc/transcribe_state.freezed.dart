// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcribe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TranscribeState {
  SessionStatus get status => throw _privateConstructorUsedError;
  TranscribeSession? get session => throw _privateConstructorUsedError;
  String get livePreviewText => throw _privateConstructorUsedError;
  ArDisplayMode get displayMode => throw _privateConstructorUsedError;
  TranscribeErrorType? get errorType => throw _privateConstructorUsedError;
  String? get errorDetail => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  /// Create a copy of TranscribeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranscribeStateCopyWith<TranscribeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscribeStateCopyWith<$Res> {
  factory $TranscribeStateCopyWith(
          TranscribeState value, $Res Function(TranscribeState) then) =
      _$TranscribeStateCopyWithImpl<$Res, TranscribeState>;
  @useResult
  $Res call(
      {SessionStatus status,
      TranscribeSession? session,
      String livePreviewText,
      ArDisplayMode displayMode,
      TranscribeErrorType? errorType,
      String? errorDetail,
      bool isConnected});

  $TranscribeSessionCopyWith<$Res>? get session;
}

/// @nodoc
class _$TranscribeStateCopyWithImpl<$Res, $Val extends TranscribeState>
    implements $TranscribeStateCopyWith<$Res> {
  _$TranscribeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranscribeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? session = freezed,
    Object? livePreviewText = null,
    Object? displayMode = null,
    Object? errorType = freezed,
    Object? errorDetail = freezed,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as TranscribeSession?,
      livePreviewText: null == livePreviewText
          ? _value.livePreviewText
          : livePreviewText // ignore: cast_nullable_to_non_nullable
              as String,
      displayMode: null == displayMode
          ? _value.displayMode
          : displayMode // ignore: cast_nullable_to_non_nullable
              as ArDisplayMode,
      errorType: freezed == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as TranscribeErrorType?,
      errorDetail: freezed == errorDetail
          ? _value.errorDetail
          : errorDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of TranscribeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranscribeSessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $TranscribeSessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TranscribeStateImplCopyWith<$Res>
    implements $TranscribeStateCopyWith<$Res> {
  factory _$$TranscribeStateImplCopyWith(_$TranscribeStateImpl value,
          $Res Function(_$TranscribeStateImpl) then) =
      __$$TranscribeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SessionStatus status,
      TranscribeSession? session,
      String livePreviewText,
      ArDisplayMode displayMode,
      TranscribeErrorType? errorType,
      String? errorDetail,
      bool isConnected});

  @override
  $TranscribeSessionCopyWith<$Res>? get session;
}

/// @nodoc
class __$$TranscribeStateImplCopyWithImpl<$Res>
    extends _$TranscribeStateCopyWithImpl<$Res, _$TranscribeStateImpl>
    implements _$$TranscribeStateImplCopyWith<$Res> {
  __$$TranscribeStateImplCopyWithImpl(
      _$TranscribeStateImpl _value, $Res Function(_$TranscribeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? session = freezed,
    Object? livePreviewText = null,
    Object? displayMode = null,
    Object? errorType = freezed,
    Object? errorDetail = freezed,
    Object? isConnected = null,
  }) {
    return _then(_$TranscribeStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as TranscribeSession?,
      livePreviewText: null == livePreviewText
          ? _value.livePreviewText
          : livePreviewText // ignore: cast_nullable_to_non_nullable
              as String,
      displayMode: null == displayMode
          ? _value.displayMode
          : displayMode // ignore: cast_nullable_to_non_nullable
              as ArDisplayMode,
      errorType: freezed == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as TranscribeErrorType?,
      errorDetail: freezed == errorDetail
          ? _value.errorDetail
          : errorDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TranscribeStateImpl implements _TranscribeState {
  const _$TranscribeStateImpl(
      {this.status = SessionStatus.idle,
      this.session,
      this.livePreviewText = '',
      this.displayMode = ArDisplayMode.transcript,
      this.errorType,
      this.errorDetail,
      this.isConnected = false});

  @override
  @JsonKey()
  final SessionStatus status;
  @override
  final TranscribeSession? session;
  @override
  @JsonKey()
  final String livePreviewText;
  @override
  @JsonKey()
  final ArDisplayMode displayMode;
  @override
  final TranscribeErrorType? errorType;
  @override
  final String? errorDetail;
  @override
  @JsonKey()
  final bool isConnected;

  @override
  String toString() {
    return 'TranscribeState(status: $status, session: $session, livePreviewText: $livePreviewText, displayMode: $displayMode, errorType: $errorType, errorDetail: $errorDetail, isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.livePreviewText, livePreviewText) ||
                other.livePreviewText == livePreviewText) &&
            (identical(other.displayMode, displayMode) ||
                other.displayMode == displayMode) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType) &&
            (identical(other.errorDetail, errorDetail) ||
                other.errorDetail == errorDetail) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, session, livePreviewText,
      displayMode, errorType, errorDetail, isConnected);

  /// Create a copy of TranscribeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscribeStateImplCopyWith<_$TranscribeStateImpl> get copyWith =>
      __$$TranscribeStateImplCopyWithImpl<_$TranscribeStateImpl>(
          this, _$identity);
}

abstract class _TranscribeState implements TranscribeState {
  const factory _TranscribeState(
      {final SessionStatus status,
      final TranscribeSession? session,
      final String livePreviewText,
      final ArDisplayMode displayMode,
      final TranscribeErrorType? errorType,
      final String? errorDetail,
      final bool isConnected}) = _$TranscribeStateImpl;

  @override
  SessionStatus get status;
  @override
  TranscribeSession? get session;
  @override
  String get livePreviewText;
  @override
  ArDisplayMode get displayMode;
  @override
  TranscribeErrorType? get errorType;
  @override
  String? get errorDetail;
  @override
  bool get isConnected;

  /// Create a copy of TranscribeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscribeStateImplCopyWith<_$TranscribeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
