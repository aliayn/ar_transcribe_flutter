# AR Transcribe — Complete Flutter Implementation Guide
> Real-time speech-to-text transcription app inspired by `mallahyari/ar-games/ar-transcribe`  
> Target platforms: **Android & iOS**  
> Engine: **Vosk** ([`vosk_flutter_service`](https://pub.dev/packages/vosk_flutter_service), offline chunk transcription) + `speech_to_text` (on-device live preview)

---

## Table of Contents
1. [What We're Building](#1-what-were-building)
2. [Architecture Overview](#2-architecture-overview)
3. [Project Setup](#3-project-setup)
4. [Dependencies](#4-dependencies)
5. [Folder Structure](#5-folder-structure)
6. [Android & iOS Configuration](#6-android--ios-configuration)
7. [Vosk model & native setup](#7-vosk-model--native-setup)
8. [Domain Entities and DTOs with Freezed](#8-domain-entities-and-dtos-with-freezed)
9. [Data Layer, Repositories, and Use Cases](#9-data-layer-repositories-and-use-cases)
10. [State Management (BLoC + Freezed)](#10-state-management-bloc--freezed)
11. [Pages & Screens](#11-pages--screens)
12. [Widgets](#12-widgets)
13. [Routing](#13-routing)
14. [Supporting Core Files](#14-supporting-core-files)
15. [Running & Testing](#15-running--testing)

---

## 1. What We're Building

An **AR-style real-time speech transcription app** that:
- Records microphone audio in real time
- Streams partial transcription live using on-device STT (speech_to_text)
- Every N seconds, sends a WAV chunk to **Vosk** (via `vosk_flutter_service`) for **offline** final transcription
- Displays the transcript as a scrolling overlay (the "AR" aesthetic — text floating over a dark/blurred background)
- Lets users copy, share, or export the transcript
- Supports language selection for the **live preview** (`speech_to_text` locales); **final text follows the bundled Vosk model** (one model zip per build unless you add multi-model switching)

---

## 2. Architecture Overview

This guide uses a **feature-first clean architecture** with generated dependency injection and immutable state:

- **Presentation layer**: pages, widgets, BLoC/Cubit, Freezed UI state/events
- **Domain layer**: entities, repository contracts, use cases, value objects
- **Data layer**: data sources, DTOs, repository implementations, platform/plugin services
- **Core layer**: generated DI setup, routing, constants, errors, shared utilities

```
┌──────────────────────────────────────────────────────────────────────┐
│                          Flutter App                                  │
│                                                                      │
│  app/                                                                │
│  ├── ArTranscribeApp                                                 │
│  └── app_router.dart                                                 │
│                                                                      │
│  core/                                                               │
│  ├── di/                 get_it_injector annotations + generated init │
│  ├── errors/             Failure / exception mapping                  │
│  ├── constants/          app-wide constants                           │
│  └── utils/              small shared helpers                         │
│                                                                      │
│  features/transcribe/                                                 │
│  ├── domain/             entities, repository contract, use cases      │
│  ├── data/               DTOs, services/data sources, repo impl        │
│  └── presentation/       TranscribeBloc + pages + widgets             │
│                                                                      │
│  features/settings/                                                   │
│  ├── domain/             AppSettings entity + contract/use cases       │
│  ├── data/               shared_preferences data source + repo impl    │
│  └── presentation/       SettingsCubit                                │
│                                                                      │
│  features/history/                                                    │
│  ├── domain/             history use cases                             │
│  └── presentation/       HistoryCubit + HistoryPage                   │
└──────────────────────────────────────────────────────────────────────┘
```

**Clean architecture dependency rule:** dependencies point inward. UI depends on use cases, use cases depend on repository contracts, and data-layer implementations depend on plugin/platform services. The domain layer must not import Flutter, `shared_preferences`, Vosk, `record`, `speech_to_text`, or generated DI.

**Key flow during a session:**
```
TranscribePage
  └── TranscribeBloc
        ├── StartTranscriptionUseCase
        │     └── TranscriptionRepository
        │           └── AudioRecorderDataSource / SpeechPreviewDataSource / VoskDataSource
        ├── SaveSessionUseCase
        │     └── SessionRepository
        └── TranscribeState.freezed.dart → BlocBuilder renders immutable snapshots
```

## 3. Project Setup

```bash
# 1. Create project
flutter create ar_transcribe --org com.yourcompany
cd ar_transcribe

# 2. Set minimum SDK (needed for plugins)
# Edit android/app/build.gradle → minSdkVersion 21
# Edit ios/Podfile → platform :ios, '14.0'
# Note: `vosk_flutter_service` does not support **web**; use Android/iOS/desktop targets from the plugin matrix.

# 3. Install dependencies (see next section)
flutter pub get
```

---

## 4. Dependencies

### `pubspec.yaml`

```yaml
name: ar_transcribe
description: Real-time AR speech transcription powered by Vosk (offline)
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

  # Audio recording
  record: ^5.1.2
  just_audio: ^0.9.40

  # On-device live STT preview
  speech_to_text: ^6.6.2

  # Offline final transcription (Vosk)
  vosk_flutter_service: ^0.1.1

  # State management
  flutter_bloc: ^8.1.6
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

  # Generated DI annotations
  # Uses get_it_injector annotations and generated registration instead of hand-written get_it setup.
  get_it_injector: ^0.7.1
  get_it: ^8.0.3 # Runtime container required by get_it_injector-generated code.

  # Local storage
  shared_preferences: ^2.2.3
  path_provider: ^2.1.3
  uuid: ^4.4.0

  # UI / utilities
  intl: ^0.19.0
  flutter_animate: ^4.5.0
  share_plus: ^9.0.0
  permission_handler: ^11.3.1
  google_fonts: ^6.2.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0

  # Code generation
  build_runner: ^2.4.13
  freezed: ^2.5.7
  json_serializable: ^6.8.0
  get_it_injector_gen: ^0.5.6

flutter:
  uses-material-design: true
  assets:
    - assets/models/
    - assets/fonts/
```

### Code generation commands

Run this after changing any Freezed model, BLoC state/event, repository implementation annotation, or DI setup file:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

For active development:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

Generated files such as `*.freezed.dart`, `*.g.dart`, and `*.config.dart` are outputs of `build_runner`. Do not edit them manually.

## 5. Folder Structure

Use a feature-first enterprise layout. Each feature owns its presentation, domain, and data code. Cross-cutting concerns live under `core/`, and reusable app-level widgets live under `shared/`.

```
ar_transcribe/
├── .gitignore
├── build.yaml
├── pubspec.yaml
│
├── assets/
│   ├── models/
│   └── fonts/
│
└── lib/
    ├── main.dart
    │
    ├── app/
    │   ├── app.dart
    │   └── routing/
    │       └── app_router.dart
    │
    ├── core/
    │   ├── constants/
    │   │   └── app_constants.dart
    │   ├── di/
    │   │   ├── injection.dart          ← @setup + getIt + generated init call
    │   │   └── injection.config.dart   ← generated by get_it_injector_gen
    │   ├── errors/
    │   │   ├── app_exception.dart
    │   │   └── failure.dart
    │   ├── extensions/
    │   │   └── extensions.dart
    │   └── utils/
    │       └── locale_mapper.dart
    │
    ├── features/
    │   ├── splash/
    │   │   └── presentation/
    │   │       └── pages/
    │   │           └── splash_page.dart
    │   │
    │   ├── home/
    │   │   └── presentation/
    │   │       └── pages/
    │   │           └── home_page.dart
    │   │
    │   ├── settings/
    │   │   ├── data/
    │   │   │   ├── datasources/
    │   │   │   │   └── settings_local_data_source.dart
    │   │   │   └── repositories/
    │   │   │       └── settings_repository_impl.dart
    │   │   ├── domain/
    │   │   │   ├── entities/
    │   │   │   │   ├── app_settings.dart
    │   │   │   │   ├── app_settings.freezed.dart
    │   │   │   │   └── app_settings.g.dart
    │   │   │   ├── repositories/
    │   │   │   │   └── settings_repository.dart
    │   │   │   └── usecases/
    │   │   │       ├── load_settings.dart
    │   │   │       └── save_settings.dart
    │   │   └── presentation/
    │   │       └── cubit/
    │   │           ├── settings_cubit.dart
    │   │           ├── settings_state.dart
    │   │           └── settings_state.freezed.dart
    │   │
    │   ├── history/
    │   │   ├── domain/
    │   │   │   └── usecases/
    │   │   │       ├── delete_session.dart
    │   │   │       └── watch_sessions.dart
    │   │   └── presentation/
    │   │       ├── cubit/
    │   │       │   ├── history_cubit.dart
    │   │       │   ├── history_state.dart
    │   │       │   └── history_state.freezed.dart
    │   │       └── pages/
    │   │           └── history_page.dart
    │   │
    │   └── transcribe/
    │       ├── data/
    │       │   ├── datasources/
    │       │   │   ├── audio_recorder_data_source.dart
    │       │   │   ├── session_local_data_source.dart
    │       │   │   ├── speech_preview_data_source.dart
    │       │   │   └── vosk_data_source.dart
    │       │   ├── dto/
    │       │   │   ├── transcribe_session_dto.dart
    │       │   │   ├── transcribe_session_dto.freezed.dart
    │       │   │   ├── transcribe_session_dto.g.dart
    │       │   │   ├── transcript_segment_dto.dart
    │       │   │   ├── transcript_segment_dto.freezed.dart
    │       │   │   └── transcript_segment_dto.g.dart
    │       │   └── repositories/
    │       │       ├── session_repository_impl.dart
    │       │       └── transcription_repository_impl.dart
    │       ├── domain/
    │       │   ├── entities/
    │       │   │   ├── transcribe_session.dart
    │       │   │   ├── transcribe_session.freezed.dart
    │       │   │   ├── transcribe_session.g.dart
    │       │   │   ├── transcript_segment.dart
    │       │   │   ├── transcript_segment.freezed.dart
    │       │   │   └── transcript_segment.g.dart
    │       │   ├── repositories/
    │       │   │   ├── session_repository.dart
    │       │   │   └── transcription_repository.dart
    │       │   └── usecases/
    │       │       ├── dispose_transcription_resources.dart
│       │       ├── save_session.dart
    │       │       ├── start_preview.dart
    │       │       ├── start_recording_chunk.dart
    │       │       ├── stop_preview.dart
    │       │       ├── stop_recording_chunk.dart
    │       │       └── transcribe_wav_chunk.dart
    │       └── presentation/
    │           ├── bloc/
    │           │   ├── transcribe_bloc.dart
    │           │   ├── transcribe_event.dart
    │           │   ├── transcribe_event.freezed.dart
    │           │   ├── transcribe_state.dart
    │           │   └── transcribe_state.freezed.dart
    │           └── pages/
    │               └── transcribe_page.dart
    │
    └── shared/
        └── widgets/
            ├── transcript_bubble.dart
            ├── live_waveform.dart
            ├── action_bar.dart
            └── language_selector.dart
```

**Enterprise rules for this codebase:**

- Domain entities are immutable Freezed classes and contain no Flutter/plugin imports.
- Repository contracts live in `domain/repositories`; implementations live in `data/repositories`.
- Platform/plugin wrappers live in `data/datasources` and are registered with `get_it_injector` annotations.
- Use cases are thin orchestration classes. The BLoC calls use cases, not data sources directly.
- Pages never create services. Pages read BLoCs/Cubits from `BlocProvider`, and BLoCs/Cubits receive dependencies through constructors.
- Generated files are committed or ignored according to team policy, but they are never edited by hand.

### `build.yaml`

```yaml
targets:
  $default:
    builders:
      get_it_injector_gen:
        generate_for:
          include:
            - lib/**/*.dart
          exclude:
            - lib/**/*.freezed.dart
            - lib/**/*.g.dart
        options:
          auto_register: false
          register_as_implementation: true
          ignore_for_file:
            - type=lint
            - unused_import
```

`auto_register: false` keeps registration explicit through annotations such as `@singleton`, `@lazySingleton`, and `@factory`. That is usually safer in enterprise code because accidental classes do not silently enter the dependency graph.

## 6. Android & iOS Configuration

### Android

**`android/app/build.gradle`**
```gradle
android {
    defaultConfig {
        minSdkVersion 21          // required by record + permission_handler
        targetSdkVersion 34
    }
    buildTypes {
        release {
            // If you enable minification, keep JNA/Vosk rules (see ProGuard below)
            // minifyEnabled true
            // proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}
```

**`android/app/proguard-rules.pro`** (create if missing — required when minification is enabled; safe to add always)
```proguard
-keep class com.sun.jna.* { *; }
-keepclassmembers class * extends com.sun.jna.* { public *; }
```

**`android/app/src/main/AndroidManifest.xml`**
```xml
<manifest ...>
    <!-- Microphone -->
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <!-- Optional: INTERNET if you use ModelLoader.loadFromNetwork, analytics, etc. -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <!-- For file read/write (audio chunks) -->
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

    <application ...>
        ...
    </application>
</manifest>
```

### iOS

**`ios/Podfile`** — top of file:
```ruby
platform :ios, '14.0'
```

**`ios/Runner/Info.plist`** — add inside `<dict>`:
```xml
<key>NSMicrophoneUsageDescription</key>
<string>AR Transcribe needs the microphone to transcribe your speech in real time.</string>
<key>NSSpeechRecognitionUsageDescription</key>
<string>AR Transcribe uses on-device speech recognition for live preview text.</string>
```

**Vosk native binaries (iOS / macOS / Linux / Windows)** — from project root (see [`vosk_flutter_service`](https://pub.dev/packages/vosk_flutter_service)):

```bash
dart run vosk_flutter_service install -t ios
```

Android ships native binaries with the plugin; no extra install step.

---

## 7. Vosk model & native setup

### 1. Add a Vosk model to the project

Download a model zip from [Vosk models](https://alphacephei.com/vosk/models) (e.g. **vosk-model-small-en-us-0.15.zip** for a smaller footprint). Place it under:

```
assets/models/vosk-model-small-en-us-0.15.zip
```

The filename must match **`AppConstants.voskModelAsset`** in `lib/core/constants/app_constants.dart`.

> **Note:** Final transcription language is determined by this model. The in-app language dropdown in this guide mainly affects the **`speech_to_text`** preview locale; you can extend the app later to swap model assets per language.

### 2. `.gitignore` (optional)

Model zips are large; exclude them from git if you prefer hosting them separately:

```
assets/models/*.zip
```

### `lib/main.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/di/injection.dart';
import 'features/settings/presentation/cubit/settings_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    BlocProvider(
      create: (_) => getIt<SettingsCubit>()..load(),
      child: const ArTranscribeApp(),
    ),
  );
}
```

### `lib/core/di/injection.dart`
```dart
import 'package:get_it/get_it.dart';
import 'package:get_it_injector/get_it_injector.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@setup
Future<void> configureDependencies() => getIt.init();
```

`get_it_injector` owns dependency registration through annotations and generated `injection.config.dart`. Avoid hand-written `getIt.registerSingleton(...)` blocks; annotate classes instead and regenerate.

## 8. Domain Entities and DTOs with Freezed

Use **Freezed** for immutable domain entities, BLoC states/events, and JSON-enabled DTOs. Domain entities represent business concepts. DTOs represent persisted JSON shape and plugin/API boundaries.

### `lib/features/transcribe/domain/entities/transcript_segment.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transcript_segment.freezed.dart';
part 'transcript_segment.g.dart';

enum SegmentSource { vosk, preview }

@freezed
class TranscriptSegment with _$TranscriptSegment {
  const factory TranscriptSegment({
    required String id,
    required String text,
    required DateTime timestamp,
    required SegmentSource source,
    @Default(1.0) double confidence,
  }) = _TranscriptSegment;

  factory TranscriptSegment.fromJson(Map<String, dynamic> json) =>
      _$TranscriptSegmentFromJson(json);
}
```

### `lib/features/transcribe/domain/entities/transcribe_session.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

import 'transcript_segment.dart';

part 'transcribe_session.freezed.dart';
part 'transcribe_session.g.dart';

@freezed
class TranscribeSession with _$TranscribeSession {
  const TranscribeSession._();

  const factory TranscribeSession({
    required String id,
    required DateTime startedAt,
    DateTime? endedAt,
    required String language,
    @Default(<TranscriptSegment>[]) List<TranscriptSegment> segments,
  }) = _TranscribeSession;

  String get fullText => segments
      .where((segment) => segment.source == SegmentSource.vosk)
      .map((segment) => segment.text.trim())
      .where((text) => text.isNotEmpty)
      .join(' ');

  Duration get duration => (endedAt ?? DateTime.now()).difference(startedAt);

  factory TranscribeSession.fromJson(Map<String, dynamic> json) =>
      _$TranscribeSessionFromJson(json);
}
```

### `lib/features/settings/domain/entities/app_settings.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default('') String language,
    @Default(true) bool darkMode,
    @Default(8) int chunkSeconds,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
```

### When to use DTOs

For this app, domain entities are JSON-safe enough to persist directly. In larger teams, keep DTOs in `data/dto` and map them into domain entities so storage details never leak into business logic. Use DTOs when:

- Local storage shape differs from domain shape.
- Vosk or another plugin returns raw JSON that needs normalization.
- Backward-compatible migrations are needed for saved sessions.

## 9. Data Layer, Repositories, and Use Cases

The data layer wraps Flutter plugins and storage APIs. The domain layer exposes contracts; the data layer implements them and is registered through `get_it_injector`.

### `lib/features/transcribe/domain/repositories/transcription_repository.dart`
```dart
import 'dart:io';

abstract interface class TranscriptionRepository {
  Future<bool> hasMicrophonePermission();
  Future<void> startChunk();
  Future<File?> stopChunk();
  Future<void> startPreview({
    required String localeId,
    required void Function(String text) onPartial,
  });
  Future<void> stopPreview();
  Future<String> transcribeChunk(File wavFile);
  Future<void> dispose();
}
```

### `lib/features/transcribe/domain/repositories/session_repository.dart`
```dart
import '../entities/transcribe_session.dart';

abstract interface class SessionRepository {
  Future<List<TranscribeSession>> loadSessions();
  Future<void> saveSession(TranscribeSession session);
  Future<void> deleteSession(String id);
}
```

### `lib/features/settings/domain/repositories/settings_repository.dart`
```dart
import '../entities/app_settings.dart';

abstract interface class SettingsRepository {
  Future<AppSettings> loadSettings();
  Future<void> saveSettings(AppSettings settings);
}
```

### `lib/features/transcribe/data/datasources/audio_recorder_data_source.dart`
```dart
import 'dart:io';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../../../core/constants/app_constants.dart';

@lazySingleton
class AudioRecorderDataSource {
  final AudioRecorder _recorder = AudioRecorder();
  bool _isRecording = false;
  String? _currentChunkPath;

  bool get isRecording => _isRecording;

  Future<bool> hasPermission() => _recorder.hasPermission();

  Future<void> startChunk() async {
    final dir = await getTemporaryDirectory();
    final path = '${dir.path}/chunk_${DateTime.now().millisecondsSinceEpoch}.wav';
    _currentChunkPath = path;

    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.wav,
        sampleRate: AppConstants.voskSampleRateHz,
        numChannels: 1,
        bitRate: 128000,
      ),
      path: path,
    );
    _isRecording = true;
  }

  Future<File?> stopChunk() async {
    if (!_isRecording) return null;
    await _recorder.stop();
    _isRecording = false;

    final path = _currentChunkPath;
    _currentChunkPath = null;
    if (path == null) return null;

    final file = File(path);
    return file.existsSync() ? file : null;
  }

  Future<void> dispose() => _recorder.dispose();
}
```

### `lib/features/transcribe/data/datasources/vosk_data_source.dart`
```dart
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:vosk_flutter_service/vosk_flutter.dart';

import '../../../../core/constants/app_constants.dart';

@lazySingleton
class VoskDataSource {
  final VoskFlutterPlugin _vosk = VoskFlutterPlugin.instance();
  final ModelLoader _modelLoader = ModelLoader();

  Model? _model;

  Future<void> ensureInitialized() async {
    if (_model != null) return;
    final modelDir = await _modelLoader.loadFromAssets(AppConstants.voskModelAsset);
    _model = await _vosk.createModel(modelDir);
  }

  Future<String> transcribe(File wavFile) async {
    await ensureInitialized();

    final bytes = await wavFile.readAsBytes();
    if (bytes.isEmpty) return '';

    final recognizer = await _vosk.createRecognizer(
      model: _model!,
      sampleRate: AppConstants.voskSampleRateHz,
    );

    try {
      const chunkSize = 8192;
      var position = 0;
      while (position + chunkSize < bytes.length) {
        await recognizer.acceptWaveformBytes(
          Uint8List.fromList(bytes.sublist(position, position + chunkSize)),
        );
        position += chunkSize;
      }
      await recognizer.acceptWaveformBytes(Uint8List.fromList(bytes.sublist(position)));

      final raw = await recognizer.getFinalResult();
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return (map['text'] as String? ?? '').trim();
    } catch (_) {
      return '';
    } finally {
      await recognizer.dispose();
    }
  }
}
```

### `lib/features/transcribe/data/datasources/speech_preview_data_source.dart`
```dart
import 'package:get_it_injector/get_it_injector.dart';
import 'package:speech_to_text/speech_to_text.dart';

@lazySingleton
class SpeechPreviewDataSource {
  final SpeechToText _stt = SpeechToText();
  bool _available = false;

  Future<bool> initialize() async {
    _available = await _stt.initialize();
    return _available;
  }

  Future<void> startListening({
    required void Function(String text) onPartial,
    required String localeId,
  }) async {
    if (!_available) await initialize();
    if (!_available) return;

    await _stt.listen(
      onResult: (result) => onPartial(result.recognizedWords),
      localeId: localeId,
      listenMode: ListenMode.dictation,
      pauseFor: const Duration(seconds: 3),
      cancelOnError: false,
    );
  }

  Future<void> stop() async {
    if (_stt.isListening) await _stt.stop();
  }

  void dispose() => _stt.cancel();
}
```

### `lib/features/transcribe/data/repositories/transcription_repository_impl.dart`
```dart
import 'dart:io';

import 'package:get_it_injector/get_it_injector.dart';

import '../../domain/repositories/transcription_repository.dart';
import '../datasources/audio_recorder_data_source.dart';
import '../datasources/speech_preview_data_source.dart';
import '../datasources/vosk_data_source.dart';

@lazySingleton
class TranscriptionRepositoryImpl implements TranscriptionRepository {
  TranscriptionRepositoryImpl(
    this._audioRecorder,
    this._speechPreview,
    this._vosk,
  );

  final AudioRecorderDataSource _audioRecorder;
  final SpeechPreviewDataSource _speechPreview;
  final VoskDataSource _vosk;

  @override
  Future<bool> hasMicrophonePermission() => _audioRecorder.hasPermission();

  @override
  Future<void> startChunk() => _audioRecorder.startChunk();

  @override
  Future<File?> stopChunk() => _audioRecorder.stopChunk();

  @override
  Future<void> startPreview({
    required String localeId,
    required void Function(String text) onPartial,
  }) =>
      _speechPreview.startListening(localeId: localeId, onPartial: onPartial);

  @override
  Future<void> stopPreview() => _speechPreview.stop();

  @override
  Future<String> transcribeChunk(File wavFile) => _vosk.transcribe(wavFile);

  @override
  Future<void> dispose() async {
    await _audioRecorder.dispose();
    _speechPreview.dispose();
  }
}
```


### `lib/features/transcribe/data/datasources/session_local_data_source.dart`
```dart
import 'dart:convert';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/transcribe_session.dart';

@lazySingleton
class SessionLocalDataSource {
  static const _sessionsKey = 'transcribe_sessions';

  Future<List<TranscribeSession>> loadSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_sessionsKey) ?? [];
    return raw
        .map((value) => TranscribeSession.fromJson(jsonDecode(value) as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => b.startedAt.compareTo(a.startedAt));
  }

  Future<void> saveSession(TranscribeSession session) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getStringList(_sessionsKey) ?? [];
    final encoded = jsonEncode(session.toJson());

    final index = existing.indexWhere((value) {
      final decoded = jsonDecode(value) as Map<String, dynamic>;
      return decoded['id'] == session.id;
    });

    if (index >= 0) {
      existing[index] = encoded;
    } else {
      existing.add(encoded);
    }

    await prefs.setStringList(_sessionsKey, existing);
  }

  Future<void> deleteSession(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getStringList(_sessionsKey) ?? [];
    existing.removeWhere((value) {
      final decoded = jsonDecode(value) as Map<String, dynamic>;
      return decoded['id'] == id;
    });
    await prefs.setStringList(_sessionsKey, existing);
  }
}
```

### `lib/features/transcribe/data/repositories/session_repository_impl.dart`
```dart
import 'package:get_it_injector/get_it_injector.dart';

import '../../domain/entities/transcribe_session.dart';
import '../../domain/repositories/session_repository.dart';
import '../datasources/session_local_data_source.dart';

@lazySingleton
class SessionRepositoryImpl implements SessionRepository {
  SessionRepositoryImpl(this._localDataSource);

  final SessionLocalDataSource _localDataSource;

  @override
  Future<List<TranscribeSession>> loadSessions() => _localDataSource.loadSessions();

  @override
  Future<void> saveSession(TranscribeSession session) => _localDataSource.saveSession(session);

  @override
  Future<void> deleteSession(String id) => _localDataSource.deleteSession(id);
}
```

### `lib/features/settings/data/datasources/settings_local_data_source.dart`
```dart
import 'dart:convert';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/app_settings.dart';

@lazySingleton
class SettingsLocalDataSource {
  static const _settingsKey = 'app_settings';

  Future<AppSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_settingsKey);
    if (raw == null) return const AppSettings();
    return AppSettings.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveSettings(AppSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, jsonEncode(settings.toJson()));
  }
}
```

### `lib/features/settings/data/repositories/settings_repository_impl.dart`
```dart
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
```

### Use cases

Use cases keep orchestration out of widgets and BLoCs. Keep them small and register them as factories, because they are cheap stateless objects.

### `lib/features/transcribe/domain/usecases/transcribe_wav_chunk.dart`
```dart
import 'dart:io';

import 'package:get_it_injector/get_it_injector.dart';

import '../repositories/transcription_repository.dart';

@factory
class TranscribeWavChunk {
  TranscribeWavChunk(this._repository);

  final TranscriptionRepository _repository;

  Future<String> call(File wavFile) => _repository.transcribeChunk(wavFile);
}
```

### `lib/features/transcribe/domain/usecases/save_session.dart`
```dart
import 'package:get_it_injector/get_it_injector.dart';

import '../entities/transcribe_session.dart';
import '../repositories/session_repository.dart';

@factory
class SaveSession {
  SaveSession(this._repository);

  final SessionRepository _repository;

  Future<void> call(TranscribeSession session) => _repository.saveSession(session);
}
```

### `lib/features/transcribe/domain/usecases/dispose_transcription_resources.dart`
```dart
import 'package:get_it_injector/get_it_injector.dart';

import '../repositories/transcription_repository.dart';

@factory
class DisposeTranscriptionResources {
  DisposeTranscriptionResources(this._repository);

  final TranscriptionRepository _repository;

  Future<void> call() => _repository.dispose();
}
```

For the remaining transcribe use cases (`StartPreview`, `StopPreview`, `StartRecordingChunk`, `StopRecordingChunk`, `HasMicrophonePermission`), follow the same pattern: one class, one `call` method, one injected repository contract. This keeps the BLoC focused on state transitions.

## 10. State Management (BLoC + Freezed)

Use **BLoC** for event-driven flows and **Freezed** for immutable events/states. `TranscribeBloc` coordinates timers, recording chunks, live preview, and session persistence through use cases. `SettingsCubit` and `HistoryCubit` stay lighter because they only load/update simple state.

### `lib/features/transcribe/presentation/bloc/transcribe_event.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../settings/domain/entities/app_settings.dart';

part 'transcribe_event.freezed.dart';

@freezed
sealed class TranscribeEvent with _$TranscribeEvent {
  const factory TranscribeEvent.started(AppSettings settings) = TranscribeStarted;
  const factory TranscribeEvent.livePreviewUpdated(String text) = TranscribeLivePreviewUpdated;
  const factory TranscribeEvent.chunkTimerFired() = TranscribeChunkTimerFired;
  const factory TranscribeEvent.voskSegmentAdded(String text) = TranscribeVoskSegmentAdded;
  const factory TranscribeEvent.stopped() = TranscribeStopped;
  const factory TranscribeEvent.reset() = TranscribeReset;
}
```

### `lib/features/transcribe/presentation/bloc/transcribe_state.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/transcribe_session.dart';

part 'transcribe_state.freezed.dart';

enum SessionStatus { idle, recording, processing, error }

@freezed
class TranscribeState with _$TranscribeState {
  const factory TranscribeState({
    @Default(SessionStatus.idle) SessionStatus status,
    TranscribeSession? session,
    @Default('') String livePreviewText,
    String? errorMessage,
  }) = _TranscribeState;
}
```

### `lib/features/transcribe/presentation/bloc/transcribe_bloc.dart`
```dart
import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_injector/get_it_injector.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/locale_mapper.dart';
import '../../../settings/domain/entities/app_settings.dart';
import '../../domain/entities/transcribe_session.dart';
import '../../domain/entities/transcript_segment.dart';
import '../../domain/usecases/dispose_transcription_resources.dart';
import '../../domain/usecases/has_microphone_permission.dart';
import '../../domain/usecases/save_session.dart';
import '../../domain/usecases/start_preview.dart';
import '../../domain/usecases/start_recording_chunk.dart';
import '../../domain/usecases/stop_preview.dart';
import '../../domain/usecases/stop_recording_chunk.dart';
import '../../domain/usecases/transcribe_wav_chunk.dart';
import 'transcribe_event.dart';
import 'transcribe_state.dart';

@factory
class TranscribeBloc extends Bloc<TranscribeEvent, TranscribeState> {
  TranscribeBloc({
    required HasMicrophonePermission hasMicrophonePermission,
    required StartPreview startPreview,
    required StopPreview stopPreview,
    required StartRecordingChunk startRecordingChunk,
    required StopRecordingChunk stopRecordingChunk,
    required TranscribeWavChunk transcribeWavChunk,
    required SaveSession saveSession,
    required DisposeTranscriptionResources disposeTranscriptionResources,
  })  : _hasMicrophonePermission = hasMicrophonePermission,
        _startPreview = startPreview,
        _stopPreview = stopPreview,
        _startRecordingChunk = startRecordingChunk,
        _stopRecordingChunk = stopRecordingChunk,
        _transcribeWavChunk = transcribeWavChunk,
        _saveSession = saveSession,
        _disposeTranscriptionResources = disposeTranscriptionResources,
        super(const TranscribeState()) {
    on<TranscribeStarted>(_onStarted);
    on<TranscribeLivePreviewUpdated>(_onPreview);
    on<TranscribeChunkTimerFired>(_onChunkTimer);
    on<TranscribeVoskSegmentAdded>(_onVoskSegment);
    on<TranscribeStopped>(_onStopped);
    on<TranscribeReset>(_onReset);
  }

  final HasMicrophonePermission _hasMicrophonePermission;
  final StartPreview _startPreview;
  final StopPreview _stopPreview;
  final StartRecordingChunk _startRecordingChunk;
  final StopRecordingChunk _stopRecordingChunk;
  final TranscribeWavChunk _transcribeWavChunk;
  final SaveSession _saveSession;
  final DisposeTranscriptionResources _disposeTranscriptionResources;
  final _uuid = const Uuid();

  AppSettings? _activeSettings;
  Timer? _chunkTimer;

  Future<void> _onStarted(
    TranscribeStarted event,
    Emitter<TranscribeState> emit,
  ) async {
    _activeSettings = event.settings;

    final hasPermission = await _hasMicrophonePermission();
    if (!hasPermission) {
      emit(state.copyWith(
        status: SessionStatus.error,
        errorMessage: 'Microphone permission denied.',
      ));
      return;
    }

    final session = TranscribeSession(
      id: _uuid.v4(),
      startedAt: DateTime.now(),
      language: event.settings.language,
    );

    emit(state.copyWith(status: SessionStatus.recording, session: session));

    await _startPreview(
      localeId: LocaleMapper.toSpeechLocale(event.settings.language),
      onPartial: (text) => add(TranscribeEvent.livePreviewUpdated(text)),
    );

    await _startRecordingChunk();
    _scheduleChunkTimer();
  }

  void _onPreview(
    TranscribeLivePreviewUpdated event,
    Emitter<TranscribeState> emit,
  ) {
    emit(state.copyWith(livePreviewText: event.text));
  }

  void _scheduleChunkTimer() {
    _chunkTimer?.cancel();
    final seconds = _activeSettings?.chunkSeconds ?? 8;
    _chunkTimer = Timer(Duration(seconds: seconds), () {
      add(const TranscribeEvent.chunkTimerFired());
    });
  }

  Future<void> _onChunkTimer(
    TranscribeChunkTimerFired event,
    Emitter<TranscribeState> emit,
  ) async {
    if (state.status != SessionStatus.recording) return;

    final wavFile = await _stopRecordingChunk();
    if (wavFile != null && await wavFile.length() > 1000) {
      unawaited(_transcribeChunkInBackground(wavFile));
    }

    if (state.status == SessionStatus.recording) {
      await _startRecordingChunk();
      _scheduleChunkTimer();
    }
  }

  Future<void> _transcribeChunkInBackground(File wavFile) async {
    try {
      final text = await _transcribeWavChunk(wavFile);
      if (text.isNotEmpty) add(TranscribeEvent.voskSegmentAdded(text));
    } finally {
      if (await wavFile.exists()) await wavFile.delete();
    }
  }

  Future<void> _onVoskSegment(
    TranscribeVoskSegmentAdded event,
    Emitter<TranscribeState> emit,
  ) async {
    final session = state.session;
    if (session == null) return;

    final updated = session.copyWith(
      segments: [
        ...session.segments,
        TranscriptSegment(
          id: _uuid.v4(),
          text: event.text,
          timestamp: DateTime.now(),
          source: SegmentSource.vosk,
        ),
      ],
    );

    emit(state.copyWith(session: updated, livePreviewText: ''));
    await _saveSession(updated);
  }

  Future<void> _onStopped(
    TranscribeStopped event,
    Emitter<TranscribeState> emit,
  ) async {
    _chunkTimer?.cancel();
    await _stopPreview();

    final wavFile = await _stopRecordingChunk();
    final current = state.session;
    if (current == null) {
      emit(state.copyWith(status: SessionStatus.idle, livePreviewText: ''));
      return;
    }

    var session = current.copyWith(endedAt: DateTime.now());
    emit(state.copyWith(status: SessionStatus.processing, session: session));

    if (wavFile != null && await wavFile.length() > 1000) {
      final text = await _transcribeWavChunk(wavFile);
      if (text.isNotEmpty) {
        session = session.copyWith(
          segments: [
            ...session.segments,
            TranscriptSegment(
              id: _uuid.v4(),
              text: text,
              timestamp: DateTime.now(),
              source: SegmentSource.vosk,
            ),
          ],
        );
      }
      if (await wavFile.exists()) await wavFile.delete();
    }

    await _saveSession(session);
    emit(state.copyWith(status: SessionStatus.idle, session: session, livePreviewText: ''));
  }

  void _onReset(TranscribeReset event, Emitter<TranscribeState> emit) {
    emit(const TranscribeState());
  }

  @override
  Future<void> close() async {
    _chunkTimer?.cancel();
    await _disposeTranscriptionResources();
    return super.close();
  }
}
```

### `lib/features/settings/presentation/cubit/settings_state.dart`
```dart
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
```

### `lib/features/settings/presentation/cubit/settings_cubit.dart`
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_injector/get_it_injector.dart';

import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import 'settings_state.dart';

@factory
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._repository) : super(const SettingsState());

  final SettingsRepository _repository;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final settings = await _repository.loadSettings();
    emit(state.copyWith(settings: settings, isLoading: false));
  }

  Future<void> update(AppSettings settings) async {
    emit(state.copyWith(settings: settings));
    await _repository.saveSettings(settings);
  }
}
```

### `lib/features/history/presentation/cubit/history_state.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../transcribe/domain/entities/transcribe_session.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = HistoryInitial;
  const factory HistoryState.loading() = HistoryLoading;
  const factory HistoryState.loaded(List<TranscribeSession> sessions) = HistoryLoaded;
  const factory HistoryState.failure(String message) = HistoryFailure;
}
```

### `lib/features/history/presentation/cubit/history_cubit.dart`
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_injector/get_it_injector.dart';

import '../../../transcribe/domain/repositories/session_repository.dart';
import 'history_state.dart';

@factory
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this._sessionRepository) : super(const HistoryState.initial());

  final SessionRepository _sessionRepository;

  Future<void> load() async {
    emit(const HistoryState.loading());
    try {
      emit(HistoryState.loaded(await _sessionRepository.loadSessions()));
    } catch (error) {
      emit(HistoryState.failure(error.toString()));
    }
  }

  Future<void> delete(String id) async {
    await _sessionRepository.deleteSession(id);
    await load();
  }
}
```

## 11. Pages & Screens

### `lib/features/splash/presentation/pages/splash_page.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.graphic_eq, size: 80, color: Colors.cyanAccent)
                .animate()
                .fadeIn(duration: 600.ms)
                .scale(),
            const SizedBox(height: 24),
            Text(
              'AR Transcribe',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.cyanAccent,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideY(begin: 0.2),
          ],
        ),
      ),
    );
  }
}
```

### `lib/features/home/presentation/pages/home_page.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/language_selector.dart';
import '../../../settings/presentation/cubit/settings_cubit.dart';
import '../../../settings/presentation/cubit/settings_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final settings = state.settings;

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'AR Transcribe',
              style: TextStyle(color: Colors.cyanAccent, letterSpacing: 2),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.history, color: Colors.white70),
                onPressed: () => Navigator.pushNamed(context, '/history'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Real-time transcription',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Speak naturally. Audio is captured in chunks and transcribed offline with Vosk; live preview uses on-device STT.',
                        style: TextStyle(color: Colors.white60, height: 1.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text('Language', style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 8),
                LanguageSelector(
                  selected: settings.language,
                  onChanged: (code) {
                    context.read<SettingsCubit>().update(settings.copyWith(language: code));
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Chunk duration', style: TextStyle(color: Colors.white70)),
                    const Spacer(),
                    DropdownButton<int>(
                      value: settings.chunkSeconds,
                      dropdownColor: const Color(0xFF1A1A2E),
                      style: const TextStyle(color: Colors.cyanAccent),
                      items: [5, 8, 10, 15]
                          .map((seconds) => DropdownMenuItem(
                                value: seconds,
                                child: Text('${seconds}s'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          context.read<SettingsCubit>().update(
                                settings.copyWith(chunkSeconds: value),
                              );
                        }
                      },
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton.icon(
                  icon: const Icon(Icons.mic, size: 28),
                  label: const Text(
                    'Start Transcribing',
                    style: TextStyle(fontSize: 18, letterSpacing: 1.5),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/transcribe'),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}
```

### `lib/features/transcribe/presentation/pages/transcribe_page.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../shared/widgets/live_waveform.dart';
import '../../../../shared/widgets/transcript_bubble.dart';
import '../../../settings/presentation/cubit/settings_cubit.dart';
import '../../domain/entities/transcribe_session.dart';
import '../bloc/transcribe_bloc.dart';
import '../bloc/transcribe_event.dart';
import '../bloc/transcribe_state.dart';

class TranscribePage extends StatefulWidget {
  const TranscribePage({super.key});

  @override
  State<TranscribePage> createState() => _TranscribePageState();
}

class _TranscribePageState extends State<TranscribePage> {
  final _scrollController = ScrollController();
  bool _autoScroll = true;
  bool _leaveAfterStop = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final settings = context.read<SettingsCubit>().state.settings;
      context.read<TranscribeBloc>().add(TranscribeEvent.started(settings));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (!_autoScroll) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _stopAndReturn() {
    _leaveAfterStop = true;
    context.read<TranscribeBloc>().add(const TranscribeEvent.stopped());
  }

  void _copyAll(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transcript copied!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranscribeBloc, TranscribeState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
        if (_leaveAfterStop && state.status == SessionStatus.idle) {
          Navigator.pop(context);
          return;
        }
        if ((state.session?.segments.isNotEmpty ?? false) || state.livePreviewText.isNotEmpty) {
          _scrollToBottom();
        }
      },
      builder: (context, state) {
        final isRecording = state.status == SessionStatus.recording;
        final session = state.session;
        final segments = session?.segments ?? [];
        final fullText = session?.fullText ?? '';

        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                _buildTopBar(isRecording, fullText),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is UserScrollNotification) {
                        setState(() => _autoScroll = false);
                      }
                      return false;
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      itemCount: segments.length + (state.livePreviewText.isNotEmpty ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == segments.length && state.livePreviewText.isNotEmpty) {
                          return TranscriptBubble(
                            text: state.livePreviewText,
                            isPreview: true,
                            timestamp: DateTime.now(),
                          );
                        }

                        final segment = segments[index];
                        return TranscriptBubble(
                          text: segment.text,
                          isPreview: false,
                          timestamp: segment.timestamp,
                        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1);
                      },
                    ),
                  ),
                ),
                if (isRecording)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: LiveWaveform(isActive: true),
                  ),
                _buildBottomBar(isRecording, session),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopBar(bool isRecording, String fullText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.cyanAccent.withOpacity(0.2), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isRecording ? Colors.redAccent : Colors.white30,
            ),
          ).animate(onPlay: (controller) => controller.repeat()).fadeOut(duration: 500.ms).then().fadeIn(duration: 500.ms),
          const SizedBox(width: 10),
          Text(
            isRecording ? 'Recording...' : 'Stopped',
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const Spacer(),
          if (fullText.isNotEmpty) ...[
            IconButton(
              icon: const Icon(Icons.copy, color: Colors.white60, size: 20),
              onPressed: () => _copyAll(fullText),
            ),
            IconButton(
              icon: const Icon(Icons.share, color: Colors.white60, size: 20),
              onPressed: () => Share.share(fullText),
            ),
          ],
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white60),
            onPressed: _stopAndReturn,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(bool isRecording, TranscribeSession? session) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!_autoScroll)
            IconButton(
              icon: const Icon(Icons.arrow_downward, color: Colors.white54),
              onPressed: () {
                setState(() => _autoScroll = true);
                _scrollToBottom();
              },
            ),
          const Spacer(),
          GestureDetector(
            onTap: isRecording ? _stopAndReturn : null,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isRecording ? Colors.redAccent : Colors.white30,
                  width: 3,
                ),
              ),
              child: Center(
                child: Container(
                  width: isRecording ? 28 : 44,
                  height: isRecording ? 28 : 44,
                  decoration: BoxDecoration(
                    color: isRecording ? Colors.redAccent : Colors.white30,
                    borderRadius: BorderRadius.circular(isRecording ? 6 : 22),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          if ((session?.fullText.isNotEmpty ?? false))
            IconButton(
              icon: const Icon(Icons.history, color: Colors.white54),
              onPressed: () => Navigator.pushNamed(context, '/history'),
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}
```

### `lib/features/history/presentation/pages/history_page.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../../transcribe/domain/entities/transcribe_session.dart';
import '../cubit/history_cubit.dart';
import '../cubit/history_state.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'History',
          style: TextStyle(color: Colors.cyanAccent, letterSpacing: 2),
        ),
        leading: const BackButton(color: Colors.white70),
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          return switch (state) {
            HistoryInitial() || HistoryLoading() =>
              const Center(child: CircularProgressIndicator(color: Colors.cyanAccent)),
            HistoryFailure(:final message) => Center(
                child: Text(message, style: const TextStyle(color: Colors.redAccent)),
              ),
            HistoryLoaded(:final sessions) => sessions.isEmpty
                ? const Center(
                    child: Text('No sessions yet.', style: TextStyle(color: Colors.white38)),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: sessions.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) => _SessionCard(session: sessions[index]),
                  ),
          };
        },
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({required this.session});

  final TranscribeSession session;

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('MMM d, yyyy  HH:mm');
    final duration = session.duration;
    final durationLabel = '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white12),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.04),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(fmt.format(session.startedAt), style: const TextStyle(color: Colors.white54, fontSize: 12)),
              const Spacer(),
              Text(durationLabel, style: const TextStyle(color: Colors.cyanAccent, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            session.fullText.isEmpty ? '(empty session)' : session.fullText,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: session.fullText.isEmpty ? Colors.white24 : Colors.white,
              height: 1.5,
            ),
          ),
          if (session.fullText.isNotEmpty) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.copy, size: 16),
                  label: const Text('Copy'),
                  style: TextButton.styleFrom(foregroundColor: Colors.white54),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: session.fullText));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied!')));
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.share, size: 16),
                  label: const Text('Share'),
                  style: TextButton.styleFrom(foregroundColor: Colors.white54),
                  onPressed: () => Share.share(session.fullText),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                  onPressed: () => context.read<HistoryCubit>().delete(session.id),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
```

## 12. Widgets

### `lib/shared/widgets/transcript_bubble.dart`
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscriptBubble extends StatelessWidget {
  final String text;
  final bool isPreview;
  final DateTime timestamp;

  const TranscriptBubble({
    super.key,
    required this.text,
    required this.isPreview,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    final timeFmt = DateFormat('HH:mm:ss');

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timestamp
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 10),
            child: Text(
              timeFmt.format(timestamp),
              style: const TextStyle(color: Colors.white24, fontSize: 11),
            ),
          ),

          // Text bubble
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isPreview
                    ? Colors.white.withOpacity(0.05)
                    : Colors.cyanAccent.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isPreview
                      ? Colors.white12
                      : Colors.cyanAccent.withOpacity(0.3),
                  width: 0.5,
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isPreview ? Colors.white54 : Colors.white,
                  fontSize: 15,
                  height: 1.6,
                  fontStyle: isPreview ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

### `lib/shared/widgets/live_waveform.dart`
```dart
import 'dart:math';
import 'package:flutter/material.dart';

class LiveWaveform extends StatefulWidget {
  final bool isActive;
  const LiveWaveform({super.key, required this.isActive});

  @override
  State<LiveWaveform> createState() => _LiveWaveformState();
}

class _LiveWaveformState extends State<LiveWaveform>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _random = Random();
  List<double> _bars = List.filled(30, 0.1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addListener(_updateBars)..repeat();
  }

  void _updateBars() {
    if (!widget.isActive) return;
    setState(() {
      _bars = List.generate(
          30, (_) => 0.1 + _random.nextDouble() * 0.9);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _bars.map((h) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 80),
            width: 3,
            height: widget.isActive ? h * 40 : 4,
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
            decoration: BoxDecoration(
              color: Colors.cyanAccent.withOpacity(0.7),
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }).toList(),
      ),
    );
  }
}
```

### `lib/shared/widgets/language_selector.dart`
```dart
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class LanguageSelector extends StatelessWidget {
  final String selected;
  final void Function(String) onChanged;

  const LanguageSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selected,
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: const Color(0xFF0D0D1A),
        style: const TextStyle(color: Colors.white),
        items: AppConstants.supportedLanguages
            .map((lang) => DropdownMenuItem<String>(
                  value: lang['code']!,
                  child: Text(lang['label']!,
                      style: const TextStyle(color: Colors.white)),
                ))
            .toList(),
        onChanged: (v) {
          if (v != null) onChanged(v);
        },
      ),
    );
  }
}
```

---

## 13. Routing

### `lib/app/routing/app_router.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../../features/history/presentation/cubit/history_cubit.dart';
import '../../features/history/presentation/pages/history_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/transcribe/presentation/bloc/transcribe_bloc.dart';
import '../../features/transcribe/presentation/pages/transcribe_page.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (_) => const SplashPage(),
  '/home': (_) => const HomePage(),
  '/transcribe': (_) => BlocProvider(
        create: (_) => getIt<TranscribeBloc>(),
        child: const TranscribePage(),
      ),
  '/history': (_) => BlocProvider(
        create: (_) => getIt<HistoryCubit>(),
        child: const HistoryPage(),
      ),
};
```

The transcribe and history BLoCs are route-scoped. Leaving the route disposes the BLoC and releases timers, recorder handles, and stream listeners through `close()`.

### `lib/app/app.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'routing/app_router.dart';

