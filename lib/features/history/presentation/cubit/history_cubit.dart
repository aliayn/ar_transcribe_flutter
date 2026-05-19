import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_injector/get_it_injector.dart';

import '../../../transcribe/domain/repositories/session_repository.dart';
import 'history_state.dart';

@factory
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this._sessionRepository) : super(const HistoryState.initial());

  final SessionRepository _sessionRepository;

  Future<void> load() async {
    emit(const HistoryState.loading());
    try {
      emit(HistoryState.loaded(await _sessionRepository.loadSessions()));
    } catch (error) {
      emit(HistoryState.failure(error.toString()));
    }
  }

  Future<void> delete(String id) async {
    await _sessionRepository.deleteSession(id);
    await load();
  }
}
