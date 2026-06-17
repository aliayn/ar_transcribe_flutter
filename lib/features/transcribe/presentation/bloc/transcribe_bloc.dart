import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_injector/get_it_injector.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/transcribe_session.dart';
import '../../domain/entities/transcript_segment.dart';
import '../../domain/repositories/transcription_repository.dart';
import '../../domain/usecases/save_session.dart';
import 'transcribe_event.dart';
import 'transcribe_state.dart';

@factory
class TranscribeBloc extends Bloc<TranscribeEvent, TranscribeState> {
  TranscribeBloc({
    required TranscriptionRepository transcriptionRepository,
    required SaveSession saveSession,
  })  : _transcriptionRepository = transcriptionRepository,
        _saveSession = saveSession,
        super(const TranscribeState()) {
    on<TranscribeStarted>(_onStarted);
    on<TranscribeConnectionEstablished>(_onConnectionEstablished);
    on<TranscribeConnectionFailed>(_onConnectionFailed);
    on<TranscribeTranscriptReceived>(_onTranscriptReceived);
    on<TranscribeStopped>(_onStopped);
    on<TranscribeReset>(_onReset);
  }

  final TranscriptionRepository _transcriptionRepository;
  final SaveSession _saveSession;
  final _uuid = const Uuid();

  String _transcriptionLanguage = 'en-US';
  bool _tornDown = false;

  void _safeAdd(TranscribeEvent event) {
    if (_tornDown) return;
    try {
      add(event);
    } on StateError {
      // Bloc closing.
    }
  }

  Future<void> _onStarted(
    TranscribeStarted event,
    Emitter<TranscribeState> emit,
  ) async {
    _transcriptionLanguage = event.settings.language;

    if (!_transcriptionRepository.hasValidApiKeys) {
      emit(state.copyWith(
        status: SessionStatus.error,
        errorType: TranscribeErrorType.missingDeepgramApiKey,
        errorDetail: null,
      ));
      return;
    }

    final hasPermission = await _transcriptionRepository.hasMicrophonePermission();
    if (!hasPermission) {
      emit(state.copyWith(
        status: SessionStatus.error,
        errorType: TranscribeErrorType.microphonePermissionDenied,
        errorDetail: null,
      ));
      return;
    }

    final session = TranscribeSession(
      id: _uuid.v4(),
      startedAt: DateTime.now(),
      language: event.settings.language,
    );

    emit(state.copyWith(
      status: SessionStatus.recording,
      session: session,
      isConnected: false,
      livePreviewText: '',
      errorType: null,
      errorDetail: null,
    ));

    unawaited(_connectLiveTranscription());
  }

  Future<void> _connectLiveTranscription() async {
    try {
      await _transcriptionRepository.startLiveTranscription(
        language: _transcriptionLanguage,
        onTranscript: (text, isFinal) {
          _safeAdd(TranscribeEvent.transcriptReceived(text, isFinal));
        },
      );
      _safeAdd(const TranscribeEvent.connectionEstablished());
    } catch (error) {
      _safeAdd(TranscribeEvent.connectionFailed(error.toString()));
    }
  }

  void _onConnectionEstablished(
    TranscribeConnectionEstablished event,
    Emitter<TranscribeState> emit,
  ) {
    emit(state.copyWith(isConnected: true));
  }

  void _onConnectionFailed(
    TranscribeConnectionFailed event,
    Emitter<TranscribeState> emit,
  ) {
    emit(state.copyWith(
      status: SessionStatus.error,
      isConnected: false,
      errorType: TranscribeErrorType.connectionFailed,
      errorDetail: event.message,
    ));
  }

  Future<void> _onTranscriptReceived(
    TranscribeTranscriptReceived event,
    Emitter<TranscribeState> emit,
  ) async {
    if (!event.isFinal) {
      emit(state.copyWith(livePreviewText: event.text));
      return;
    }

    final session = state.session;
    if (session == null) return;

    final text = event.text.trim();
    if (text.isEmpty) return;

    final updated = session.copyWith(
      segments: [
        ...session.segments,
        TranscriptSegment(
          id: _uuid.v4(),
          text: text,
          timestamp: DateTime.now(),
          source: SegmentSource.deepgram,
        ),
      ],
    );

    emit(state.copyWith(session: updated, livePreviewText: ''));
    unawaited(_saveSession(updated));
  }

  Future<void> _onStopped(
    TranscribeStopped event,
    Emitter<TranscribeState> emit,
  ) async {
    if (!emit.isDone) {
      emit(state.copyWith(
        status: SessionStatus.processing,
        isConnected: false,
        livePreviewText: '',
      ));
    }

    await _transcriptionRepository.stopLiveTranscription();
    if (_tornDown || emit.isDone) return;

    final current = state.session;
    if (current == null) {
      emit(state.copyWith(
        status: SessionStatus.idle,
        isConnected: false,
        livePreviewText: '',
        errorType: null,
        errorDetail: null,
      ));
      return;
    }

    final session = current.copyWith(endedAt: DateTime.now());
    emit(state.copyWith(
      status: SessionStatus.idle,
      session: session,
      isConnected: false,
      livePreviewText: '',
      errorType: null,
      errorDetail: null,
    ));

    if (session.fullText.isNotEmpty) {
      await _saveSession(session);
    }
  }

  void _onReset(TranscribeReset event, Emitter<TranscribeState> emit) {
    emit(const TranscribeState());
  }

  @override
  Future<void> close() async {
    _tornDown = true;
    await _transcriptionRepository.dispose();
    return super.close();
  }
}
