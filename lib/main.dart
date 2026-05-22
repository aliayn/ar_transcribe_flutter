import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/app.dart';
import 'core/di/injection.dart';
import 'features/settings/presentation/cubit/settings_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await configureDependencies();

  runApp(
    BlocProvider(
      create: (_) => getIt<SettingsCubit>()..load(),
      child: const ArTranscribeApp(),
    ),
  );
}
