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
import 'package:ar_transcribe/features/transcribe/data/datasources/audio_recorder_data_source.dart'
    as i_audio_recorder_data_source;
import 'package:ar_transcribe/features/transcribe/data/datasources/session_local_data_source.dart'
    as i_session_local_data_source;
import 'package:ar_transcribe/features/transcribe/data/datasources/speech_preview_data_source.dart'
    as i_speech_preview_data_source;
import 'package:ar_transcribe/features/transcribe/data/datasources/vosk_data_source.dart'
    as i_vosk_data_source;
import 'package:ar_transcribe/features/transcribe/data/repositories/session_repository_impl.dart'
    as i_session_repository_impl;
import 'package:ar_transcribe/features/transcribe/data/repositories/transcription_repository_impl.dart'
    as i_transcription_repository_impl;
import 'package:ar_transcribe/features/transcribe/domain/repositories/session_repository.dart'
    as i_session_repository;
import 'package:ar_transcribe/features/transcribe/domain/repositories/transcription_repository.dart'
    as i_transcription_repository;
import 'package:ar_transcribe/features/transcribe/domain/usecases/dispose_transcription_resources.dart'
    as i_dispose_transcription_resources;
import 'package:ar_transcribe/features/transcribe/domain/usecases/has_microphone_permission.dart'
    as i_has_microphone_permission;
import 'package:ar_transcribe/features/transcribe/domain/usecases/save_session.dart'
    as i_save_session;
import 'package:ar_transcribe/features/transcribe/domain/usecases/start_preview.dart'
    as i_start_preview;
import 'package:ar_transcribe/features/transcribe/domain/usecases/start_recording_chunk.dart'
    as i_start_recording_chunk;
import 'package:ar_transcribe/features/transcribe/domain/usecases/stop_preview.dart'
    as i_stop_preview;
import 'package:ar_transcribe/features/transcribe/domain/usecases/stop_recording_chunk.dart'
    as i_stop_recording_chunk;
import 'package:ar_transcribe/features/transcribe/domain/usecases/transcribe_wav_chunk.dart'
    as i_transcribe_wav_chunk;
import 'package:ar_transcribe/features/transcribe/presentation/bloc/transcribe_bloc.dart'
    as i_transcribe_bloc;

extension GetItX on GetIt {
  void init() {
    registerLazySingleton(
      () => i_audio_recorder_data_source.AudioRecorderDataSource(),
    );
    registerFactory(
      () => i_dispose_transcription_resources.DisposeTranscriptionResources(
        get<i_transcription_repository.TranscriptionRepository>(),
      ),
    );
    registerFactory(
      () => i_has_microphone_permission.HasMicrophonePermission(
        get<i_transcription_repository.TranscriptionRepository>(),
      ),
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
    registerLazySingleton(
      () => i_speech_preview_data_source.SpeechPreviewDataSource(),
    );
    registerFactory(
      () => i_start_preview.StartPreview(
        get<i_transcription_repository.TranscriptionRepository>(),
      ),
    );
    registerFactory(
      () => i_start_recording_chunk.StartRecordingChunk(
        get<i_transcription_repository.TranscriptionRepository>(),
      ),
    );
    registerFactory(
      () => i_stop_preview.StopPreview(
        get<i_transcription_repository.TranscriptionRepository>(),
      ),
    );
    registerFactory(
      () => i_stop_recording_chunk.StopRecordingChunk(
        get<i_transcription_repository.TranscriptionRepository>(),
      ),
    );
    registerFactory(
      () => i_transcribe_bloc.TranscribeBloc(
        hasMicrophonePermission:
            get<i_has_microphone_permission.HasMicrophonePermission>(),
        startPreview: get<i_start_preview.StartPreview>(),
        stopPreview: get<i_stop_preview.StopPreview>(),
        startRecordingChunk: get<i_start_recording_chunk.StartRecordingChunk>(),
        stopRecordingChunk: get<i_stop_recording_chunk.StopRecordingChunk>(),
        transcribeWavChunk: get<i_transcribe_wav_chunk.TranscribeWavChunk>(),
        saveSession: get<i_save_session.SaveSession>(),
        disposeTranscriptionResources: get<
            i_dispose_transcription_resources.DisposeTranscriptionResources>(),
      ),
    );
    registerFactory(
      () => i_transcribe_wav_chunk.TranscribeWavChunk(
        get<i_transcription_repository.TranscriptionRepository>(),
      ),
    );
    registerLazySingleton<i_transcription_repository.TranscriptionRepository>(
      () => i_transcription_repository_impl.TranscriptionRepositoryImpl(
        get<i_audio_recorder_data_source.AudioRecorderDataSource>(),
        get<i_speech_preview_data_source.SpeechPreviewDataSource>(),
        get<i_vosk_data_source.VoskDataSource>(),
      ),
    );
    registerLazySingleton(() => i_vosk_data_source.VoskDataSource());
  }
}
