import 'package:get_it_injector/get_it_injector.dart';

import '../entities/app_settings.dart';
import '../repositories/settings_repository.dart';

@factory
class SaveSettings {
  SaveSettings(this._repository);

  final SettingsRepository _repository;

  Future<void> call(AppSettings settings) => _repository.saveSettings(settings);
}
