import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/injection.dart';
import '../../features/history/presentation/cubit/history_cubit.dart';
import '../../features/history/presentation/pages/history_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/transcribe/presentation/bloc/transcribe_bloc.dart';
import '../../features/transcribe/presentation/pages/transcribe_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/transcribe',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<TranscribeBloc>(),
        child: const TranscribePage(),
      ),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<HistoryCubit>(),
        child: const HistoryPage(),
      ),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    backgroundColor: Colors.black,
    body: Center(
      child: Text(
        state.error?.toString() ?? 'Route not found',
        style: const TextStyle(color: Colors.white70),
      ),
    ),
  ),
);
