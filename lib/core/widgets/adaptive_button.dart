import 'package:dev_sweeper/core/state/platform_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class AdaptiveButton extends ConsumerWidget {
  const AdaptiveButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return switch (state) {
      SupportedPlatform.linux => ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
      SupportedPlatform.macOS => PushButton(
        controlSize: ControlSize.regular,
        onPressed: onPressed,
        child: Text(title),
      ),
    };
  }
}
