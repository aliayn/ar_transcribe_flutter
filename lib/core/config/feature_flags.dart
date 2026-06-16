/// Temporary feature toggles — flip when ready to ship.
abstract final class FeatureFlags {
  /// Gemini translation (disabled — Deepgram handles STT only).
  static const bool geminiTranslationEnabled = false;
}
