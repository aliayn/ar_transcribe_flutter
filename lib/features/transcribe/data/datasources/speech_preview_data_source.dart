import 'package:get_it_injector/get_it_injector.dart';
import 'package:speech_to_text/speech_to_text.dart';

@lazySingleton
class SpeechPreviewDataSource {
  final SpeechToText _stt = SpeechToText();
  bool _available = false;

  Future<bool> initialize() async {
    _available = await _stt.initialize();
    return _available;
  }

  Future<void> startListening({
    required void Function(String text) onPartial,
    required String localeId,
  }) async {
    if (!_available) await initialize();
    if (!_available) return;

    await _stt.listen(
      onResult: (result) => onPartial(result.recognizedWords),
      localeId: localeId,
      pauseFor: const Duration(seconds: 3),
      listenOptions: SpeechListenOptions(
        listenMode: ListenMode.dictation,
        cancelOnError: false,
      ),
    );
  }

  Future<void> stop() async {
    if (_stt.isListening) await _stt.stop();
  }

  void dispose() => _stt.cancel();
}
