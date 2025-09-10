import 'package:dev_sweeper/core/configs/window_config.dart';
import 'package:dev_sweeper/core/file_system/file_system_manager.dart';
import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:dev_sweeper/features/app/adaptive_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (defaultTargetPlatform == TargetPlatform.macOS) {
    const config = MacosWindowUtilsConfig();
    await config.apply();
  }

  setWindowMinSize(minWindowSize);

  final fs = FileSystemManager();
  await fs.init();

  runApp(
    ProviderScope(
      overrides: [
        fileSystemManagerProvider.overrideWithValue(fs),
      ],
      child: const AdaptiveApp(),
    ),
  );
}
