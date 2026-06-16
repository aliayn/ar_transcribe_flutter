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
      'Point your camera at a YouTube or news screen. Live captions in your chosen language appear as an AR overlay via Deepgram Nova-3. Add DEEPGRAM_API_KEY in .env.';

  @override
  String get appLocaleLabel => 'App language';

  @override
  String get languageLabel => 'Transcription language';

  @override
  String get startTranscribing => 'Start Transcribing';

  @override
  String get routeNotFound => 'Route not found';
}
