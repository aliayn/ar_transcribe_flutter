import 'package:get_it_injector/get_it_injector.dart';

import '../repositories/transcription_repository.dart';

@factory
class StartPreview {
  StartPreview(this._repository);

  final TranscriptionRepository _repository;

  Future<void> call({
    required String localeId,
    required void Function(String text) onPartial,
  }) =>
      _repository.startPreview(localeId: localeId, onPartial: onPartial);
}
