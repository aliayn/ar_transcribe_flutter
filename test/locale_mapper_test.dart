import 'package:ar_transcribe/core/utils/locale_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps known language codes to Deepgram BCP-47', () {
    expect(LocaleMapper.toDeepgramLanguage('de'), 'de');
    expect(LocaleMapper.toDeepgramLanguage('ar'), 'ar');
    expect(LocaleMapper.toDeepgramLanguage('en'), 'en-US');
    expect(LocaleMapper.toDeepgramLanguage(''), 'en-US');
    expect(LocaleMapper.toDeepgramLanguage('unknown'), 'en-US');
  });

  test('passes through Deepgram codes unchanged', () {
    expect(LocaleMapper.toDeepgramLanguage('en-US'), 'en-US');
    expect(LocaleMapper.toDeepgramLanguage('pt-BR'), 'pt-BR');
    expect(LocaleMapper.toDeepgramLanguage('multi'), 'multi');
  });
}
