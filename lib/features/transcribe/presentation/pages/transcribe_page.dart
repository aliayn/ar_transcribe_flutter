import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../shared/widgets/live_waveform.dart';
import '../../../../shared/widgets/transcript_bubble.dart';
import '../../../settings/presentation/cubit/settings_cubit.dart';
import '../../domain/entities/transcribe_session.dart';
import '../bloc/transcribe_bloc.dart';
import '../bloc/transcribe_event.dart';
import '../bloc/transcribe_state.dart';

class TranscribePage extends StatefulWidget {
  const TranscribePage({super.key});

  @override
  State<TranscribePage> createState() => _TranscribePageState();
}

class _TranscribePageState extends State<TranscribePage> {
  final _scrollController = ScrollController();
  bool _autoScroll = true;
  bool _leaveAfterStop = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final settings = context.read<SettingsCubit>().state.settings;
      context.read<TranscribeBloc>().add(TranscribeEvent.started(settings));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (!_autoScroll) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _stopAndReturn() {
    _leaveAfterStop = true;
    context.read<TranscribeBloc>().add(const TranscribeEvent.stopped());
  }

  void _copyAll(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transcript copied!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranscribeBloc, TranscribeState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
        if (_leaveAfterStop && state.status == SessionStatus.idle) {
          context.pop();
          return;
        }
        if ((state.session?.segments.isNotEmpty ?? false) || state.livePreviewText.isNotEmpty) {
          _scrollToBottom();
        }
      },
      builder: (context, state) {
        final isRecording = state.status == SessionStatus.recording;
        final session = state.session;
        final segments = session?.segments ?? [];
        final fullText = session?.fullText ?? '';

        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                _buildTopBar(isRecording, fullText),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is UserScrollNotification) {
                        setState(() => _autoScroll = false);
                      }
                      return false;
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      itemCount: segments.length + (state.livePreviewText.isNotEmpty ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == segments.length && state.livePreviewText.isNotEmpty) {
                          return TranscriptBubble(
                            text: state.livePreviewText,
                            isPreview: true,
                            timestamp: DateTime.now(),
                          );
                        }

                        final segment = segments[index];
                        return TranscriptBubble(
                          text: segment.text,
                          isPreview: false,
                          timestamp: segment.timestamp,
                        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1);
                      },
                    ),
                  ),
                ),
                if (isRecording)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: LiveWaveform(isActive: true),
                  ),
                _buildBottomBar(isRecording, session),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopBar(bool isRecording, String fullText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.cyanAccent.withValues(alpha: 0.2), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isRecording ? Colors.redAccent : Colors.white30,
            ),
          ).animate(onPlay: (controller) => controller.repeat()).fadeOut(duration: 500.ms).then().fadeIn(duration: 500.ms),
          const SizedBox(width: 10),
          Text(
            isRecording ? 'Recording...' : 'Stopped',
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const Spacer(),
          if (fullText.isNotEmpty) ...[
            IconButton(
              icon: const Icon(Icons.copy, color: Colors.white60, size: 20),
              onPressed: () => _copyAll(fullText),
            ),
            IconButton(
              icon: const Icon(Icons.share, color: Colors.white60, size: 20),
              onPressed: () => Share.share(fullText),
            ),
          ],
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white60),
            onPressed: _stopAndReturn,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(bool isRecording, TranscribeSession? session) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!_autoScroll)
            IconButton(
              icon: const Icon(Icons.arrow_downward, color: Colors.white54),
              onPressed: () {
                setState(() => _autoScroll = true);
                _scrollToBottom();
              },
            ),
          const Spacer(),
          GestureDetector(
            onTap: isRecording ? _stopAndReturn : null,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isRecording ? Colors.redAccent : Colors.white30,
                  width: 3,
                ),
              ),
              child: Center(
                child: Container(
                  width: isRecording ? 28 : 44,
                  height: isRecording ? 28 : 44,
                  decoration: BoxDecoration(
                    color: isRecording ? Colors.redAccent : Colors.white30,
                    borderRadius: BorderRadius.circular(isRecording ? 6 : 22),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          if ((session?.fullText.isNotEmpty ?? false))
            IconButton(
              icon: const Icon(Icons.history, color: Colors.white54),
              onPressed: () => context.push('/history'),
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}
