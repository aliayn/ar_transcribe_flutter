import 'package:ar_transcribe/core/utils/locale_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps known language codes to speech locales', () {
    expect(LocaleMapper.toSpeechLocale('de'), 'de_DE');
    expect(LocaleMapper.toSpeechLocale('ar'), 'ar_SA');
    expect(LocaleMapper.toSpeechLocale('en'), 'en_US');
    expect(LocaleMapper.toSpeechLocale(''), 'en_US'); // legacy persisted value
    expect(LocaleMapper.toSpeechLocale('unknown'), 'en_US');
  });
}
