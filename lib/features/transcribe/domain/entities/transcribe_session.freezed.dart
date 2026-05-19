// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcribe_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TranscribeSession _$TranscribeSessionFromJson(Map<String, dynamic> json) {
  return _TranscribeSession.fromJson(json);
}

/// @nodoc
mixin _$TranscribeSession {
  String get id => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get endedAt => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  List<TranscriptSegment> get segments => throw _privateConstructorUsedError;

  /// Serializes this TranscribeSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranscribeSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranscribeSessionCopyWith<TranscribeSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscribeSessionCopyWith<$Res> {
  factory $TranscribeSessionCopyWith(
          TranscribeSession value, $Res Function(TranscribeSession) then) =
      _$TranscribeSessionCopyWithImpl<$Res, TranscribeSession>;
  @useResult
  $Res call(
      {String id,
      DateTime startedAt,
      DateTime? endedAt,
      String language,
      List<TranscriptSegment> segments});
}

/// @nodoc
class _$TranscribeSessionCopyWithImpl<$Res, $Val extends TranscribeSession>
    implements $TranscribeSessionCopyWith<$Res> {
  _$TranscribeSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranscribeSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? language = null,
    Object? segments = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      segments: null == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<TranscriptSegment>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranscribeSessionImplCopyWith<$Res>
    implements $TranscribeSessionCopyWith<$Res> {
  factory _$$TranscribeSessionImplCopyWith(_$TranscribeSessionImpl value,
          $Res Function(_$TranscribeSessionImpl) then) =
      __$$TranscribeSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime startedAt,
      DateTime? endedAt,
      String language,
      List<TranscriptSegment> segments});
}

/// @nodoc
class __$$TranscribeSessionImplCopyWithImpl<$Res>
    extends _$TranscribeSessionCopyWithImpl<$Res, _$TranscribeSessionImpl>
    implements _$$TranscribeSessionImplCopyWith<$Res> {
  __$$TranscribeSessionImplCopyWithImpl(_$TranscribeSessionImpl _value,
      $Res Function(_$TranscribeSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscribeSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? language = null,
    Object? segments = null,
  }) {
    return _then(_$TranscribeSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      segments: null == segments
          ? _value._segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<TranscriptSegment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranscribeSessionImpl extends _TranscribeSession {
  const _$TranscribeSessionImpl(
      {required this.id,
      required this.startedAt,
      this.endedAt,
      required this.language,
      final List<TranscriptSegment> segments = const <TranscriptSegment>[]})
      : _segments = segments,
        super._();

  factory _$TranscribeSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranscribeSessionImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime startedAt;
  @override
  final DateTime? endedAt;
  @override
  final String language;
  final List<TranscriptSegment> _segments;
  @override
  @JsonKey()
  List<TranscriptSegment> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  @override
  String toString() {
    return 'TranscribeSession(id: $id, startedAt: $startedAt, endedAt: $endedAt, language: $language, segments: $segments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscribeSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._segments, _segments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, startedAt, endedAt, language,
      const DeepCollectionEquality().hash(_segments));

  /// Create a copy of TranscribeSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscribeSessionImplCopyWith<_$TranscribeSessionImpl> get copyWith =>
      __$$TranscribeSessionImplCopyWithImpl<_$TranscribeSessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranscribeSessionImplToJson(
      this,
    );
  }
}

abstract class _TranscribeSession extends TranscribeSession {
  const factory _TranscribeSession(
      {required final String id,
      required final DateTime startedAt,
      final DateTime? endedAt,
      required final String language,
      final List<TranscriptSegment> segments}) = _$TranscribeSessionImpl;
  const _TranscribeSession._() : super._();

  factory _TranscribeSession.fromJson(Map<String, dynamic> json) =
      _$TranscribeSessionImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get startedAt;
  @override
  DateTime? get endedAt;
  @override
  String get language;
  @override
  List<TranscriptSegment> get segments;

  /// Create a copy of TranscribeSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscribeSessionImplCopyWith<_$TranscribeSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
