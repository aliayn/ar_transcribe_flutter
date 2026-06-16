import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Loads `.env` without blocking the first app frame.
abstract final class AppInitializer {
  static Future<void>? _initialization;

  static bool get isReady => dotenv.isInitialized;

  static Future<void> ensureInitialized() {
    return _initialization ??= dotenv.load(fileName: '.env');
  }
}
