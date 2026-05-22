import 'package:get_it_injector/get_it_injector.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../core/config/env_config.dart';

@lazySingleton
class GeminiTranslationDataSource {
  GenerativeModel? _model;

  GenerativeModel get _generativeModel {
    _model ??= GenerativeModel(
      model: EnvConfig.geminiModel,
      apiKey: EnvConfig.geminiApiKey,
    );
    return _model!;
  }

  Future<String> translate({
    required String text,
    required String targetLanguageLabel,
  }) async {
    if (EnvConfig.geminiApiKey.isEmpty) {
      throw StateError('GEMINI_API_KEY is not set in .env');
    }

    final trimmed = text.trim();
    if (trimmed.isEmpty) return '';

    final response = await _generativeModel.generateContent([
      Content.text(
        'Translate the following to $targetLanguageLabel. '
        'Return only the translation, no explanation:\n\n$trimmed',
      ),
    ]);

    return response.text?.trim() ?? '';
  }
}
