import 'package:dev_sweeper/core/l10n/l10n_extension.dart';
import 'package:dev_sweeper/core/state/platform_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdaptiveEmptyFolderGroup extends ConsumerWidget {
  const AdaptiveEmptyFolderGroup({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: switch (state) {
          SupportedPlatform.linux => 48,
          SupportedPlatform.macOS => 38,
        },
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(path),
          Padding(
            padding: EdgeInsets.only(
              left: switch (state) {
                SupportedPlatform.linux => 32,
                SupportedPlatform.macOS => 20,
              },
            ),
            child: Text(context.l10n.noProjectsFound),
          ),
        ],
      ),
    );
  }
}
