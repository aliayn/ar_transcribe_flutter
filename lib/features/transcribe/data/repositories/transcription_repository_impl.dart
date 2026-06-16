import 'package:get_it_injector/get_it_injector.dart';

import '../../../../core/config/env_config.dart';
import '../../../../core/utils/locale_mapper.dart';
import '../../domain/repositories/transcription_repository.dart';
import '../datasources/deepgram_data_source.dart';
import '../datasources/pcm_audio_stream_data_source.dart';

@lazySingleton
class TranscriptionRepositoryImpl implements TranscriptionRepository {
  TranscriptionRepositoryImpl(
    this._deepgram,
    this._pcmStream,
  );

  final DeepgramDataSource _deepgram;
  final PcmAudioStreamDataSource _pcmStream;

  @override
  bool get hasValidApiKeys => EnvConfig.isConfigured;

  @override
  Future<bool> hasMicrophonePermission() => _pcmStream.hasPermission();

  @override
  Future<void> startLiveTranscription({
    required void Function(String transcript, bool isFinal) onTranscript,
    required String language,
  }) async {
    await _deepgram.connect(
      onTranscript: onTranscript,
      language: LocaleMapper.toDeepgramLanguage(language),
    );
    await _pcmStream.start(_deepgram.sendAudio);
  }

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
