import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../features/transcribe/domain/entities/transcript_segment.dart';
import '../../features/transcribe/presentation/bloc/transcribe_state.dart';

/// Bottom AR caption panel (inspired by ar-games/ar-transcribe mobile.html).
class ArTranscriptOverlay extends StatelessWidget {
  const ArTranscriptOverlay({
    super.key,
    required this.segments,
    required this.livePreviewText,
    required this.displayMode,
    required this.isConnected,
    required this.onModeChanged,
    this.transcriptChipLabel = 'EN',
    this.translationChipLabel = 'TR',
    this.showTranslationToggle = true,
  });

  static const _maxSegments = 3;

  final List<TranscriptSegment> segments;
  final String livePreviewText;
  final ArDisplayMode displayMode;
  final bool isConnected;
  final ValueChanged<ArDisplayMode> onModeChanged;
  final String transcriptChipLabel;
  final String translationChipLabel;
  final bool showTranslationToggle;

  @override
  Widget build(BuildContext context) {
    final source = displayMode == ArDisplayMode.transcript
        ? SegmentSource.deepgram
        : SegmentSource.translation;

    final visible = segments
        .where((s) => s.source == source)
        .map((s) => s.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    final capped = visible.length > _maxSegments
        ? visible.sublist(visible.length - _maxSegments)
        : visible;

    final showLive =
        livePreviewText.isNotEmpty && displayMode == ArDisplayMode.transcript;

    return Stack(
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
                  const Text(
                    'Point the camera at the screen and play audio…',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white38, fontSize: 14),
                  ),
              ],
            ),
          ),
        ),
        if (showTranslationToggle)
          Positioned(
            top: 8,
            left: 12,
            child: _ModeToggle(
              mode: displayMode,
              onChanged: onModeChanged,
              transcriptLabel: transcriptChipLabel,
              translationLabel: translationChipLabel,
            ),
          ),
        Positioned(
          top: 12,
          right: 16,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isConnected ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
            ),
          ),
        ),
      ],
    );
  }
}

class _ModeToggle extends StatelessWidget {
  const _ModeToggle({
    required this.mode,
    required this.onChanged,
    required this.transcriptLabel,
    required this.translationLabel,
  });

  final ArDisplayMode mode;
  final ValueChanged<ArDisplayMode> onChanged;
  final String transcriptLabel;
  final String translationLabel;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ModeChip(
            label: transcriptLabel,
            active: mode == ArDisplayMode.transcript,
            onTap: () => onChanged(ArDisplayMode.transcript),
          ),
          _ModeChip(
            label: translationLabel,
            active: mode == ArDisplayMode.translation,
            onTap: () => onChanged(ArDisplayMode.translation),
          ),
        ],
      ),
    );
  }
}

class _ModeChip extends StatelessWidget {
  const _ModeChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: active
              ? const Color(0x4D3B82F6)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: active ? const Color(0xFF3B82F6) : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Colors.white54,
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
