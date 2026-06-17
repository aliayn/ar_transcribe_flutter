import 'package:ar_transcribe/core/l10n/language_labels.dart';
import 'package:ar_transcribe/gen_l10n/app_localizations.dart';

/// Human-readable target language labels for Gemini (matches ar-transcribe server).
abstract final class TranslationLanguage {
  static String labelForCode(AppLocalizations l10n, String languageCode) {
    return l10n.transcriptionLanguageName(
      switch (languageCode) {
        'en' || '' => 'en-US',
        _ => languageCode,
      },
    );
  }
}
