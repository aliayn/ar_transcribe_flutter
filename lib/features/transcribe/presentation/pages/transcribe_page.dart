import 'dart:io' show Platform;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ar_transcribe/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/config/feature_flags.dart';
import '../../../../shared/widgets/ar_transcript_overlay.dart';
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
  CameraController? _cameraController;
  bool _cameraReady = false;

  void _addBlocEvent(TranscribeEvent event) {
    if (!mounted) return;
    try {
      context.read<TranscribeBloc>().add(event);
    } on StateError {
      // Bloc closed during teardown.
    }
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final settings = context.read<SettingsCubit>().state.settings;
      _addBlocEvent(TranscribeEvent.started(settings));
    });
  }

  Future<void> _initCamera() async {
    final cameraStatus = await Permission.camera.request();
    if (!cameraStatus.isGranted) {
      if (!mounted) return;
      final message = cameraStatus.isPermanentlyDenied
          ? 'Camera permission denied. Enable it in Settings.'
          : 'Camera permission is required for the AR preview.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
      return;
    }

    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No camera found on this device.')),
        );
        return;
      }

      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        back,
        ResolutionPreset.ultraHigh,
        enableAudio: false,
        imageFormatGroup: Platform.isIOS ? ImageFormatGroup.bgra8888 : ImageFormatGroup.yuv420,
      );
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() {
        _cameraController = controller;
        _cameraReady = true;
      });
    } catch (error, stackTrace) {
      debugPrint('Camera init failed: $error\n$stackTrace');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open camera.')),
      );
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _stopAndReturn() {
    _addBlocEvent(const TranscribeEvent.stopped());
    if (mounted) context.pop();
  }

  void _copyAll(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  String _textForMode(TranscribeSession? session, ArDisplayMode mode) {
    if (session == null) return '';
    return mode == ArDisplayMode.transcript ? session.fullText : session.translationText;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranscribeBloc, TranscribeState>(
      listenWhen: (previous, current) => previous.errorMessage != current.errorMessage && current.errorMessage != null,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage!)),
        );
      },
      builder: (context, state) {
        final l10n = AppLocalizations.of(context)!;
        final settings = context.watch<SettingsCubit>().state.settings;
        const translationEnabled = FeatureFlags.geminiTranslationEnabled;
        final translationChip = settings.language.isEmpty ? 'TR' : settings.language.toUpperCase();

        final isLive = state.status == SessionStatus.recording;
        final canStop = state.status != SessionStatus.idle;
        final session = state.session;
        final displayMode = translationEnabled ? state.displayMode : ArDisplayMode.transcript;
        final displayText = _textForMode(session, displayMode);

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            _stopAndReturn();
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  if (_cameraReady && _cameraController != null)
                    CameraPreview(_cameraController!)
                  else
                    const ColoredBox(color: Colors.black),
                  SafeArea(
                    child: IgnorePointer(
                      child: ArTranscriptOverlay(
                        segments: session?.segments ?? [],
                        livePreviewText: state.livePreviewText,
                        displayMode: displayMode,
                        isConnected: state.isConnected && isLive,
                        transcriptChipLabel: l10n.transcriptChipLabel,
                        translationChipLabel: translationChip,
                        showTranslationToggle: translationEnabled,
                        onModeChanged: (mode) => _addBlocEvent(
                          TranscribeEvent.displayModeChanged(mode),
                        ),
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: AlignmentDirectional.topEnd,
                  //   child: SafeArea(
                  //     child: _TopBar(
                  //       isLive: isLive,
                  //       displayText: displayText,
                  //       onClose: _stopAndReturn,
                  //       onCopy: displayText.isNotEmpty ? () => _copyAll(displayText) : null,
                  //       onShare: displayText.isNotEmpty ? () => Share.share(displayText) : null,
                  //     ),
                  //   ),
                  // ),
                  // Replace bottom controls with a back button on the AppBar
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: SafeArea(
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: _stopAndReturn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TopBar extends StatefulWidget {
  const _TopBar({
    required this.isLive,
    required this.displayText,
    required this.onClose,
    this.onCopy,
    this.onShare,
  });

  final bool isLive;
  final String displayText;
  final VoidCallback onClose;
  final VoidCallback? onCopy;
  final VoidCallback? onShare;

  @override
  State<_TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<_TopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isLive ? Colors.redAccent : Colors.white30,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.isLive ? 'Live' : 'Stopped',
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          // const Spacer(),
          // if (onCopy != null)
          //   IconButton(
          //     icon: const Icon(Icons.copy, color: Colors.white60, size: 20),
          //     onPressed: onCopy,
          //   ),
          // if (onShare != null)
          //   IconButton(
          //     icon: const Icon(Icons.share, color: Colors.white60, size: 20),
          //     onPressed: onShare,
          //   ),
          // IconButton(
          //   icon: const Icon(Icons.close, color: Colors.white60),
          //   onPressed: onClose,
          // ),
        ],
      ),
    );
  }
}

class _BottomControls extends StatefulWidget {
  const _BottomControls({
    required this.canStop,
    required this.hasHistory,
    required this.onStop,
    required this.onHistory,
  });

  final bool canStop;
  final bool hasHistory;
  final VoidCallback onStop;
  final VoidCallback onHistory;

  @override
  State<_BottomControls> createState() => _BottomControlsState();
}

class _BottomControlsState extends State<_BottomControls> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.hasHistory)
            IconButton(
              icon: const Icon(Icons.history, color: Colors.white54),
              onPressed: widget.onHistory,
            )
          else
            const SizedBox(width: 48),
          const Spacer(),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.canStop ? widget.onStop : null,
              customBorder: const CircleBorder(),
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.canStop ? Colors.redAccent : Colors.white30,
                    width: 3,
                  ),
                ),
                child: Center(
                  child: Icon(
                    widget.canStop ? Icons.stop_rounded : Icons.mic_none,
                    color: widget.canStop ? Colors.redAccent : Colors.white30,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
