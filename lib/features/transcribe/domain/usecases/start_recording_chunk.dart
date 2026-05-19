import 'package:get_it_injector/get_it_injector.dart';

import '../repositories/transcription_repository.dart';

@factory
class StartRecordingChunk {
  StartRecordingChunk(this._repository);

  final TranscriptionRepository _repository;

  Future<void> call() => _repository.startChunk();
}
