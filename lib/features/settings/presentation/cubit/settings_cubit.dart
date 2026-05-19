import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_injector/get_it_injector.dart';

import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import 'settings_state.dart';

@factory
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._repository) : super(const SettingsState());

  final SettingsRepository _repository;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final settings = await _repository.loadSettings();
    emit(state.copyWith(settings: settings, isLoading: false));
  }

  Future<void> update(AppSettings settings) async {
    emit(state.copyWith(settings: settings));
    await _repository.saveSettings(settings);
  }
}
