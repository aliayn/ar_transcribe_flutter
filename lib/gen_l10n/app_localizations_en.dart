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
      'Point your camera at a YouTube or news screen. Live English captions (Deepgram) and translation (Gemini) appear as an AR overlay. Add API keys in .env.';

  @override
  String get languageLabel => 'Translation language';

  @override
  String get transcriptChipLabel => 'EN';

  @override
  String get startTranscribing => 'Start Transcribing';

  @override
  String get routeNotFound => 'Route not found';
}
