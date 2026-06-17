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
      'وجّه الكاميرا نحو شاشة يوتيوب أو الأخبار. تظهر ترجمة حية باللغة التي تختارها عبر Deepgram Nova-3 كطبقة AR. أضف DEEPGRAM_API_KEY في .env.';

  @override
  String get appLocaleLabel => 'لغة التطبيق';

  @override
  String get languageLabel => 'لغة النسخ';

  @override
  String get startTranscribing => 'ابدأ النسخ';

  @override
  String get routeNotFound => 'المسار غير موجود';

  @override
  String get overlayEmptyHint => 'وجّه الكاميرا نحو الشاشة وشغّل الصوت…';

  @override
  String get statusLive => 'مباشر';

  @override
  String get statusStopped => 'متوقف';

  @override
  String get cameraPermissionDeniedPermanent =>
      'تم رفض إذن الكاميرا. فعّله من الإعدادات.';

  @override
  String get cameraPermissionRequired => 'إذن الكاميرا مطلوب لمعاينة AR.';

  @override
  String get cameraNotFound => 'لم يتم العثور على كاميرا في هذا الجهاز.';

  @override
  String get cameraOpenFailed => 'تعذّر فتح الكاميرا.';

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get copiedShort => 'تم النسخ!';

  @override
  String get historyTitle => 'السجل';

  @override
  String get historyEmpty => 'لا توجد جلسات بعد.';

  @override
  String get historyLoadFailed => 'تعذّر تحميل السجل.';

  @override
  String get emptySession => '(جلسة فارغة)';

  @override
  String get copyAction => 'نسخ';

  @override
  String get shareAction => 'مشاركة';

  @override
  String get errorMissingDeepgramApiKey =>
      'أضف DEEPGRAM_API_KEY إلى ملف .env في جذر المشروع.';

  @override
  String get errorMicrophonePermissionDenied => 'تم رفض إذن الميكروفون.';

  @override
  String errorConnectionFailed(String details) {
    return 'فشل الاتصال: $details';
  }

  @override
  String get languageAppEn => 'الإنجليزية';

  @override
  String get languageAppFa => 'الفارسية';

  @override
  String get languageAppAr => 'العربية';

  @override
  String get languageMulti => 'متعدد اللغات (كشف تلقائي)';

  @override
  String get languageEnUs => 'الإنجليزية (أمريكا)';

  @override
  String get languageEnGb => 'الإنجليزية (بريطانيا)';

  @override
  String get languageEnAu => 'الإنجليزية (أستراليا)';

  @override
  String get languageEnIn => 'الإنجليزية (الهند)';

  @override
  String get languageEs => 'الإسبانية';

  @override
  String get languageEs419 => 'الإسبانية (أمريكا اللاتينية)';

  @override
  String get languageFr => 'الفرنسية';

  @override
  String get languageFrCa => 'الفرنسية (كندا)';

  @override
  String get languageDe => 'الألمانية';

  @override
  String get languageDeCh => 'الألمانية (سويسرا)';

  @override
  String get languageIt => 'الإيطالية';

  @override
  String get languagePt => 'البرتغالية';

  @override
  String get languagePtBr => 'البرتغالية (البرازيل)';

  @override
  String get languagePtPt => 'البرتغالية (البرتغال)';

  @override
  String get languageNl => 'الهولندية';

  @override
  String get languageNlBe => 'الفلمنكية';

  @override
  String get languageFa => 'الفارسية';

  @override
  String get languageAr => 'العربية';

  @override
  String get languageHi => 'الهندية';

  @override
  String get languageRu => 'الروسية';

  @override
  String get languageUk => 'الأوكرانية';

  @override
  String get languageTr => 'التركية';

  @override
  String get languageZh => 'الصينية (الماندرين)';

  @override
  String get languageZhCn => 'الصينية (المبسطة)';

  @override
  String get languageZhTw => 'الصينية (التقليدية)';

  @override
  String get languageZhHk => 'الصينية (الكانتونية)';

  @override
  String get languageJa => 'اليابانية';

  @override
  String get languageKo => 'الكورية';

  @override
  String get languageVi => 'الفيتنامية';

  @override
  String get languageTh => 'التايلاندية';

  @override
  String get languageId => 'الإندونيسية';

  @override
  String get languageMs => 'الملايو';

  @override
  String get languageTl => 'التاغالوغية';

  @override
  String get languagePl => 'البولندية';

  @override
  String get languageCs => 'التشيكية';

  @override
  String get languageSk => 'السلوفاكية';

  @override
  String get languageHu => 'المجرية';

  @override
  String get languageRo => 'الرومانية';

  @override
  String get languageBg => 'البلغارية';

  @override
  String get languageHr => 'الكرواتية';

  @override
  String get languageSr => 'الصربية';

  @override
  String get languageBs => 'البوسنية';

  @override
  String get languageSl => 'السلوفينية';

  @override
  String get languageMk => 'المقدونية';

  @override
  String get languageBe => 'البيلاروسية';

  @override
  String get languageEl => 'اليونانية';

  @override
  String get languageHe => 'العبرية';

  @override
  String get languageSv => 'السويدية';

  @override
  String get languageDa => 'الدنماركية';

  @override
  String get languageFi => 'الفنلندية';

  @override
  String get languageNo => 'النرويجية';

  @override
  String get languageEt => 'الإستونية';

  @override
  String get languageLv => 'اللاتفية';

  @override
  String get languageLt => 'الليتوانية';

  @override
  String get languageCa => 'الكتالونية';

  @override
  String get languageBn => 'البنغالية';

  @override
  String get languageGu => 'الغوجاراتية';

  @override
  String get languageKn => 'الكانادا';

  @override
  String get languageMr => 'الماراثية';

  @override
  String get languageTa => 'التاميلية';

  @override
  String get languageTe => 'التيلوغو';

  @override
  String get languageUr => 'الأردية';
}
