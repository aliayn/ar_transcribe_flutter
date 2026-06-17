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

  @override
  String get overlayEmptyHint =>
      'Point the camera at the screen and play audio…';

  @override
  String get statusLive => 'Live';

  @override
  String get statusStopped => 'Stopped';

  @override
  String get cameraPermissionDeniedPermanent =>
      'Camera permission denied. Enable it in Settings.';

  @override
  String get cameraPermissionRequired =>
      'Camera permission is required for the AR preview.';

  @override
  String get cameraNotFound => 'No camera found on this device.';

  @override
  String get cameraOpenFailed => 'Could not open camera.';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get copiedShort => 'Copied!';

  @override
  String get historyTitle => 'History';

  @override
  String get historyEmpty => 'No sessions yet.';

  @override
  String get historyLoadFailed => 'Could not load history.';

  @override
  String get emptySession => '(empty session)';

  @override
  String get copyAction => 'Copy';

  @override
  String get shareAction => 'Share';

  @override
  String get errorMissingDeepgramApiKey =>
      'Add DEEPGRAM_API_KEY to the .env file in the project root.';

  @override
  String get errorMicrophonePermissionDenied => 'Microphone permission denied.';

  @override
  String errorConnectionFailed(String details) {
    return 'Connection failed: $details';
  }

  @override
  String get languageAppEn => 'English';

  @override
  String get languageAppFa => 'فارسی';

  @override
  String get languageAppAr => 'العربية';

  @override
  String get languageMulti => 'Multilingual (auto-detect)';

  @override
  String get languageEnUs => 'English (US)';

  @override
  String get languageEnGb => 'English (UK)';

  @override
  String get languageEnAu => 'English (Australia)';

  @override
  String get languageEnIn => 'English (India)';

  @override
  String get languageEs => 'Spanish';

  @override
  String get languageEs419 => 'Spanish (Latin America)';

  @override
  String get languageFr => 'French';

  @override
  String get languageFrCa => 'French (Canada)';

  @override
  String get languageDe => 'German';

  @override
  String get languageDeCh => 'German (Switzerland)';

  @override
  String get languageIt => 'Italian';

  @override
  String get languagePt => 'Portuguese';

  @override
  String get languagePtBr => 'Portuguese (Brazil)';

  @override
  String get languagePtPt => 'Portuguese (Portugal)';

  @override
  String get languageNl => 'Dutch';

  @override
  String get languageNlBe => 'Flemish';

  @override
  String get languageFa => 'Persian';

  @override
  String get languageAr => 'Arabic';

  @override
  String get languageHi => 'Hindi';

  @override
  String get languageRu => 'Russian';

  @override
  String get languageUk => 'Ukrainian';

  @override
  String get languageTr => 'Turkish';

  @override
  String get languageZh => 'Chinese (Mandarin)';

  @override
  String get languageZhCn => 'Chinese (Simplified)';

  @override
  String get languageZhTw => 'Chinese (Traditional)';

  @override
  String get languageZhHk => 'Chinese (Cantonese)';

  @override
  String get languageJa => 'Japanese';

  @override
  String get languageKo => 'Korean';

  @override
  String get languageVi => 'Vietnamese';

  @override
  String get languageTh => 'Thai';

  @override
  String get languageId => 'Indonesian';

  @override
  String get languageMs => 'Malay';

  @override
  String get languageTl => 'Tagalog';

  @override
  String get languagePl => 'Polish';

  @override
  String get languageCs => 'Czech';

  @override
  String get languageSk => 'Slovak';

  @override
  String get languageHu => 'Hungarian';

  @override
  String get languageRo => 'Romanian';

  @override
  String get languageBg => 'Bulgarian';

  @override
  String get languageHr => 'Croatian';

  @override
  String get languageSr => 'Serbian';

  @override
  String get languageBs => 'Bosnian';

  @override
  String get languageSl => 'Slovenian';

  @override
  String get languageMk => 'Macedonian';

  @override
  String get languageBe => 'Belarusian';

  @override
  String get languageEl => 'Greek';

  @override
  String get languageHe => 'Hebrew';

  @override
  String get languageSv => 'Swedish';

  @override
  String get languageDa => 'Danish';

  @override
  String get languageFi => 'Finnish';

  @override
  String get languageNo => 'Norwegian';

  @override
  String get languageEt => 'Estonian';

  @override
  String get languageLv => 'Latvian';

  @override
  String get languageLt => 'Lithuanian';

  @override
  String get languageCa => 'Catalan';

  @override
  String get languageBn => 'Bengali';

  @override
  String get languageGu => 'Gujarati';

  @override
  String get languageKn => 'Kannada';

  @override
  String get languageMr => 'Marathi';

  @override
  String get languageTa => 'Tamil';

  @override
  String get languageTe => 'Telugu';

  @override
  String get languageUr => 'Urdu';
}
