import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ar_transcribe/gen_l10n/app_localizations.dart';

import '../../features/transcribe/domain/entities/transcript_segment.dart';

/// Bottom AR caption panel (inspired by ar-games/ar-transcribe mobile.html).
class ArTranscriptOverlay extends StatelessWidget {
  const ArTranscriptOverlay({
    super.key,
    required this.segments,
    required this.livePreviewText,
    required this.isConnected,
    this.languageChipLabel = 'EN',
  });

  static const _maxSegments = 3;

  final List<TranscriptSegment> segments;
  final String livePreviewText;
  final bool isConnected;
  final String languageChipLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final visible = segments
        .where((s) => s.source == SegmentSource.deepgram)
        .map((s) => s.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    final capped = visible.length > _maxSegments
        ? visible.sublist(visible.length - _maxSegments)
        : visible;

    final showLive = livePreviewText.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.only(top:12.0),
      child: SizedBox.expand(
        child: Stack(
          children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 48, 20, 36),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xD9000000)],
                  stops: [0.0, 0.55],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < capped.length; i++)
                    _ArSegmentLine(
                      text: capped[i],
                      age: capped.length - 1 - i,
                      isCurrent: !showLive && i == capped.length - 1,
                    ),
                  if (showLive)
                    _ArSegmentLine(
                      text: livePreviewText,
                      age: 0,
                      isCurrent: true,
                    ),
                  if (capped.isEmpty && !showLive)
                    Text(
                      l10n.overlayEmptyHint,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white38, fontSize: 14),
                    ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _LanguageChip(label: languageChipLabel),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isConnected ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isConnected ? l10n.statusLive : l10n.statusStopped,
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ArSegmentLine extends StatelessWidget {
  const _ArSegmentLine({
    required this.text,
    required this.age,
    required this.isCurrent,
  });

  final String text;
  final int age;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final style = switch (age) {
      0 when isCurrent => const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1.45,
          shadows: [
            Shadow(color: Color(0xE664C8FF), blurRadius: 12),
            Shadow(color: Color(0x8064C8FF), blurRadius: 28),
          ],
        ),
      1 => const TextStyle(
          fontSize: 16,
          color: Color(0x73FFFFFF),
          height: 1.45,
        ),
      _ => const TextStyle(
          fontSize: 15,
          color: Color(0x33FFFFFF),
          height: 1.45,
        ),
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(text, style: style)
          .animate()
          .fadeIn(duration: 220.ms)
          .slideY(begin: 0.08, curve: Curves.easeOut),
    );
  }
}
