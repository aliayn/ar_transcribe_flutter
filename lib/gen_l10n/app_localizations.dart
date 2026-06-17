import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fa')
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'AR Transcribe'**
  String get appTitle;

  /// Card title describing the main feature
  ///
  /// In en, this message translates to:
  /// **'Real-time transcription'**
  String get realtimeTitle;

  /// Short description of how transcription works
  ///
  /// In en, this message translates to:
  /// **'Point your camera at a YouTube or news screen. Live captions in your chosen language appear as an AR overlay via Deepgram Nova-3. Add DEEPGRAM_API_KEY in .env.'**
  String get realtimeDescription;

  /// UI locale for menus and labels
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLocaleLabel;

  /// Spoken language for Deepgram STT
  ///
  /// In en, this message translates to:
  /// **'Transcription language'**
  String get languageLabel;

  /// Primary CTA button label
  ///
  /// In en, this message translates to:
  /// **'Start Transcribing'**
  String get startTranscribing;

  /// Fallback text when navigation fails and no error is available
  ///
  /// In en, this message translates to:
  /// **'Route not found'**
  String get routeNotFound;

  /// Placeholder when no transcript is shown on the AR overlay
  ///
  /// In en, this message translates to:
  /// **'Point the camera at the screen and play audio…'**
  String get overlayEmptyHint;

  /// Label shown when transcription is actively running
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get statusLive;

  /// Label shown when transcription is not running
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get statusStopped;

  /// Snackbar when camera permission was permanently denied
  ///
  /// In en, this message translates to:
  /// **'Camera permission denied. Enable it in Settings.'**
  String get cameraPermissionDeniedPermanent;

  /// Snackbar when camera permission is missing
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required for the AR preview.'**
  String get cameraPermissionRequired;

  /// Snackbar when the device has no camera
  ///
  /// In en, this message translates to:
  /// **'No camera found on this device.'**
  String get cameraNotFound;

  /// Snackbar when camera initialization fails
  ///
  /// In en, this message translates to:
  /// **'Could not open camera.'**
  String get cameraOpenFailed;

  /// Snackbar after copying transcript text
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// Short snackbar after copying from history
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get copiedShort;

  /// History screen title
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTitle;

  /// Empty state on the history screen
  ///
  /// In en, this message translates to:
  /// **'No sessions yet.'**
  String get historyEmpty;

  /// Error message when session history fails to load
  ///
  /// In en, this message translates to:
  /// **'Could not load history.'**
  String get historyLoadFailed;

  /// Placeholder for a session with no transcript text
  ///
  /// In en, this message translates to:
  /// **'(empty session)'**
  String get emptySession;

  /// Copy button label
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copyAction;

  /// Share button label
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareAction;

  /// Error when Deepgram API key is not configured
  ///
  /// In en, this message translates to:
  /// **'Add DEEPGRAM_API_KEY to the .env file in the project root.'**
  String get errorMissingDeepgramApiKey;

  /// Error when microphone permission is not granted
  ///
  /// In en, this message translates to:
  /// **'Microphone permission denied.'**
  String get errorMicrophonePermissionDenied;

  /// Error when live transcription connection fails
  ///
  /// In en, this message translates to:
  /// **'Connection failed: {details}'**
  String errorConnectionFailed(String details);

  /// No description provided for @languageAppEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageAppEn;

  /// No description provided for @languageAppFa.
  ///
  /// In en, this message translates to:
  /// **'فارسی'**
  String get languageAppFa;

  /// No description provided for @languageAppAr.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get languageAppAr;

  /// No description provided for @languageMulti.
  ///
  /// In en, this message translates to:
  /// **'Multilingual (auto-detect)'**
  String get languageMulti;

  /// No description provided for @languageEnUs.
  ///
  /// In en, this message translates to:
  /// **'English (US)'**
  String get languageEnUs;

  /// No description provided for @languageEnGb.
  ///
  /// In en, this message translates to:
  /// **'English (UK)'**
  String get languageEnGb;

  /// No description provided for @languageEnAu.
  ///
  /// In en, this message translates to:
  /// **'English (Australia)'**
  String get languageEnAu;

  /// No description provided for @languageEnIn.
  ///
  /// In en, this message translates to:
  /// **'English (India)'**
  String get languageEnIn;

  /// No description provided for @languageEs.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageEs;

  /// No description provided for @languageEs419.
  ///
  /// In en, this message translates to:
  /// **'Spanish (Latin America)'**
  String get languageEs419;

  /// No description provided for @languageFr.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFr;

  /// No description provided for @languageFrCa.
  ///
  /// In en, this message translates to:
  /// **'French (Canada)'**
  String get languageFrCa;

  /// No description provided for @languageDe.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get languageDe;

  /// No description provided for @languageDeCh.
  ///
  /// In en, this message translates to:
  /// **'German (Switzerland)'**
  String get languageDeCh;

  /// No description provided for @languageIt.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get languageIt;

  /// No description provided for @languagePt.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get languagePt;

  /// No description provided for @languagePtBr.
  ///
  /// In en, this message translates to:
  /// **'Portuguese (Brazil)'**
  String get languagePtBr;

  /// No description provided for @languagePtPt.
  ///
  /// In en, this message translates to:
  /// **'Portuguese (Portugal)'**
  String get languagePtPt;

  /// No description provided for @languageNl.
  ///
  /// In en, this message translates to:
  /// **'Dutch'**
  String get languageNl;

  /// No description provided for @languageNlBe.
  ///
  /// In en, this message translates to:
  /// **'Flemish'**
  String get languageNlBe;

  /// No description provided for @languageFa.
  ///
  /// In en, this message translates to:
  /// **'Persian'**
  String get languageFa;

  /// No description provided for @languageAr.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get languageAr;

  /// No description provided for @languageHi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get languageHi;

  /// No description provided for @languageRu.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageRu;

  /// No description provided for @languageUk.
  ///
  /// In en, this message translates to:
  /// **'Ukrainian'**
  String get languageUk;

  /// No description provided for @languageTr.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get languageTr;

  /// No description provided for @languageZh.
  ///
  /// In en, this message translates to:
  /// **'Chinese (Mandarin)'**
  String get languageZh;

  /// No description provided for @languageZhCn.
  ///
  /// In en, this message translates to:
  /// **'Chinese (Simplified)'**
  String get languageZhCn;

  /// No description provided for @languageZhTw.
  ///
  /// In en, this message translates to:
  /// **'Chinese (Traditional)'**
  String get languageZhTw;

  /// No description provided for @languageZhHk.
  ///
  /// In en, this message translates to:
  /// **'Chinese (Cantonese)'**
  String get languageZhHk;

  /// No description provided for @languageJa.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get languageJa;

  /// No description provided for @languageKo.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get languageKo;

  /// No description provided for @languageVi.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get languageVi;

  /// No description provided for @languageTh.
  ///
  /// In en, this message translates to:
  /// **'Thai'**
  String get languageTh;

  /// No description provided for @languageId.
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get languageId;

  /// No description provided for @languageMs.
  ///
  /// In en, this message translates to:
  /// **'Malay'**
  String get languageMs;

  /// No description provided for @languageTl.
  ///
  /// In en, this message translates to:
  /// **'Tagalog'**
  String get languageTl;

  /// No description provided for @languagePl.
  ///
  /// In en, this message translates to:
  /// **'Polish'**
  String get languagePl;

  /// No description provided for @languageCs.
  ///
  /// In en, this message translates to:
  /// **'Czech'**
  String get languageCs;

  /// No description provided for @languageSk.
  ///
  /// In en, this message translates to:
  /// **'Slovak'**
  String get languageSk;

  /// No description provided for @languageHu.
  ///
  /// In en, this message translates to:
  /// **'Hungarian'**
  String get languageHu;

  /// No description provided for @languageRo.
  ///
  /// In en, this message translates to:
  /// **'Romanian'**
  String get languageRo;

  /// No description provided for @languageBg.
  ///
  /// In en, this message translates to:
  /// **'Bulgarian'**
  String get languageBg;

  /// No description provided for @languageHr.
  ///
  /// In en, this message translates to:
  /// **'Croatian'**
  String get languageHr;

  /// No description provided for @languageSr.
  ///
  /// In en, this message translates to:
  /// **'Serbian'**
  String get languageSr;

  /// No description provided for @languageBs.
  ///
  /// In en, this message translates to:
  /// **'Bosnian'**
  String get languageBs;

  /// No description provided for @languageSl.
  ///
  /// In en, this message translates to:
  /// **'Slovenian'**
  String get languageSl;

  /// No description provided for @languageMk.
  ///
  /// In en, this message translates to:
  /// **'Macedonian'**
  String get languageMk;

  /// No description provided for @languageBe.
  ///
  /// In en, this message translates to:
  /// **'Belarusian'**
  String get languageBe;

  /// No description provided for @languageEl.
  ///
  /// In en, this message translates to:
  /// **'Greek'**
  String get languageEl;

  /// No description provided for @languageHe.
  ///
  /// In en, this message translates to:
  /// **'Hebrew'**
  String get languageHe;

  /// No description provided for @languageSv.
  ///
  /// In en, this message translates to:
  /// **'Swedish'**
  String get languageSv;

  /// No description provided for @languageDa.
  ///
  /// In en, this message translates to:
  /// **'Danish'**
  String get languageDa;

  /// No description provided for @languageFi.
  ///
  /// In en, this message translates to:
  /// **'Finnish'**
  String get languageFi;

  /// No description provided for @languageNo.
  ///
  /// In en, this message translates to:
  /// **'Norwegian'**
  String get languageNo;

  /// No description provided for @languageEt.
  ///
  /// In en, this message translates to:
  /// **'Estonian'**
  String get languageEt;

  /// No description provided for @languageLv.
  ///
  /// In en, this message translates to:
  /// **'Latvian'**
  String get languageLv;

  /// No description provided for @languageLt.
  ///
  /// In en, this message translates to:
  /// **'Lithuanian'**
  String get languageLt;

  /// No description provided for @languageCa.
  ///
  /// In en, this message translates to:
  /// **'Catalan'**
  String get languageCa;

  /// No description provided for @languageBn.
  ///
  /// In en, this message translates to:
  /// **'Bengali'**
  String get languageBn;

  /// No description provided for @languageGu.
  ///
  /// In en, this message translates to:
  /// **'Gujarati'**
  String get languageGu;

  /// No description provided for @languageKn.
  ///
  /// In en, this message translates to:
  /// **'Kannada'**
  String get languageKn;

  /// No description provided for @languageMr.
  ///
  /// In en, this message translates to:
  /// **'Marathi'**
  String get languageMr;

  /// No description provided for @languageTa.
  ///
  /// In en, this message translates to:
  /// **'Tamil'**
  String get languageTa;

  /// No description provided for @languageTe.
  ///
  /// In en, this message translates to:
  /// **'Telugu'**
  String get languageTe;

  /// No description provided for @languageUr.
  ///
  /// In en, this message translates to:
  /// **'Urdu'**
  String get languageUr;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
