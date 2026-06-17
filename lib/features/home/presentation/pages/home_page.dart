import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_transcribe/gen_l10n/app_localizations.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/l10n/language_labels.dart';
import '../../../../shared/widgets/language_selector.dart';
import '../../../../ui/core/adaptive_content.dart';
import '../../../settings/domain/entities/app_settings.dart';
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
        final isWide =
            MediaQuery.sizeOf(context).width > largeScreenMinWidth;

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
              child: _HomeBody(
                isWide: isWide,
                l10n: l10n,
                settings: settings,
                onAppLocaleChanged: (code) {
                  context.read<SettingsCubit>().update(
                        settings.copyWith(appLocale: code),
                      );
                },
                onTranscriptionLanguageChanged: (code) {
                  context.read<SettingsCubit>().update(
                        settings.copyWith(language: code),
                      );
                },
                onStart: () => context.push('/transcribe'),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    required this.isWide,
    required this.l10n,
    required this.settings,
    required this.onAppLocaleChanged,
    required this.onTranscriptionLanguageChanged,
    required this.onStart,
  });

  final bool isWide;
  final AppLocalizations l10n;
  final AppSettings settings;
  final ValueChanged<String> onAppLocaleChanged;
  final ValueChanged<String> onTranscriptionLanguageChanged;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        _InfoCard(
          title: l10n.realtimeTitle,
          description: l10n.realtimeDescription,
        ),
        const SizedBox(height: 32),
        Text(l10n.appLocaleLabel, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 8),
        LanguageSelector(
          selected: settings.appLocale,
          languageCodes: AppConstants.supportedAppLocaleCodes,
          labelFor: l10n.appLocaleName,
          onChanged: onAppLocaleChanged,
        ),
        const SizedBox(height: 24),
        Text(l10n.languageLabel, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 8),
        LanguageSelector(
          selected: settings.language,
          languageCodes: AppConstants.transcriptionLanguageCodes,
          labelFor: l10n.transcriptionLanguageName,
          onChanged: onTranscriptionLanguageChanged,
        ),
      ],
    );

    final startButton = _StartButton(
      label: l10n.startTranscribing,
      onPressed: onStart,
    );

    if (!isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          left,
          const Spacer(),
          startButton,
          const SizedBox(height: 32),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: left),
        const SizedBox(width: 24),
        SizedBox(
          width: 280,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [startButton],
            ),
          ),
        ),
      ],
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
