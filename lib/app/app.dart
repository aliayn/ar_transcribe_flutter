import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'routing/app_router.dart';
import '../features/settings/presentation/cubit/settings_cubit.dart';
import '../features/settings/presentation/cubit/settings_state.dart';
import 'package:ar_transcribe/gen_l10n/app_localizations.dart';

class ArTranscribeApp extends StatelessWidget {
  const ArTranscribeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final lang = state.settings.language;
        return MaterialApp.router(
          onGenerateTitle: (context) => AppLocalizations.of(context)?.appTitle ?? 'AR Transcribe',
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          locale: Locale(lang),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('fa'),
            Locale('ar'),
          ],
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            colorScheme: const ColorScheme.dark(
              primary: Colors.cyanAccent,
              secondary: Colors.cyanAccent,
            ),
            snackBarTheme: const SnackBarThemeData(
              backgroundColor: Color(0xFF1A1A2E),
              contentTextStyle: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
