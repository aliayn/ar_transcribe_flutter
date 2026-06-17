# AR Transcribe

Real-time speech transcription for mobile, with an augmented-reality-style caption overlay. Point your phone camera at a YouTube video, news broadcast, or any screen playing audio — live captions appear over the camera preview in your chosen language.

Built with **Flutter**, powered by **Deepgram Nova-3** streaming STT over WebSocket.

---

## Table of contents

- [What it does](#what-it-does)
- [How it works](#how-it-works)
- [Application launch flow](#application-launch-flow)
- [Prerequisites](#prerequisites)
- [Step-by-step setup](#step-by-step-setup)
- [Running the app](#running-the-app)
- [Using the app](#using-the-app)
- [Configuration](#configuration)
- [Localization](#localization)
- [Project structure](#project-structure)
- [Development commands](#development-commands)
- [Troubleshooting](#troubleshooting)

---

## What it does

| Feature | Description |
|--------|-------------|
| **Live transcription** | Streams microphone audio to Deepgram and shows interim + final captions in real time |
| **AR-style overlay** | Camera preview with a bottom caption panel, live status indicator, and language chip |
| **60+ languages** | Deepgram Nova-3 monolingual and multilingual codes (English, Persian, Arabic, Spanish, …) |
| **Multilingual auto-detect** | Optional `multi` mode lets Deepgram detect the spoken language |
| **Session history** | Past sessions are saved locally; copy, share, or delete from the History screen |
| **App localization** | UI available in **English**, **فارسی (Farsi)**, and **العربية (Arabic)** |

### Permissions required

| Permission | Why |
|-----------|-----|
| **Microphone** | Captures ambient audio (e.g. from a nearby speaker or TV) for transcription |
| **Camera** | Shows the AR preview while you point at a screen |
| **Internet** | Connects to the Deepgram WebSocket API |

---

## How it works

```
┌─────────────┐     PCM 16 kHz      ┌──────────────┐     WebSocket      ┌─────────────┐
│  Microphone │ ──────────────────► │  Flutter app │ ─────────────────► │  Deepgram   │
│  (record)   │                     │  (Bloc)      │ ◄───────────────── │  Nova-3     │
└─────────────┘                     └──────┬───────┘   transcript JSON  └─────────────┘
                                           │
┌─────────────┐                            ▼
│   Camera    │ ─── preview ───►   AR caption overlay
└─────────────┘                    (live + fading history)
```

1. You pick a **transcription language** on the home screen.
2. On **Start Transcribing**, the app requests microphone access, opens a Deepgram WebSocket, and starts streaming PCM audio.
3. Interim results appear as a live preview line; finalized segments are appended to the overlay and saved to local storage.
4. The camera runs in parallel so you can aim at a screen while reading captions.

---

## Application launch flow

This is what happens from tap-to-open through the first transcription session.

### 1. Cold start (`main.dart`)

```
WidgetsFlutterBinding.ensureInitialized()
        │
        ▼
configureDependencies()          ← GetIt / injectable DI
        │
        ▼
AppInitializer.ensureInitialized() ← loads .env in background (non-blocking)
        │
        ▼
runApp(BlocProvider<SettingsCubit>) ← loads saved settings (locale, language)
        │
        ▼
ArTranscribeApp → MaterialApp.router (locale from settings)
```

- `.env` is loaded asynchronously so the first frame is not blocked.
- Settings (app language, transcription language, dark mode) are read from `SharedPreferences`.

### 2. Splash screen (`/`)

```
SplashPage
   │
   ├─ wait for AppInitializer.ensureInitialized()  (.env ready)
   ├─ minimum branding delay (3 seconds)
   └─ context.go('/home')
```

### 3. Home screen (`/home`)

- Choose **App language** (UI strings: en / fa / ar).
- Choose **Transcription language** (Deepgram STT code).
- Tap **Start Transcribing** → navigates to `/transcribe`.

### 4. Transcribe screen (`/transcribe`)

```
TranscribePage mounts
   │
   ├─ request camera permission → initialize CameraController (back camera)
   ├─ TranscribeBloc.add(started(settings))
   │      ├─ validate DEEPGRAM_API_KEY in .env
   │      ├─ request microphone permission
   │      ├─ create TranscribeSession
   │      └─ connect Deepgram WebSocket + start PCM stream
   │
   └─ ArTranscriptOverlay shows live captions over camera preview
```

- **Green “Live”** = WebSocket connected and session recording.
- **Back** stops the session, disconnects Deepgram, saves transcript if non-empty, and returns home.

### 5. History (`/history`)

Accessible from the home app bar. Loads saved sessions from local storage.

---

## Prerequisites

| Requirement | Notes |
|------------|-------|
| **Flutter SDK** | `>=3.2.0` (tested on Flutter 3.35 stable) |
| **Dart SDK** | Bundled with Flutter |
| **Xcode** | Required for iOS builds (macOS only) |
| **Android Studio / SDK** | Required for Android builds |
| **CocoaPods** | `pod install` in `ios/` for iOS dependencies |
| **Deepgram API key** | [Sign up at Deepgram](https://console.deepgram.com/) — free tier available |
| **Physical device** | Recommended — camera + microphone work best on real hardware |

Check your environment:

```bash
flutter doctor -v
```

---

## Step-by-step setup

### Step 1 — Clone the repository

```bash
git clone https://github.com/aliayn/ar_transcribe_flutter.git
cd ar_transcribe
```

### Step 2 — Install Flutter dependencies

```bash
flutter pub get
```

### Step 3 — Configure API keys

Copy the example env file and add your Deepgram key:

```bash
cp .env.example .env
```

Edit `.env`:

```env
DEEPGRAM_API_KEY=your_deepgram_api_key_here
DEEPGRAM_MODEL=nova-3
DEEPGRAM_LANGUAGE=en-US
```

> **Important:** `.env` is listed in `.gitignore` — never commit API keys.

Optional (for future Gemini translation support):

```env
GEMINI_API_KEY=your_gemini_api_key_here
GEMINI_MODEL=gemini-2.0-flash
```

### Step 4 — Generate code

Localization and Freezed/DI code are not checked in as hand-written sources; generate them after clone:

```bash
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
```

### Step 5 — iOS setup (macOS only)

```bash
cd ios
pod install
cd ..
```

Open `ios/Runner.xcworkspace` in Xcode if you need to configure signing (Team + Bundle ID).

### Step 6 — Connect a device or start an emulator

```bash
flutter devices
```

- **iOS Simulator** supports the UI but has limited microphone/camera behavior.
- **Physical iPhone or Android phone** is strongly recommended for transcription testing.

---

## Running the app

### Debug (default)

```bash
flutter run
```

Pick a device when prompted, or target one explicitly:

```bash
flutter run -d <device_id>
```

### Profile / release

```bash
flutter run --profile
flutter run --release
```

### VS Code / Cursor

Use the launch configurations in `.vscode/launch.json`:

- **App (debug mode)**
- **App (profile mode)**
- **App (release mode)**

### First-run checklist

1. `.env` exists at the project root with a valid `DEEPGRAM_API_KEY`.
2. App launches → splash → home screen.
3. Grant **microphone** permission when starting transcription.
4. Grant **camera** permission for the AR preview.
5. Play audio near the device (or point at a screen with sound) — captions should appear within a few seconds.

---

## Using the app

### Step 1 — Open the app

Wait for the splash screen; you land on **Home**.

### Step 2 — Set languages

| Setting | What it controls |
|--------|------------------|
| **App language** | Menus, buttons, and labels (English / فارسی / العربية) |
| **Transcription language** | Spoken language sent to Deepgram (60+ options, or **Multilingual**) |

### Step 3 — Start transcribing

1. Tap **Start Transcribing**.
2. Allow microphone and camera access if prompted.
3. Point the camera at a screen playing audio (YouTube, news, lecture, etc.).
4. Read live captions on the AR overlay at the bottom of the screen.

### Step 4 — Stop and review

- Tap the **back** arrow to end the session.
- Open **History** (clock icon on the home app bar) to view, copy, share, or delete past sessions.

---

## Configuration

All runtime API settings are read from `.env` via `flutter_dotenv`.

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `DEEPGRAM_API_KEY` | **Yes** | — | Deepgram API token |
| `DEEPGRAM_MODEL` | No | `nova-3` | STT model |
| `DEEPGRAM_LANGUAGE` | No | `en-US` | Fallback language if not overridden in app settings |
| `GEMINI_API_KEY` | No | — | Reserved for translation (currently disabled) |
| `GEMINI_MODEL` | No | `gemini-2.0-flash` | Gemini model name |

The transcription language selected in the app UI overrides `DEEPGRAM_LANGUAGE` at session start.

---

## Localization

- ARB source files: `lib/l10n/app_en.arb`, `app_fa.arb`, `app_ar.arb`
- Generated output: `lib/gen_l10n/`
- Config: `l10n.yaml`

After editing ARB files:

```bash
flutter gen-l10n
```

Language picker labels for 60+ Deepgram codes are localized via `lib/core/l10n/language_labels.dart`.

---

## Project structure

```
lib/
├── app/                    # MaterialApp, routing (go_router)
├── core/
│   ├── config/             # .env, feature flags
│   ├── constants/          # language codes
│   ├── di/                 # GetIt dependency injection
│   ├── l10n/               # language label + error helpers
│   └── startup/            # .env bootstrap
├── features/
│   ├── home/               # settings + start CTA
│   ├── splash/             # branding + init gate
│   ├── transcribe/         # bloc, Deepgram, camera, AR overlay
│   ├── history/            # saved sessions
│   └── settings/           # persisted app preferences
├── gen_l10n/               # generated localizations
├── l10n/                   # ARB translation files
└── shared/widgets/         # ArTranscriptOverlay, LanguageSelector
```

**Stack:** Flutter Bloc · Freezed · go_router · get_it_injector · Deepgram WebSocket · camera · record

---

## Development commands

```bash
# Install dependencies
flutter pub get

# Regenerate localizations
flutter gen-l10n

# Regenerate Freezed / JSON / DI
dart run build_runner build --delete-conflicting-outputs

# Analyze
flutter analyze lib/

# Tests
flutter test

# Regenerate app icons (after changing assets/icons/app_icon.png)
dart run flutter_launcher_icons
```

---

## Troubleshooting

| Problem | Solution |
|--------|----------|
| **“Add DEEPGRAM_API_KEY to .env”** | Create `.env` from `.env.example` and set a valid key. Restart the app. |
| **No captions appear** | Confirm microphone permission; ensure audio is audible near the device; check network connectivity. |
| **Camera black screen** | Grant camera permission in system Settings; use a physical device. |
| **Build errors after clone** | Run `flutter pub get`, then `flutter gen-l10n` and `dart run build_runner build --delete-conflicting-outputs`. |
| **iOS pod errors** | `cd ios && pod install --repo-update && cd ..` |
| **`.env` not found at runtime** | `.env` must sit at the project root and be listed under `flutter: assets:` in `pubspec.yaml`. |

---

## Credits

Inspired by the [ar-games/ar-transcribe](https://github.com/ar-games/ar-transcribe) web prototype. Speech-to-text powered by [Deepgram](https://deepgram.com/).
