import 'dart:math';

import 'package:flutter/material.dart';

class LiveWaveform extends StatefulWidget {
  const LiveWaveform({super.key, required this.isActive});

  final bool isActive;

  @override
  State<LiveWaveform> createState() => _LiveWaveformState();
}

class _LiveWaveformState extends State<LiveWaveform> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _random = Random();
  List<double> _bars = List.filled(30, 0.1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addListener(_updateBars)
      ..repeat();
  }

  void _updateBars() {
    if (!widget.isActive) return;
    setState(() {
      _bars = List.generate(30, (_) => 0.1 + _random.nextDouble() * 0.9);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _bars.map((h) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 80),
            width: 3,
            height: widget.isActive ? h * 40 : 4,
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
            decoration: BoxDecoration(
              color: Colors.cyanAccent.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }).toList(),
      ),
    );
  }
}
