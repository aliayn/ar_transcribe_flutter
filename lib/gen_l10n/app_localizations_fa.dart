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
      'دوربین را به صفحه یوتیوب یا خبر بگیرید. زیرنویس انگلیسی زنده (Deepgram) و ترجمه (Gemini) روی تصویر نمایش داده می‌شود. کلیدهای API را در .env قرار دهید.';

  @override
  String get languageLabel => 'زبان ترجمه';

  @override
  String get transcriptChipLabel => 'EN';

  @override
  String get startTranscribing => 'شروع رونویسی';

  @override
  String get routeNotFound => 'مسیر پیدا نشد';
}
