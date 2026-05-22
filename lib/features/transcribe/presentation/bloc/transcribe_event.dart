import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../settings/domain/entities/app_settings.dart';
import 'transcribe_state.dart';

part 'transcribe_event.freezed.dart';

@freezed
sealed class TranscribeEvent with _$TranscribeEvent {
  const factory TranscribeEvent.started(AppSettings settings) = TranscribeStarted;
  const factory TranscribeEvent.connectionFailed(String message) =
      TranscribeConnectionFailed;
  const factory TranscribeEvent.transcriptReceived(String text, bool isFinal) =
      TranscribeTranscriptReceived;
  const factory TranscribeEvent.translationReceived(String text) =
      TranscribeTranslationReceived;
  const factory TranscribeEvent.displayModeChanged(ArDisplayMode mode) =
      TranscribeDisplayModeChanged;
  const factory TranscribeEvent.stopped() = TranscribeStopped;
  const factory TranscribeEvent.reset() = TranscribeReset;
}
