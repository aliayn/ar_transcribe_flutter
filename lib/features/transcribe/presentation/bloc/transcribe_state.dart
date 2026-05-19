import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/transcribe_session.dart';

part 'transcribe_state.freezed.dart';

enum SessionStatus { idle, recording, processing, error }

@freezed
class TranscribeState with _$TranscribeState {
  const factory TranscribeState({
    @Default(SessionStatus.idle) SessionStatus status,
    TranscribeSession? session,
    @Default('') String livePreviewText,
    String? errorMessage,
  }) = _TranscribeState;
}
