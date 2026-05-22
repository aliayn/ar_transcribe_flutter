/// Human-readable target language labels for Gemini (matches ar-transcribe server).
abstract final class TranslationLanguage {
  static String labelForCode(String languageCode) {
    return switch (languageCode) {
      'fa' => 'Persian (Farsi)',
      'ar' => 'Arabic',
      'de' => 'German',
      'fr' => 'French',
      'es' => 'Spanish',
      'zh' => 'Chinese',
      'ja' => 'Japanese',
      'ru' => 'Russian',
      'tr' => 'Turkish',
      'it' => 'Italian',
      'pt' => 'Portuguese',
      'en' || '' => 'English',
      _ => 'English',
    };
  }
}
