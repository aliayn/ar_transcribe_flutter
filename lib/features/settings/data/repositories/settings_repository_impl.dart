import 'package:get_it_injector/get_it_injector.dart';

import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_data_source.dart';

@lazySingleton
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._localDataSource);

  final SettingsLocalDataSource _localDataSource;

  @override
  Future<AppSettings> loadSettings() => _localDataSource.loadSettings();

  @override
  Future<void> saveSettings(AppSettings settings) => _localDataSource.saveSettings(settings);
}
