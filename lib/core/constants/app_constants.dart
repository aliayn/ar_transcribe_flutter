/// App name "AR Transcribe" refers to augmented-reality-style overlay UI, not Arabic.
abstract final class AppConstants {
  static const defaultLanguageCode = 'en';

  /// Offline final transcription uses this English Vosk model.
  static const voskModelAsset = 'assets/models/vosk-model-small-en-us-0.15.zip';
  static const voskSampleRateHz = 16000;

  static const List<Map<String, String>> supportedLanguages = [
    {'code': 'en', 'label': 'English (US)'},
    {'code': 'de', 'label': 'German'},
    {'code': 'fr', 'label': 'French'},
    {'code': 'es', 'label': 'Spanish'},
    {'code': 'fa', 'label': 'Persian'},
    {'code': 'ar', 'label': 'Arabic'},
    {'code': 'zh', 'label': 'Chinese'},
    {'code': 'ja', 'label': 'Japanese'},
    {'code': 'ru', 'label': 'Russian'},
    {'code': 'tr', 'label': 'Turkish'},
    {'code': 'it', 'label': 'Italian'},
    {'code': 'pt', 'label': 'Portuguese'},
  ];
}
