import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/startup/app_initializer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const _minBrandingDuration = Duration(milliseconds: 350);

  @override
  void initState() {
    super.initState();
    _navigateWhenReady();
  }

  Future<void> _navigateWhenReady() async {
    final startedAt = DateTime.now();

    await AppInitializer.ensureInitialized();

    final elapsed = DateTime.now().difference(startedAt);
    final remaining = _minBrandingDuration - elapsed;
    if (remaining > Duration.zero) {
      await Future.delayed(remaining);
    }

    if (!mounted) return;
    context.go('/home');
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
                .fadeIn(duration: 300.ms)
                .scale(),
            const SizedBox(height: 24),
            Text(
              'AR Transcribe',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.cyanAccent,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 150.ms, duration: 300.ms).slideY(begin: 0.2),
          ],
        ),
      ),
    );
  }
}
