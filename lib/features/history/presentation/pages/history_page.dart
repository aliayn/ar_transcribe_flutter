import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../ui/core/adaptive_content.dart';
import '../../../transcribe/domain/entities/transcribe_session.dart';
import '../cubit/history_cubit.dart';
import '../cubit/history_state.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'History',
          style: TextStyle(color: Colors.cyanAccent, letterSpacing: 2),
        ),
        leading: const BackButton(color: Colors.white70),
      ),
      body: AdaptiveContent(
        child: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(
                child: CircularProgressIndicator(color: Colors.cyanAccent),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.cyanAccent),
              ),
              loaded: (sessions) => sessions.isEmpty
                  ? const Center(
                      child: Text('No sessions yet.', style: TextStyle(color: Colors.white38)),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: sessions.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) => _SessionCard(session: sessions[index]),
                    ),
              failure: (message) => Center(
                child: Text(message, style: const TextStyle(color: Colors.redAccent)),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({required this.session});

  final TranscribeSession session;

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('MMM d, yyyy  HH:mm');
    final duration = session.duration;
    final durationLabel =
        '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white12),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withValues(alpha: 0.04),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                fmt.format(session.startedAt),
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
              const Spacer(),
              Text(
                durationLabel,
                style: const TextStyle(color: Colors.cyanAccent, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            session.fullText.isEmpty ? '(empty session)' : session.fullText,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: session.fullText.isEmpty ? Colors.white24 : Colors.white,
              height: 1.5,
            ),
          ),
          if (session.fullText.isNotEmpty) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.copy, size: 16),
                  label: const Text('Copy'),
                  style: TextButton.styleFrom(foregroundColor: Colors.white54),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: session.fullText));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Copied!')),
                    );
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.share, size: 16),
                  label: const Text('Share'),
                  style: TextButton.styleFrom(foregroundColor: Colors.white54),
                  onPressed: () => Share.share(session.fullText),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                  onPressed: () => context.read<HistoryCubit>().delete(session.id),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