class ArTranscribeApp extends StatelessWidget {
  const ArTranscribeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'AR Transcribe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.cyanAccent,
          secondary: Colors.cyanAccent,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xFF1A1A2E),
          contentTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
```

## 14. Supporting Core Files

### `lib/core/utils/locale_mapper.dart`
```dart
abstract final class LocaleMapper {
  static String toSpeechLocale(String languageCode) {
    return switch (languageCode) {
      'de' => 'de_DE',
      'fr' => 'fr_FR',
      'es' => 'es_ES',
      'fa' => 'fa_IR',
      'ar' => 'ar_SA',
      'zh' => 'zh_CN',
      'ja' => 'ja_JP',
      'ru' => 'ru_RU',
      'tr' => 'tr_TR',
      'it' => 'it_IT',
      'pt' => 'pt_PT',
      _ => 'en_US',
    };
  }
}
```

### `lib/core/errors/failure.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.permissionDenied(String message) = PermissionDeniedFailure;
  const factory Failure.storage(String message) = StorageFailure;
  const factory Failure.transcription(String message) = TranscriptionFailure;
  const factory Failure.unknown(String message) = UnknownFailure;
}
```

## 15. Running & Testing

### Generate files first
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This generates Freezed model/state/event files, JSON serializers, and `lib/core/di/injection.config.dart` from the `get_it_injector` annotations.


### Run the app
```bash
# Android
flutter run -d android

