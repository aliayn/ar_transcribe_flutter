/// Cloud live transcription (Deepgram) + translation (Gemini).
abstract interface class TranscriptionRepository {
  Future<bool> hasMicrophonePermission();

  bool get hasValidApiKeys;

  Future<void> startLiveTranscription({
    required void Function(String transcript, bool isFinal) onTranscript,
  });

  Future<String> translate({
    required String text,
    required String targetLanguageLabel,
  });

  Future<void> stopLiveTranscription();

  Future<void> dispose();
}
