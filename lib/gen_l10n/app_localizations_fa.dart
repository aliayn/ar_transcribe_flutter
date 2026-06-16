// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'آر ترنسکرایب';

  @override
  String get realtimeTitle => 'رونویسی لحظه‌ای';

  @override
  String get realtimeDescription =>
      'دوربین را به صفحه یوتیوب یا خبر بگیرید. زیرنویس زنده به زبان انتخابی شما با Deepgram Nova-3 روی تصویر نمایش داده می‌شود. DEEPGRAM_API_KEY را در .env قرار دهید.';

  @override
  String get appLocaleLabel => 'زبان برنامه';

  @override
  String get languageLabel => 'زبان رونویسی';

  @override
  String get startTranscribing => 'شروع رونویسی';

  @override
  String get routeNotFound => 'مسیر پیدا نشد';
}
