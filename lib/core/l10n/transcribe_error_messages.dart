import 'package:ar_transcribe/gen_l10n/app_localizations.dart';

import '../../features/transcribe/presentation/bloc/transcribe_state.dart';

String? localizedTranscribeError(
  AppLocalizations l10n,
  TranscribeState state,
) {
  return switch (state.errorType) {
    TranscribeErrorType.missingDeepgramApiKey => l10n.errorMissingDeepgramApiKey,
    TranscribeErrorType.microphonePermissionDenied =>
      l10n.errorMicrophonePermissionDenied,
    TranscribeErrorType.connectionFailed =>
      l10n.errorConnectionFailed(state.errorDetail ?? ''),
    null => null,
  };
}
