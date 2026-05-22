// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcript_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranscriptSegmentImpl _$$TranscriptSegmentImplFromJson(
        Map<String, dynamic> json) =>
    _$TranscriptSegmentImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      source: $enumDecode(_$SegmentSourceEnumMap, json['source']),
      confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$TranscriptSegmentImplToJson(
        _$TranscriptSegmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'timestamp': instance.timestamp.toIso8601String(),
      'source': _$SegmentSourceEnumMap[instance.source]!,
      'confidence': instance.confidence,
    };

const _$SegmentSourceEnumMap = {
  SegmentSource.deepgram: 'deepgram',
  SegmentSource.translation: 'translation',
};
