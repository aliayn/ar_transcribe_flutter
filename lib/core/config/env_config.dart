import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'feature_flags.dart';

/// Loads API keys and model settings from `.env` (see `.env.example`).
abstract final class EnvConfig {
  static String get deepgramApiKey =>
      dotenv.env['DEEPGRAM_API_KEY']?.trim() ?? '';

  static String get geminiApiKey => dotenv.env['GEMINI_API_KEY']?.trim() ?? '';

  static String get geminiModel =>
      dotenv.env['GEMINI_MODEL']?.trim().isNotEmpty == true
          ? dotenv.env['GEMINI_MODEL']!.trim()
          : 'gemini-2.0-flash';

  static String get deepgramModel =>
      dotenv.env['DEEPGRAM_MODEL']?.trim().isNotEmpty == true
          ? dotenv.env['DEEPGRAM_MODEL']!.trim()
          : 'nova-3';

  static String get deepgramLanguage =>
      dotenv.env['DEEPGRAM_LANGUAGE']?.trim().isNotEmpty == true
          ? dotenv.env['DEEPGRAM_LANGUAGE']!.trim()
          : 'en-US';

  static bool get hasDeepgramKey => deepgramApiKey.isNotEmpty;

  static bool get hasGeminiKey => geminiApiKey.isNotEmpty;

  static bool get isConfigured {
    if (!hasDeepgramKey) return false;
    if (FeatureFlags.geminiTranslationEnabled && !hasGeminiKey) {
      return false;
    }
    return true;
  }
}
