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

  @override
  String get overlayEmptyHint => 'دوربین را به صفحه بگیرید و صدا را پخش کنید…';

  @override
  String get statusLive => 'زنده';

  @override
  String get statusStopped => 'متوقف';

  @override
  String get cameraPermissionDeniedPermanent =>
      'دسترسی دوربین رد شد. آن را در تنظیمات فعال کنید.';

  @override
  String get cameraPermissionRequired =>
      'برای پیش‌نمایش AR به دسترسی دوربین نیاز است.';

  @override
  String get cameraNotFound => 'دوربینی در این دستگاه یافت نشد.';

  @override
  String get cameraOpenFailed => 'باز کردن دوربین ممکن نشد.';

  @override
  String get copiedToClipboard => 'در کلیپ‌بورد کپی شد';

  @override
  String get copiedShort => 'کپی شد!';

  @override
  String get historyTitle => 'تاریخچه';

  @override
  String get historyEmpty => 'هنوز جلسه‌ای ثبت نشده.';

  @override
  String get historyLoadFailed => 'بارگذاری تاریخچه ممکن نشد.';

  @override
  String get emptySession => '(جلسه خالی)';

  @override
  String get copyAction => 'کپی';

  @override
  String get shareAction => 'اشتراک';

  @override
  String get errorMissingDeepgramApiKey =>
      'DEEPGRAM_API_KEY را در فایل .env در ریشه پروژه قرار دهید.';

  @override
  String get errorMicrophonePermissionDenied => 'دسترسی میکروفون رد شد.';

  @override
  String errorConnectionFailed(String details) {
    return 'اتصال برقرار نشد: $details';
  }

  @override
  String get languageAppEn => 'انگلیسی';

  @override
  String get languageAppFa => 'فارسی';

  @override
  String get languageAppAr => 'عربی';

  @override
  String get languageMulti => 'چندزبانه (تشخیص خودکار)';

  @override
  String get languageEnUs => 'انگلیسی (آمریکا)';

  @override
  String get languageEnGb => 'انگلیسی (بریتانیا)';

  @override
  String get languageEnAu => 'انگلیسی (استرالیا)';

  @override
  String get languageEnIn => 'انگلیسی (هند)';

  @override
  String get languageEs => 'اسپانیایی';

  @override
  String get languageEs419 => 'اسپانیایی (آمریکای لاتین)';

  @override
  String get languageFr => 'فرانسوی';

  @override
  String get languageFrCa => 'فرانسوی (کانادا)';

  @override
  String get languageDe => 'آلمانی';

  @override
  String get languageDeCh => 'آلمانی (سوئیس)';

  @override
  String get languageIt => 'ایتالیایی';

  @override
  String get languagePt => 'پرتغالی';

  @override
  String get languagePtBr => 'پرتغالی (برزیل)';

  @override
  String get languagePtPt => 'پرتغالی (پرتغال)';

  @override
  String get languageNl => 'هلندی';

  @override
  String get languageNlBe => 'فلاندری';

  @override
  String get languageFa => 'فارسی';

  @override
  String get languageAr => 'عربی';

  @override
  String get languageHi => 'هندی';

  @override
  String get languageRu => 'روسی';

  @override
  String get languageUk => 'اوکراینی';

  @override
  String get languageTr => 'ترکی';

  @override
  String get languageZh => 'چینی (ماندارین)';

  @override
  String get languageZhCn => 'چینی (ساده‌شده)';

  @override
  String get languageZhTw => 'چینی (سنتی)';

  @override
  String get languageZhHk => 'چینی (کانتونی)';

  @override
  String get languageJa => 'ژاپنی';

  @override
  String get languageKo => 'کره‌ای';

  @override
  String get languageVi => 'ویتنامی';

  @override
  String get languageTh => 'تایلندی';

  @override
  String get languageId => 'اندونزیایی';

  @override
  String get languageMs => 'مالایی';

  @override
  String get languageTl => 'تاگالوگ';

  @override
  String get languagePl => 'لهستانی';

  @override
  String get languageCs => 'چکی';

  @override
  String get languageSk => 'اسلواکی';

  @override
  String get languageHu => 'مجاری';

  @override
  String get languageRo => 'رومانیایی';

  @override
  String get languageBg => 'بلغاری';

  @override
  String get languageHr => 'کرواتی';

  @override
  String get languageSr => 'صربی';

  @override
  String get languageBs => 'بوسنیایی';

  @override
  String get languageSl => 'اسلوونیایی';

  @override
  String get languageMk => 'مقدونی';

  @override
  String get languageBe => 'بلاروسی';

  @override
  String get languageEl => 'یونانی';

  @override
  String get languageHe => 'عبری';

  @override
  String get languageSv => 'سوئدی';

  @override
  String get languageDa => 'دانمارکی';

  @override
  String get languageFi => 'فنلاندی';

  @override
  String get languageNo => 'نروژی';

  @override
  String get languageEt => 'استونیایی';

  @override
  String get languageLv => 'لتونیایی';

  @override
  String get languageLt => 'لیتوانیایی';

  @override
  String get languageCa => 'کاتالان';

  @override
  String get languageBn => 'بنگالی';

  @override
  String get languageGu => 'گجراتی';

  @override
  String get languageKn => 'کانارا';

  @override
  String get languageMr => 'مراتی';

  @override
  String get languageTa => 'تامیل';

  @override
  String get languageTe => 'تلوگو';

  @override
  String get languageUr => 'اردو';
}
