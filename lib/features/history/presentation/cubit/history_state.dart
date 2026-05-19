import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../transcribe/domain/entities/transcribe_session.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = HistoryInitial;
  const factory HistoryState.loading() = HistoryLoading;
  const factory HistoryState.loaded(List<TranscribeSession> sessions) = HistoryLoaded;
  const factory HistoryState.failure(String message) = HistoryFailure;
}
