/// Maps app language codes to Deepgram BCP-47 `language` query values.
abstract final class LocaleMapper {
  static String toDeepgramLanguage(String languageCode) {
    if (languageCode.contains('-') || languageCode == 'multi') {
      return languageCode;
    }

    return switch (languageCode) {
      'en' || '' => 'en-US',
      'de' => 'de',
      'fr' => 'fr',
      'es' => 'es',
      'fa' => 'fa',
      'ar' => 'ar',
      'zh' => 'zh',
      'ja' => 'ja',
      'ru' => 'ru',
      'tr' => 'tr',
      'it' => 'it',
      'pt' => 'pt',
      _ => 'en-US',
    };
  }
}
