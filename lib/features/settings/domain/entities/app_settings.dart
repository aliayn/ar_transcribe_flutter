import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
  /// UI locale (en, fa, ar).
    @Default('en') String appLocale,
  /// Deepgram transcription language (BCP-47).
    @Default('en-US') String language,
    @Default(true) bool darkMode,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
