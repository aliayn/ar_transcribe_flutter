// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      language: json['language'] as String? ?? 'en',
      darkMode: json['darkMode'] as bool? ?? true,
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'darkMode': instance.darkMode,
    };
