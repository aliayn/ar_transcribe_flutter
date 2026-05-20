import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_transcribe/gen_l10n/app_localizations.dart';

import '../../../../shared/widgets/language_selector.dart';
import '../../../../ui/core/adaptive_content.dart';
import '../../../settings/presentation/cubit/settings_cubit.dart';
import '../../../settings/presentation/cubit/settings_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final settings = state.settings;

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              l10n.appTitle,
              style: const TextStyle(color: Colors.cyanAccent, letterSpacing: 2),
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > largeScreenMinWidth;

                  final left = Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 32),
                      _InfoCard(
                        title: l10n.realtimeTitle,
                        description: l10n.realtimeDescription,
                      ),
                      const SizedBox(height: 32),
                      Text(l10n.languageLabel, style: const TextStyle(color: Colors.white70)),
                      const SizedBox(height: 8),
                      LanguageSelector(
                        selected: settings.language,
                        onChanged: (code) {
                          context.read<SettingsCubit>().update(settings.copyWith(language: code));
                        },
                      ),
                      const SizedBox(height: 16),
                      _ChunkDurationRow(
                        label: l10n.chunkDurationLabel,
                        value: settings.chunkSeconds,
                        onChanged: (value) {
                          context.read<SettingsCubit>().update(
                                settings.copyWith(chunkSeconds: value),
                              );
                        },
                      ),
                    ],
                  );

                  final right = Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (isWide) const SizedBox(height: 32),
                      const Spacer(),
                      _StartButton(
                        label: l10n.startTranscribing,
                        onPressed: () => context.push('/transcribe'),
                      ),
                      const SizedBox(height: 32),
                    ],
                  );

                  if (!isWide) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        left,
                        right,
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: left),
                      const SizedBox(width: 24),
                      SizedBox(width: 280, child: right),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyanAccent.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.cyanAccent,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.white60, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _ChunkDurationRow extends StatelessWidget {
  const _ChunkDurationRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        const Spacer(),
        DropdownButton<int>(
          value: value,
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
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ],
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.mic, size: 28),
      label: Text(
        label,
        style: const TextStyle(fontSize: 18, letterSpacing: 1.5),
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.cyanAccent,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
    );
  }
}
