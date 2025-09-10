import 'package:dev_sweeper/core/state/platform_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

class AdaptiveSpinner extends ConsumerWidget {
  const AdaptiveSpinner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return switch (state) {
      SupportedPlatform.linux => const YaruCircularProgressIndicator(),
      SupportedPlatform.macOS => const CupertinoActivityIndicator(),
    };
  }
}
