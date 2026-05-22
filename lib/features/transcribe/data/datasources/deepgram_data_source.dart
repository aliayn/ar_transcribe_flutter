import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../core/config/env_config.dart';

typedef DeepgramTranscriptCallback = void Function(String text, bool isFinal);

/// Streams PCM audio to Deepgram Nova and emits transcript results.
@lazySingleton
class DeepgramDataSource {
  IOWebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  bool _connected = false;

  bool get isConnected => _connected;

  Future<void> connect({
    required DeepgramTranscriptCallback onTranscript,
    String? language,
    String? model,
  }) async {
    await disconnect();

    final apiKey = EnvConfig.deepgramApiKey;
    if (apiKey.isEmpty) {
      throw StateError('DEEPGRAM_API_KEY is not set in .env');
    }

    final lang = language ?? EnvConfig.deepgramLanguage;
    final dgModel = model ?? EnvConfig.deepgramModel;
    const sampleRate = 16000;

    final uri = Uri.parse(
      'wss://api.deepgram.com/v1/listen'
      '?model=$dgModel'
      '&language=$lang'
      '&encoding=linear16'
      '&sample_rate=$sampleRate'
      '&channels=1'
      '&smart_format=true'
      '&interim_results=true'
      '&endpointing=300',
    );

    _channel = IOWebSocketChannel.connect(
      uri,
      headers: {'Authorization': 'Token $apiKey'},
    );
    _connected = true;

    _subscription = _channel!.stream.listen(
      (message) {
        if (message is! String) return;
        try {
          final data = jsonDecode(message) as Map<String, dynamic>;
          if (data['type'] != 'Results') return;

          final alternatives = (data['channel'] as Map<String, dynamic>?)?['alternatives']
              as List<dynamic>?;
          if (alternatives == null || alternatives.isEmpty) return;

          final transcript =
              ((alternatives.first as Map<String, dynamic>)['transcript'] as String? ?? '')
                  .trim();
          if (transcript.isEmpty) return;

          final isFinal = data['is_final'] == true || data['speech_final'] == true;
          onTranscript(transcript, isFinal);
        } catch (_) {
          // Ignore malformed frames.
        }
      },
      onError: (_) => _connected = false,
      onDone: () => _connected = false,
      cancelOnError: true,
    );
  }

  void sendAudio(Uint8List pcmChunk) {
    if (!_connected || _channel == null) return;
    _channel!.sink.add(pcmChunk);
  }

  Future<void> disconnect() async {
    _connected = false;
    await _subscription?.cancel();
    _subscription = null;
    final channel = _channel;
    _channel = null;
    if (channel != null) {
      try {
        await channel.sink.close().timeout(const Duration(seconds: 2));
      } catch (_) {
        // Best-effort teardown so stop/close never hangs the UI.
      }
    }
  }
}
