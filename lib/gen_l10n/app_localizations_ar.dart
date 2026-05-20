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
      'تحدث بشكل طبيعي. يتم التقاط الصوت على شكل مقاطع ثم يُنسخ دون اتصال باستخدام Vosk؛ بينما تستخدم المعاينة المباشرة STT على الجهاز.';

  @override
  String get languageLabel => 'اللغة';

  @override
  String get chunkDurationLabel => 'مدة المقطع';

  @override
  String get startTranscribing => 'ابدأ النسخ';

  @override
  String get routeNotFound => 'المسار غير موجود';
}
