import 'package:get_it_injector/get_it_injector.dart';

import '../repositories/transcription_repository.dart';

@factory
class HasMicrophonePermission {
  HasMicrophonePermission(this._repository);

  final TranscriptionRepository _repository;

  Future<bool> call() => _repository.hasMicrophonePermission();
}
