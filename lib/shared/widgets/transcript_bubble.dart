import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscriptBubble extends StatelessWidget {
  const TranscriptBubble({
    super.key,
    required this.text,
    required this.isPreview,
    required this.timestamp,
  });

  final String text;
  final bool isPreview;
  final DateTime timestamp;

  @override
  Widget build(BuildContext context) {
    final timeFmt = DateFormat('HH:mm:ss');

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 10),
            child: Text(
              timeFmt.format(timestamp),
              style: const TextStyle(color: Colors.white24, fontSize: 11),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isPreview
                    ? Colors.white.withValues(alpha: 0.05)
                    : Colors.cyanAccent.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isPreview
                      ? Colors.white12
                      : Colors.cyanAccent.withValues(alpha: 0.3),
                  width: 0.5,
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isPreview ? Colors.white54 : Colors.white,
                  fontSize: 15,
                  height: 1.6,
                  fontStyle: isPreview ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
