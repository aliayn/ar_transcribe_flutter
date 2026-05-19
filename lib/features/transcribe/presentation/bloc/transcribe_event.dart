import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../settings/domain/entities/app_settings.dart';

part 'transcribe_event.freezed.dart';

@freezed
sealed class TranscribeEvent with _$TranscribeEvent {
  const factory TranscribeEvent.started(AppSettings settings) = TranscribeStarted;
  const factory TranscribeEvent.livePreviewUpdated(String text) = TranscribeLivePreviewUpdated;
  const factory TranscribeEvent.chunkTimerFired() = TranscribeChunkTimerFired;
  const factory TranscribeEvent.voskSegmentAdded(String text) = TranscribeVoskSegmentAdded;
  const factory TranscribeEvent.stopped() = TranscribeStopped;
  const factory TranscribeEvent.reset() = TranscribeReset;
}
