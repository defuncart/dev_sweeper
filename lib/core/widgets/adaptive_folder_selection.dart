import 'package:dev_sweeper/core/l10n/l10n_extension.dart';
import 'package:dev_sweeper/core/state/project_folders_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdaptiveFolderSelection extends ConsumerWidget {
  const AdaptiveFolderSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(projectFoldersControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(context.l10n.settingsPanelPathsScanProjects),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            for (final folder in state) Text(folder),
          ],
        ),
      ],
    );
  }
}
