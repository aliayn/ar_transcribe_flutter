// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GetItInjectorGenerator
// **************************************************************************

// ignore: lines_longer_than_80_chars
// ignore_for_file: type=lint,unused_import
import 'package:get_it/get_it.dart';
import 'package:ar_transcribe/features/history/presentation/cubit/history_cubit.dart'
    as i_history_cubit;
import 'package:ar_transcribe/features/settings/data/datasources/settings_local_data_source.dart'
    as i_settings_local_data_source;
import 'package:ar_transcribe/features/settings/data/repositories/settings_repository_impl.dart'
    as i_settings_repository_impl;
import 'package:ar_transcribe/features/settings/domain/repositories/settings_repository.dart'
    as i_settings_repository;
import 'package:ar_transcribe/features/settings/domain/usecases/load_settings.dart'
    as i_load_settings;
import 'package:ar_transcribe/features/settings/domain/usecases/save_settings.dart'
    as i_save_settings;
import 'package:ar_transcribe/features/settings/presentation/cubit/settings_cubit.dart'
    as i_settings_cubit;
import 'package:ar_transcribe/features/transcribe/data/datasources/deepgram_data_source.dart'
    as i_deepgram_data_source;
import 'package:ar_transcribe/features/transcribe/data/datasources/gemini_translation_data_source.dart'
    as i_gemini_translation_data_source;
import 'package:ar_transcribe/features/transcribe/data/datasources/pcm_audio_stream_data_source.dart'
    as i_pcm_audio_stream_data_source;
import 'package:ar_transcribe/features/transcribe/data/datasources/session_local_data_source.dart'
    as i_session_local_data_source;
import 'package:ar_transcribe/features/transcribe/data/repositories/session_repository_impl.dart'
    as i_session_repository_impl;
import 'package:ar_transcribe/features/transcribe/data/repositories/transcription_repository_impl.dart'
    as i_transcription_repository_impl;
import 'package:ar_transcribe/features/transcribe/domain/repositories/session_repository.dart'
    as i_session_repository;
import 'package:ar_transcribe/features/transcribe/domain/repositories/transcription_repository.dart'
    as i_transcription_repository;
import 'package:ar_transcribe/features/transcribe/domain/usecases/save_session.dart'
    as i_save_session;
import 'package:ar_transcribe/features/transcribe/presentation/bloc/transcribe_bloc.dart'
    as i_transcribe_bloc;

extension GetItX on GetIt {
  void init() {
    registerLazySingleton(() => i_deepgram_data_source.DeepgramDataSource());
    registerLazySingleton(
      () => i_gemini_translation_data_source.GeminiTranslationDataSource(),
    );
    registerFactory(
      () => i_history_cubit.HistoryCubit(
        get<i_session_repository.SessionRepository>(),
      ),
    );
    registerFactory(
      () => i_load_settings.LoadSettings(
        get<i_settings_repository.SettingsRepository>(),
      ),
    );
    registerLazySingleton(
      () => i_pcm_audio_stream_data_source.PcmAudioStreamDataSource(),
    );
    registerFactory(
      () => i_save_session.SaveSession(
        get<i_session_repository.SessionRepository>(),
      ),
    );
    registerFactory(
      () => i_save_settings.SaveSettings(
        get<i_settings_repository.SettingsRepository>(),
      ),
    );
    registerLazySingleton(
      () => i_session_local_data_source.SessionLocalDataSource(),
    );
    registerLazySingleton<i_session_repository.SessionRepository>(
      () => i_session_repository_impl.SessionRepositoryImpl(
        get<i_session_local_data_source.SessionLocalDataSource>(),
      ),
    );
    registerFactory(
      () => i_settings_cubit.SettingsCubit(
        get<i_settings_repository.SettingsRepository>(),
      ),
    );
    registerLazySingleton(
      () => i_settings_local_data_source.SettingsLocalDataSource(),
    );
    registerLazySingleton<i_settings_repository.SettingsRepository>(
      () => i_settings_repository_impl.SettingsRepositoryImpl(
        get<i_settings_local_data_source.SettingsLocalDataSource>(),
      ),
    );
    registerFactory(
      () => i_transcribe_bloc.TranscribeBloc(
        transcriptionRepository:
            get<i_transcription_repository.TranscriptionRepository>(),
        saveSession: get<i_save_session.SaveSession>(),
      ),
    );
    registerLazySingleton<i_transcription_repository.TranscriptionRepository>(
      () => i_transcription_repository_impl.TranscriptionRepositoryImpl(
        get<i_deepgram_data_source.DeepgramDataSource>(),
        get<i_pcm_audio_stream_data_source.PcmAudioStreamDataSource>(),
      ),
    );
  }
}
