import 'package:freezed_annotation/freezed_annotation.dart';

import 'transcript_segment.dart';

part 'transcribe_session.freezed.dart';
part 'transcribe_session.g.dart';

@freezed
class TranscribeSession with _$TranscribeSession {
  const TranscribeSession._();

  const factory TranscribeSession({
    required String id,
    required DateTime startedAt,
    DateTime? endedAt,
    required String language,
    @Default(<TranscriptSegment>[]) List<TranscriptSegment> segments,
  }) = _TranscribeSession;

  String get fullText => segments
      .where((segment) => segment.source == SegmentSource.deepgram)
      .map((segment) => segment.text.trim())
      .where((text) => text.isNotEmpty)
      .join(' ');

  String get translationText => segments
      .where((segment) => segment.source == SegmentSource.translation)
      .map((segment) => segment.text.trim())
      .where((text) => text.isNotEmpty)
      .join(' ');

  Duration get duration => (endedAt ?? DateTime.now()).difference(startedAt);

  factory TranscribeSession.fromJson(Map<String, dynamic> json) =>
      _$TranscribeSessionFromJson(json);
}
