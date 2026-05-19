import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/language_selector.dart';
import '../../../../ui/core/adaptive_content.dart';
import '../../../settings/presentation/cubit/settings_cubit.dart';
import '../../../settings/presentation/cubit/settings_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final settings = state.settings;

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'AR Transcribe',
              style: TextStyle(color: Colors.cyanAccent, letterSpacing: 2),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.history, color: Colors.white70),
                onPressed: () => context.push('/history'),
              ),
            ],
          ),
          body: AdaptiveContent(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyanAccent.withValues(alpha: 0.3)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Real-time transcription',
                          style: TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Speak naturally. Audio is captured in chunks and transcribed offline with Vosk; live preview uses on-device STT.',
                          style: TextStyle(color: Colors.white60, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('Language', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  LanguageSelector(
                    selected: settings.language,
                    onChanged: (code) {
                      context.read<SettingsCubit>().update(settings.copyWith(language: code));
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text('Chunk duration', style: TextStyle(color: Colors.white70)),
                      const Spacer(),
                      DropdownButton<int>(
                        value: settings.chunkSeconds,
                        dropdownColor: const Color(0xFF1A1A2E),
                        style: const TextStyle(color: Colors.cyanAccent),
                        items: [5, 8, 10, 15]
                            .map(
                              (seconds) => DropdownMenuItem(
                                value: seconds,
                                child: Text('${seconds}s'),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<SettingsCubit>().update(
                                  settings.copyWith(chunkSeconds: value),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.mic, size: 28),
                    label: const Text(
                      'Start Transcribing',
                      style: TextStyle(fontSize: 18, letterSpacing: 1.5),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () => context.push('/transcribe'),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
