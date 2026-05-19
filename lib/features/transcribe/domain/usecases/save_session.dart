import 'package:get_it_injector/get_it_injector.dart';

import '../entities/transcribe_session.dart';
import '../repositories/session_repository.dart';

@factory
class SaveSession {
  SaveSession(this._repository);

  final SessionRepository _repository;

  Future<void> call(TranscribeSession session) => _repository.saveSession(session);
}
