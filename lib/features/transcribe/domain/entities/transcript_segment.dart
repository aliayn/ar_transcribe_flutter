import 'package:freezed_annotation/freezed_annotation.dart';

part 'transcript_segment.freezed.dart';
part 'transcript_segment.g.dart';

enum SegmentSource {
  /// Final phrase from Deepgram (English / source audio).
  deepgram,

  /// Gemini translation of the matching phrase.
  translation,
}

@freezed
class TranscriptSegment with _$TranscriptSegment {
  const factory TranscriptSegment({
    required String id,
    required String text,
    required DateTime timestamp,
    required SegmentSource source,
    @Default(1.0) double confidence,
  }) = _TranscriptSegment;

  factory TranscriptSegment.fromJson(Map<String, dynamic> json) =>
      _$TranscriptSegmentFromJson(json);
}
