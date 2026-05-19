import 'dart:convert';

import 'package:get_it_injector/get_it_injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/transcribe_session.dart';

@lazySingleton
class SessionLocalDataSource {
  static const _sessionsKey = 'transcribe_sessions';

  Future<List<TranscribeSession>> loadSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_sessionsKey) ?? [];
    return raw
        .map((value) => TranscribeSession.fromJson(jsonDecode(value) as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => b.startedAt.compareTo(a.startedAt));
  }

  Future<void> saveSession(TranscribeSession session) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getStringList(_sessionsKey) ?? [];
    final encoded = jsonEncode(session.toJson());

    final index = existing.indexWhere((value) {
      final decoded = jsonDecode(value) as Map<String, dynamic>;
      return decoded['id'] == session.id;
    });

    if (index >= 0) {
      existing[index] = encoded;
    } else {
      existing.add(encoded);
    }

    await prefs.setStringList(_sessionsKey, existing);
  }

  Future<void> deleteSession(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getStringList(_sessionsKey) ?? [];
    existing.removeWhere((value) {
      final decoded = jsonDecode(value) as Map<String, dynamic>;
      return decoded['id'] == id;
    });
    await prefs.setStringList(_sessionsKey, existing);
  }
}
