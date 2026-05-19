import 'dart:io';

abstract interface class TranscriptionRepository {
  Future<bool> hasMicrophonePermission();
  Future<void> startChunk();
  Future<File?> stopChunk();
  Future<void> startPreview({
    required String localeId,
    required void Function(String text) onPartial,
  });
  Future<void> stopPreview();
  Future<String> transcribeChunk(File wavFile);
  Future<void> dispose();
}
