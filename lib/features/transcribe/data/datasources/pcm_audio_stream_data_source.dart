import 'dart:async';
import 'dart:typed_data';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:record/record.dart';

/// Captures microphone audio as 16 kHz mono PCM16 for Deepgram.
@lazySingleton
class PcmAudioStreamDataSource {
  final AudioRecorder _recorder = AudioRecorder();
  StreamSubscription<Uint8List>? _subscription;

  Future<bool> hasPermission() => _recorder.hasPermission();

  Future<void> start(void Function(Uint8List chunk) onChunk) async {
    await stop();

    final stream = await _recorder.startStream(
      const RecordConfig(
        encoder: AudioEncoder.pcm16bits,
        sampleRate: 16000,
        numChannels: 1,
      ),
    );

    _subscription = stream.listen(onChunk);
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
    if (await _recorder.isRecording()) {
      await _recorder.stop();
    }
  }

  Future<void> dispose() async {
    await stop();
    await _recorder.dispose();
  }
}
