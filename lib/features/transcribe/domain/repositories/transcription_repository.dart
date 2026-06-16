/// Cloud live transcription via Deepgram.
abstract interface class TranscriptionRepository {
  Future<bool> hasMicrophonePermission();

  bool get hasValidApiKeys;

  Future<void> startLiveTranscription({
    required void Function(String transcript, bool isFinal) onTranscript,
    required String language,
  });

  Future<void> stopLiveTranscription();

  Future<void> dispose();
}
