import 'dart:io';

import 'package:get_it_injector/get_it_injector.dart';

import '../repositories/transcription_repository.dart';

@factory
class TranscribeWavChunk {
  TranscribeWavChunk(this._repository);

  final TranscriptionRepository _repository;

  Future<String> call(File wavFile) => _repository.transcribeChunk(wavFile);
}
