import 'package:get_it_injector/get_it_injector.dart';

import '../../domain/entities/transcribe_session.dart';
import '../../domain/repositories/session_repository.dart';
import '../datasources/session_local_data_source.dart';

@lazySingleton
class SessionRepositoryImpl implements SessionRepository {
  SessionRepositoryImpl(this._localDataSource);

  final SessionLocalDataSource _localDataSource;

  @override
  Future<List<TranscribeSession>> loadSessions() => _localDataSource.loadSessions();

  @override
  Future<void> saveSession(TranscribeSession session) => _localDataSource.saveSession(session);

  @override
  Future<void> deleteSession(String id) => _localDataSource.deleteSession(id);
}
