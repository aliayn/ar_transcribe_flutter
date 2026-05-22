import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/transcribe_session.dart';

part 'transcribe_state.freezed.dart';

enum SessionStatus { idle, recording, processing, error }

/// EN = Deepgram transcript, FA = Gemini translation (ar-transcribe mobile.html).
enum ArDisplayMode { transcript, translation }

@freezed
class TranscribeState with _$TranscribeState {
  const factory TranscribeState({
    @Default(SessionStatus.idle) SessionStatus status,
    TranscribeSession? session,
    @Default('') String livePreviewText,
    @Default(ArDisplayMode.transcript) ArDisplayMode displayMode,
    String? errorMessage,
    @Default(false) bool isConnected,
  }) = _TranscribeState;
}
