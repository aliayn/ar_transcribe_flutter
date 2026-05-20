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
      'طبیعی صحبت کنید. صدا به قطعه‌های کوتاه تقسیم می‌شود و با Vosk به‌صورت آفلاین رونویسی می‌شود؛ پیش‌نمایش زنده از STT دستگاه استفاده می‌کند.';

  @override
  String get languageLabel => 'زبان';

  @override
  String get chunkDurationLabel => 'مدت قطعه';

  @override
  String get startTranscribing => 'شروع رونویسی';

  @override
  String get routeNotFound => 'مسیر پیدا نشد';
}
