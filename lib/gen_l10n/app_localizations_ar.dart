// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'AR Transcribe';

  @override
  String get realtimeTitle => 'نسخ فوري';

  @override
  String get realtimeDescription =>
      'وجّه الكاميرا نحو شاشة يوتيوب أو الأخبار. تظهر ترجمة حية (Deepgram) وترجمة (Gemini) كطبقة AR. أضف مفاتيح API في .env.';

  @override
  String get languageLabel => 'لغة الترجمة';

  @override
  String get transcriptChipLabel => 'EN';

  @override
  String get startTranscribing => 'ابدأ النسخ';

  @override
  String get routeNotFound => 'المسار غير موجود';
}
