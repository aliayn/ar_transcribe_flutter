import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_injector/get_it_injector.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/locale_mapper.dart';
import '../../../settings/domain/entities/app_settings.dart';
import '../../domain/entities/transcribe_session.dart';
import '../../domain/entities/transcript_segment.dart';
import '../../domain/usecases/dispose_transcription_resources.dart';
import '../../domain/usecases/has_microphone_permission.dart';
import '../../domain/usecases/save_session.dart';
import '../../domain/usecases/start_preview.dart';
import '../../domain/usecases/start_recording_chunk.dart';
import '../../domain/usecases/stop_preview.dart';
import '../../domain/usecases/stop_recording_chunk.dart';
import '../../domain/usecases/transcribe_wav_chunk.dart';
import 'transcribe_event.dart';
import 'transcribe_state.dart';

@factory
class TranscribeBloc extends Bloc<TranscribeEvent, TranscribeState> {
  TranscribeBloc({
    required HasMicrophonePermission hasMicrophonePermission,
    required StartPreview startPreview,
    required StopPreview stopPreview,
    required StartRecordingChunk startRecordingChunk,
    required StopRecordingChunk stopRecordingChunk,
    required TranscribeWavChunk transcribeWavChunk,
    required SaveSession saveSession,
    required DisposeTranscriptionResources disposeTranscriptionResources,
  })  : _hasMicrophonePermission = hasMicrophonePermission,
        _startPreview = startPreview,
        _stopPreview = stopPreview,
        _startRecordingChunk = startRecordingChunk,
        _stopRecordingChunk = stopRecordingChunk,
        _transcribeWavChunk = transcribeWavChunk,
        _saveSession = saveSession,
        _disposeTranscriptionResources = disposeTranscriptionResources,
        super(const TranscribeState()) {
    on<TranscribeStarted>(_onStarted);
    on<TranscribeLivePreviewUpdated>(_onPreview);
    on<TranscribeChunkTimerFired>(_onChunkTimer);
    on<TranscribeVoskSegmentAdded>(_onVoskSegment);
    on<TranscribeStopped>(_onStopped);
    on<TranscribeReset>(_onReset);
  }

  final HasMicrophonePermission _hasMicrophonePermission;
  final StartPreview _startPreview;
  final StopPreview _stopPreview;
  final StartRecordingChunk _startRecordingChunk;
  final StopRecordingChunk _stopRecordingChunk;
  final TranscribeWavChunk _transcribeWavChunk;
  final SaveSession _saveSession;
  final DisposeTranscriptionResources _disposeTranscriptionResources;
  final _uuid = const Uuid();

  AppSettings? _activeSettings;
  Timer? _chunkTimer;

  Future<void> _onStarted(
    TranscribeStarted event,
    Emitter<TranscribeState> emit,
  ) async {
    _activeSettings = event.settings;

    final hasPermission = await _hasMicrophonePermission();
    if (!hasPermission) {
      emit(state.copyWith(
        status: SessionStatus.error,
        errorMessage: 'Microphone permission denied.',
      ));
      return;
    }

    final session = TranscribeSession(
      id: _uuid.v4(),
      startedAt: DateTime.now(),
      language: event.settings.language,
    );

    emit(state.copyWith(status: SessionStatus.recording, session: session));

    await _startPreview(
      localeId: LocaleMapper.toSpeechLocale(event.settings.language),
      onPartial: (text) => add(TranscribeEvent.livePreviewUpdated(text)),
    );

    await _startRecordingChunk();
    _scheduleChunkTimer();
  }

  void _onPreview(
    TranscribeLivePreviewUpdated event,
    Emitter<TranscribeState> emit,
  ) {
    emit(state.copyWith(livePreviewText: event.text));
  }

  void _scheduleChunkTimer() {
    _chunkTimer?.cancel();
    final seconds = _activeSettings?.chunkSeconds ?? 8;
    _chunkTimer = Timer(Duration(seconds: seconds), () {
      add(const TranscribeEvent.chunkTimerFired());
    });
  }

  Future<void> _onChunkTimer(
    TranscribeChunkTimerFired event,
    Emitter<TranscribeState> emit,
  ) async {
    if (state.status != SessionStatus.recording) return;

    final wavFile = await _stopRecordingChunk();
    if (wavFile != null && await wavFile.length() > 1000) {
      unawaited(_transcribeChunkInBackground(wavFile));
    }

    if (state.status == SessionStatus.recording) {
      await _startRecordingChunk();
      _scheduleChunkTimer();
    }
  }

  Future<void> _transcribeChunkInBackground(File wavFile) async {
    try {
      final text = await _transcribeWavChunk(wavFile);
      if (text.isNotEmpty) add(TranscribeEvent.voskSegmentAdded(text));
    } finally {
      if (await wavFile.exists()) await wavFile.delete();
    }
  }

  Future<void> _onVoskSegment(
    TranscribeVoskSegmentAdded event,
    Emitter<TranscribeState> emit,
  ) async {
    final session = state.session;
    if (session == null) return;

    final updated = session.copyWith(
      segments: [
        ...session.segments,
        TranscriptSegment(
          id: _uuid.v4(),
          text: event.text,
          timestamp: DateTime.now(),
          source: SegmentSource.vosk,
        ),
      ],
    );

    emit(state.copyWith(session: updated, livePreviewText: ''));
    await _saveSession(updated);
  }

  Future<void> _onStopped(
    TranscribeStopped event,
    Emitter<TranscribeState> emit,
  ) async {
    _chunkTimer?.cancel();
    await _stopPreview();

    final wavFile = await _stopRecordingChunk();
    final current = state.session;
    if (current == null) {
      emit(state.copyWith(status: SessionStatus.idle, livePreviewText: ''));
      return;
    }

    var session = current.copyWith(endedAt: DateTime.now());
    emit(state.copyWith(status: SessionStatus.processing, session: session));

    if (wavFile != null && await wavFile.length() > 1000) {
      final text = await _transcribeWavChunk(wavFile);
      if (text.isNotEmpty) {
        session = session.copyWith(
          segments: [
            ...session.segments,
            TranscriptSegment(
              id: _uuid.v4(),
              text: text,
              timestamp: DateTime.now(),
              source: SegmentSource.vosk,
            ),
          ],
        );
      }
      if (await wavFile.exists()) await wavFile.delete();
    }

    if (session.fullText.isNotEmpty) {
      await _saveSession(session);
    }

    emit(state.copyWith(status: SessionStatus.idle, session: session, livePreviewText: ''));
  }

  void _onReset(TranscribeReset event, Emitter<TranscribeState> emit) {
    emit(const TranscribeState());
  }

  @override
  Future<void> close() async {
    _chunkTimer?.cancel();
    await _disposeTranscriptionResources();
    return super.close();
  }
}
