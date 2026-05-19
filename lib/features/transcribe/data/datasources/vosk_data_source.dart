import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:vosk_flutter_service/vosk_flutter.dart';

import '../../../../core/constants/app_constants.dart';

@lazySingleton
class VoskDataSource {
  final VoskFlutterPlugin _vosk = VoskFlutterPlugin.instance();
  final ModelLoader _modelLoader = ModelLoader();

  Model? _model;

  Future<void> ensureInitialized() async {
    if (_model != null) return;
    final modelDir = await _modelLoader.loadFromAssets(AppConstants.voskModelAsset);
    _model = await _vosk.createModel(modelDir);
  }

  Future<String> transcribe(File wavFile) async {
    await ensureInitialized();

    final bytes = await wavFile.readAsBytes();
    if (bytes.isEmpty) return '';

    final recognizer = await _vosk.createRecognizer(
      model: _model!,
      sampleRate: AppConstants.voskSampleRateHz,
    );

    try {
      const chunkSize = 8192;
      var position = 0;
      while (position + chunkSize < bytes.length) {
        await recognizer.acceptWaveformBytes(
          Uint8List.fromList(bytes.sublist(position, position + chunkSize)),
        );
        position += chunkSize;
      }
      await recognizer.acceptWaveformBytes(Uint8List.fromList(bytes.sublist(position)));

      final raw = await recognizer.getFinalResult();
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return (map['text'] as String? ?? '').trim();
    } catch (_) {
      return '';
    } finally {
      await recognizer.dispose();
    }
  }
}
