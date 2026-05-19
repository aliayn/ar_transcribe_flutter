import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.graphic_eq, size: 80, color: Colors.cyanAccent)
                .animate()
                .fadeIn(duration: 600.ms)
                .scale(),
            const SizedBox(height: 24),
            Text(
              'AR Transcribe',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.cyanAccent,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideY(begin: 0.2),
          ],
        ),
      ),
    );
  }
}
