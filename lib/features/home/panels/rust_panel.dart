import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:dev_sweeper/features/home/panels/common/base_panel.dart';
import 'package:dev_sweeper/features/home/panels/common/projects_panel_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RustPanel extends ConsumerWidget {
  const RustPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rustControllerProvider);

    return BasePanel(
      state: state,
      onData: (state) => ProjectsPanelData(
        globalCacheSize: state.globalCacheSize,
        groupedProjects: state.groupedProjects,
        onShortenPath: ref.read(fileSystemManagerProvider).shortenPath,
        onCleanGlobalCache: () => ref.read(rustControllerProvider.notifier).cleanGlobalCache(),
        onCleanProjects: (value) => ref.read(rustControllerProvider.notifier).cleanProjects(value),
      ),
    );
  }
}
