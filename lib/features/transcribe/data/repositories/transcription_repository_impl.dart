import 'package:get_it_injector/get_it_injector.dart';

import '../../../../core/config/env_config.dart';
import '../../domain/repositories/transcription_repository.dart';
import '../datasources/deepgram_data_source.dart';
import '../datasources/gemini_translation_data_source.dart';
import '../datasources/pcm_audio_stream_data_source.dart';

@lazySingleton
class TranscriptionRepositoryImpl implements TranscriptionRepository {
  TranscriptionRepositoryImpl(
    this._deepgram,
    this._gemini,
    this._pcmStream,
  );

  final DeepgramDataSource _deepgram;
  final GeminiTranslationDataSource _gemini;
  final PcmAudioStreamDataSource _pcmStream;

  @override
  bool get hasValidApiKeys => EnvConfig.isConfigured;

  @override
  Future<bool> hasMicrophonePermission() => _pcmStream.hasPermission();

  @override
  Future<void> startLiveTranscription({
    required void Function(String transcript, bool isFinal) onTranscript,
  }) async {
    await _deepgram.connect(onTranscript: onTranscript);
    await _pcmStream.start(_deepgram.sendAudio);
  }

  @override
  Future<String> translate({
    required String text,
    required String targetLanguageLabel,
  }) =>
      _gemini.translate(text: text, targetLanguageLabel: targetLanguageLabel);

  @override
  Future<void> stopLiveTranscription() async {
    await _pcmStream.stop();
    await _deepgram.disconnect();
  }

  @override
  Future<void> dispose() async {
    await stopLiveTranscription();
    await _pcmStream.dispose();
  }
}
