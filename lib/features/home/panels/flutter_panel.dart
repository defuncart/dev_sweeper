import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:dev_sweeper/features/home/panels/common/base_panel.dart';
import 'package:dev_sweeper/features/home/panels/common/projects_panel_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlutterPanel extends ConsumerWidget {
  const FlutterPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(flutterControllerProvider);

    return BasePanel(
      state: state,
      onData: (state) => ProjectsPanelData(
        groupedProjects: state.groupedProjects,
        onShortenPath: ref.read(fileSystemManagerProvider).shortenPath,
        onDelete: (value) => ref.read(flutterControllerProvider.notifier).deleteFolders(value),
        onClean: (value) => ref.read(flutterControllerProvider.notifier).cleanFolders(value),
      ),
    );
  }
}
