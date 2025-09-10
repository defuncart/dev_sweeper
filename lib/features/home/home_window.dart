import 'package:dev_sweeper/core/models/tool.dart';
import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:dev_sweeper/core/state/platform_state.dart';
import 'package:dev_sweeper/features/home/linux/home_window_data_linux.dart';
import 'package:dev_sweeper/features/home/linux/home_window_loading_linux.dart';
import 'package:dev_sweeper/features/home/macos/home_window_data_macos.dart';
import 'package:dev_sweeper/features/home/macos/home_window_loading_macos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeWindow extends ConsumerWidget {
  const HomeWindow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(toolControllerProvider);

    return switch (state) {
      ToolsStateLoading() => const HomeWindowLoading(),
      ToolsStateData(:final tools) => HomeWindowData(tools: tools),
    };
  }
}

class HomeWindowLoading extends ConsumerWidget {
  const HomeWindowLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return switch (state) {
      SupportedPlatform.linux => const HomeWindowLoadingLinux(),
      SupportedPlatform.macOS => const HomeWindowLoadingMacOS(),
    };
  }
}

class HomeWindowData extends ConsumerWidget {
  const HomeWindowData({super.key, required this.tools});

  final List<Tool> tools;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return switch (state) {
      SupportedPlatform.linux => HomeWindowDataLinux(tools: tools),
      SupportedPlatform.macOS => HomeWindowDataMacOS(tools: tools),
    };
  }
}
