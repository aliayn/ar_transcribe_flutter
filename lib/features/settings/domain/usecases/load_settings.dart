import 'package:get_it_injector/get_it_injector.dart';

import '../entities/app_settings.dart';
import '../repositories/settings_repository.dart';

@factory
class LoadSettings {
  LoadSettings(this._repository);

  final SettingsRepository _repository;

  Future<AppSettings> call() => _repository.loadSettings();
}
