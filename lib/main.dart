import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/di/injection.dart';
import 'core/startup/app_initializer.dart';
import 'features/settings/presentation/cubit/settings_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  // Kick off .env loading immediately; splash waits for it before transcribe.
  AppInitializer.ensureInitialized();

  runApp(
    BlocProvider(
      create: (_) => getIt<SettingsCubit>()..load(),
      child: const ArTranscribeApp(),
    ),
  );
}
