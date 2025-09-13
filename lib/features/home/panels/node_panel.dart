import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:dev_sweeper/features/home/panels/common/base_panel.dart';
import 'package:dev_sweeper/features/home/panels/common/projects_panel_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NodePanel extends ConsumerWidget {
  const NodePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nodeControllerProvider);

    return BasePanel(
      state: state,
      onData: (state) => ProjectsPanelData(
        globalCacheSize: state.globalCacheSize,
        groupedProjects: state.groupedProjects,
        onShortenPath: ref.read(fileSystemManagerProvider).shortenPath,
        onCleanGlobalCache: () => ref.read(nodeControllerProvider.notifier).cleanGlobalCache(),
        onCleanProjects: (value) => ref.read(nodeControllerProvider.notifier).cleanProjects(value),
      ),
    );
  }
}
