import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/app_settings.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(AppSettings()) AppSettings settings,
    @Default(false) bool isLoading,
  }) = _SettingsState;
}
