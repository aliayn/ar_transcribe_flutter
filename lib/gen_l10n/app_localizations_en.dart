// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AR Transcribe';

  @override
  String get realtimeTitle => 'Real-time transcription';

  @override
  String get realtimeDescription =>
      'Speak naturally. Audio is captured in chunks and transcribed offline with Vosk; live preview uses on-device STT.';

  @override
  String get languageLabel => 'Language';

  @override
  String get chunkDurationLabel => 'Chunk duration';

  @override
  String get startTranscribing => 'Start Transcribing';

  @override
  String get routeNotFound => 'Route not found';
}
