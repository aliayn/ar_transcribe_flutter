abstract final class LocaleMapper {
  static String toSpeechLocale(String languageCode) {
    return switch (languageCode) {
      'en' || '' => 'en_US',
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
      _ => 'en_US', // fallback to English
    };
  }
}
