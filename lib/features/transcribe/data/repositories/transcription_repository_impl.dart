import 'dart:io';

import 'package:get_it_injector/get_it_injector.dart';

import '../../domain/repositories/transcription_repository.dart';
import '../datasources/audio_recorder_data_source.dart';
import '../datasources/speech_preview_data_source.dart';
import '../datasources/vosk_data_source.dart';

@lazySingleton
class TranscriptionRepositoryImpl implements TranscriptionRepository {
  TranscriptionRepositoryImpl(
    this._audioRecorder,
    this._speechPreview,
    this._vosk,
  );

  final AudioRecorderDataSource _audioRecorder;
  final SpeechPreviewDataSource _speechPreview;
  final VoskDataSource _vosk;

  @override
  Future<bool> hasMicrophonePermission() => _audioRecorder.hasPermission();

  @override
  Future<void> startChunk() => _audioRecorder.startChunk();

  @override
  Future<File?> stopChunk() => _audioRecorder.stopChunk();

  @override
  Future<void> startPreview({
    required String localeId,
    required void Function(String text) onPartial,
  }) =>
      _speechPreview.startListening(localeId: localeId, onPartial: onPartial);

  @override
  Future<void> stopPreview() => _speechPreview.stop();

  @override
  Future<String> transcribeChunk(File wavFile) => _vosk.transcribe(wavFile);

  @override
  Future<void> dispose() async {
    await _audioRecorder.dispose();
    _speechPreview.dispose();
  }
}
