import 'dart:convert';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/app_settings.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/locale_mapper.dart';

@lazySingleton
class SettingsLocalDataSource {
  static const _settingsKey = 'app_settings';

  Future<AppSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_settingsKey);
    if (raw == null) return const AppSettings();
    final map = jsonDecode(raw) as Map<String, dynamic>;
    var settings = AppSettings.fromJson(map);
    if (!map.containsKey('appLocale')) {
      final legacy = settings.language;
      final appLocale = AppConstants.supportedAppLocaleCodes.contains(legacy)
          ? legacy
          : 'en';
      settings = settings.copyWith(appLocale: appLocale);
    }
    final deepgramCode = LocaleMapper.toDeepgramLanguage(settings.language);
    if (!AppConstants.deepgramLanguageCodes.contains(settings.language)) {
      settings = settings.copyWith(language: deepgramCode);
    }
    return settings;
  }

  Future<void> saveSettings(AppSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, jsonEncode(settings.toJson()));
  }
}
