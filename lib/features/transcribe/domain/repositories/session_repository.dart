import '../entities/transcribe_session.dart';

abstract interface class SessionRepository {
  Future<List<TranscribeSession>> loadSessions();
  Future<void> saveSession(TranscribeSession session);
  Future<void> deleteSession(String id);
}