# iOS (physical device recommended — mic doesn't work on simulator)
flutter run -d ios
```

### Build release
```bash
# Android APK
flutter build apk --release

# iOS archive (requires Xcode + Apple developer account)
flutter build ipa --release
```

### Common issues & fixes

| Issue | Fix |
|---|---|
| `MicrophonePermissionDenied` | Check `AndroidManifest.xml` and `Info.plist` permissions |
| `Failed to load Vosk model` | Confirm the model zip path matches `AppConstants.voskModelAsset`, the file is listed under `flutter.assets`, and you ran `dart run vosk_flutter_service install -t ios` on iOS (section 7) |
| iOS simulator: no audio | Use a physical device for mic testing |
| `record` plugin crash on iOS | Add `NSMicrophoneUsageDescription` to `Info.plist` |
| Vosk returns empty string | Chunk too short or silence — increase chunk seconds in settings or speak louder; verify sample rate matches `voskSampleRateHz` |
| `speech_to_text` not initializing | iOS: also add `NSSpeechRecognitionUsageDescription` to `Info.plist` |

### Testing without running Vosk on every chunk
Set `chunkSeconds = 99999` in settings so chunk processing never runs, and use only the on-device `speech_to_text` preview. The saved **final** transcript stays empty until you lower chunk duration again and speak through at least one full chunk.

---

## Cost & data summary

| Feature | Cloud / paid API? | Notes |
|---|---|---|
| Live preview text (`speech_to_text`) | No | Uses OS recognizer where available |
| Final transcription (`vosk_flutter_service`) | No | Offline; bundle a model zip (~40MB+ depending on model) |
| Local session history | No | `shared_preferences` only |

Download Vosk models from: **https://alphacephei.com/vosk/models**
