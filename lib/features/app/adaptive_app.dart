import 'package:dev_sweeper/core/l10n/generated/app_localizations.dart';
import 'package:dev_sweeper/core/state/platform_state.dart';
import 'package:dev_sweeper/features/home/home_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class AdaptiveApp extends ConsumerWidget {
  const AdaptiveApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return switch (state) {
      SupportedPlatform.linux => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: yaruLight,
        darkTheme: yaruDark,
        themeMode: ThemeMode.system,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: const HomeWindow(),
      ),
      SupportedPlatform.macOS => MacosApp(
        debugShowCheckedModeBanner: false,
        title: 'app_cleaner',
        theme: MacosThemeData.light(),
        darkTheme: MacosThemeData.dark(),
        themeMode: ThemeMode.system,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: const HomeWindow(),
      ),
    };
  }
}
