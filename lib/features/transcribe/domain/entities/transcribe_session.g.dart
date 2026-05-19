// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcribe_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranscribeSessionImpl _$$TranscribeSessionImplFromJson(
        Map<String, dynamic> json) =>
    _$TranscribeSessionImpl(
      id: json['id'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
      language: json['language'] as String,
      segments: (json['segments'] as List<dynamic>?)
              ?.map(
                  (e) => TranscriptSegment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TranscriptSegment>[],
    );

Map<String, dynamic> _$$TranscribeSessionImplToJson(
        _$TranscribeSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt?.toIso8601String(),
      'language': instance.language,
      'segments': instance.segments,
    };
