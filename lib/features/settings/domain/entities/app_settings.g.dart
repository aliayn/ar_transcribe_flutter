// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      appLocale: json['appLocale'] as String? ?? 'en',
      language: json['language'] as String? ?? 'en-US',
      darkMode: json['darkMode'] as bool? ?? true,
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'appLocale': instance.appLocale,
      'language': instance.language,
      'darkMode': instance.darkMode,
    };
