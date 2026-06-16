/// App name "AR Transcribe" refers to augmented-reality-style overlay UI.
abstract final class AppConstants {
  static const defaultTranscriptionLanguage = 'en-US';

  static const supportedAppLocaleCodes = {'en', 'fa', 'ar'};

  static const List<Map<String, String>> supportedAppLocales = [
    {'code': 'en', 'label': 'English'},
    {'code': 'fa', 'label': 'فارسی'},
    {'code': 'ar', 'label': 'العربية'},
  ];

  /// Nova-3 monolingual + multilingual codes (Deepgram BCP-47).
  static const List<Map<String, String>> deepgramLanguages = [
    {'code': 'multi', 'label': 'Multilingual (auto-detect)'},
    {'code': 'en-US', 'label': 'English (US)'},
    {'code': 'en-GB', 'label': 'English (UK)'},
    {'code': 'en-AU', 'label': 'English (Australia)'},
    {'code': 'en-IN', 'label': 'English (India)'},
    {'code': 'es', 'label': 'Spanish'},
    {'code': 'es-419', 'label': 'Spanish (Latin America)'},
    {'code': 'fr', 'label': 'French'},
    {'code': 'fr-CA', 'label': 'French (Canada)'},
    {'code': 'de', 'label': 'German'},
    {'code': 'de-CH', 'label': 'German (Switzerland)'},
    {'code': 'it', 'label': 'Italian'},
    {'code': 'pt', 'label': 'Portuguese'},
    {'code': 'pt-BR', 'label': 'Portuguese (Brazil)'},
    {'code': 'pt-PT', 'label': 'Portuguese (Portugal)'},
    {'code': 'nl', 'label': 'Dutch'},
    {'code': 'nl-BE', 'label': 'Flemish'},
    {'code': 'fa', 'label': 'Persian'},
    {'code': 'ar', 'label': 'Arabic'},
    {'code': 'hi', 'label': 'Hindi'},
    {'code': 'ru', 'label': 'Russian'},
    {'code': 'uk', 'label': 'Ukrainian'},
    {'code': 'tr', 'label': 'Turkish'},
    {'code': 'zh', 'label': 'Chinese (Mandarin)'},
    {'code': 'zh-CN', 'label': 'Chinese (Simplified)'},
    {'code': 'zh-TW', 'label': 'Chinese (Traditional)'},
    {'code': 'zh-HK', 'label': 'Chinese (Cantonese)'},
    {'code': 'ja', 'label': 'Japanese'},
    {'code': 'ko', 'label': 'Korean'},
    {'code': 'vi', 'label': 'Vietnamese'},
    {'code': 'th', 'label': 'Thai'},
    {'code': 'id', 'label': 'Indonesian'},
    {'code': 'ms', 'label': 'Malay'},
    {'code': 'tl', 'label': 'Tagalog'},
    {'code': 'pl', 'label': 'Polish'},
    {'code': 'cs', 'label': 'Czech'},
    {'code': 'sk', 'label': 'Slovak'},
    {'code': 'hu', 'label': 'Hungarian'},
    {'code': 'ro', 'label': 'Romanian'},
    {'code': 'bg', 'label': 'Bulgarian'},
    {'code': 'hr', 'label': 'Croatian'},
    {'code': 'sr', 'label': 'Serbian'},
    {'code': 'bs', 'label': 'Bosnian'},
    {'code': 'sl', 'label': 'Slovenian'},
    {'code': 'mk', 'label': 'Macedonian'},
    {'code': 'be', 'label': 'Belarusian'},
    {'code': 'el', 'label': 'Greek'},
    {'code': 'he', 'label': 'Hebrew'},
    {'code': 'sv', 'label': 'Swedish'},
    {'code': 'da', 'label': 'Danish'},
    {'code': 'fi', 'label': 'Finnish'},
    {'code': 'no', 'label': 'Norwegian'},
    {'code': 'et', 'label': 'Estonian'},
    {'code': 'lv', 'label': 'Latvian'},
    {'code': 'lt', 'label': 'Lithuanian'},
    {'code': 'ca', 'label': 'Catalan'},
    {'code': 'bn', 'label': 'Bengali'},
    {'code': 'gu', 'label': 'Gujarati'},
    {'code': 'kn', 'label': 'Kannada'},
    {'code': 'mr', 'label': 'Marathi'},
    {'code': 'ta', 'label': 'Tamil'},
    {'code': 'te', 'label': 'Telugu'},
    {'code': 'ur', 'label': 'Urdu'},
  ];

  static Set<String> get deepgramLanguageCodes =>
      deepgramLanguages.map((lang) => lang['code']!).toSet();
}
