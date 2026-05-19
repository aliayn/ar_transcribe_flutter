import 'dart:io';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../../../core/constants/app_constants.dart';

@lazySingleton
class AudioRecorderDataSource {
  final AudioRecorder _recorder = AudioRecorder();
  bool _isRecording = false;
  String? _currentChunkPath;

  bool get isRecording => _isRecording;

  Future<bool> hasPermission() => _recorder.hasPermission();

  Future<void> startChunk() async {
    final dir = await getTemporaryDirectory();
    final path = '${dir.path}/chunk_${DateTime.now().millisecondsSinceEpoch}.wav';
    _currentChunkPath = path;

    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.wav,
        sampleRate: AppConstants.voskSampleRateHz,
        numChannels: 1,
        bitRate: 128000,
      ),
      path: path,
    );
    _isRecording = true;
  }

  Future<File?> stopChunk() async {
    if (!_isRecording) return null;
    await _recorder.stop();
    _isRecording = false;

    final path = _currentChunkPath;
    _currentChunkPath = null;
    if (path == null) return null;

    final file = File(path);
    return file.existsSync() ? file : null;
  }

  Future<void> dispose() => _recorder.dispose();
}
