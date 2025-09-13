import 'package:desktop_file_system/desktop_file_system.dart';
import 'package:dev_sweeper/core/extensions/file_size_extensions.dart';
import 'package:dev_sweeper/core/l10n/l10n_extension.dart';
import 'package:dev_sweeper/core/widgets/adaptive_button.dart';
import 'package:dev_sweeper/core/widgets/adaptive_checkbox_group.dart';
import 'package:dev_sweeper/core/widgets/adaptive_empty_folder_group.dart';
import 'package:flutter/widgets.dart';

class ProjectsPanelData extends StatelessWidget {
  const ProjectsPanelData({
    super.key,
    required this.globalCacheSize,
    required this.groupedProjects,
    required this.onShortenPath,
    required this.onCleanGlobalCache,
    required this.onCleanProjects,
  });

  final BigInt globalCacheSize;
  final List<FilesInDirResult> groupedProjects;
  final String Function(String) onShortenPath;
  final void Function() onCleanGlobalCache;
  final void Function(Iterable<String>) onCleanProjects;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 32,
            children: [
              if (globalCacheSize.toInt() > 0)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.techPanelGlobalCacheInfo(globalCacheSize.displayString)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: AdaptiveButton(
                        title: context.l10n.cleanCacheLabel,
                        onPressed: onCleanGlobalCache,
                      ),
                    ),
                  ],
                ),
              for (final group in groupedProjects)
                if (group.files.isNotEmpty)
                  AdaptiveCheckboxGroup(
                    title: onShortenPath(group.path),
                    trailing: group.files.map((e) => e.len).displayString,
                    items: group.files.map(
                      (item) => (
                        id: item.path,
                        title: item.path.replaceAll(group.path, ''),
                        trailing: item.len,
                      ),
                    ),
                    initiallyAllSelected: true,
                    buttonLabel: context.l10n.cleanLabel,
                    onButtonPressed: (value) {
                      if (value.isNotEmpty) {
                        onCleanProjects(value);
                      }
                    },
                  )
                else
                  AdaptiveEmptyFolderGroup(
                    path: onShortenPath(group.path),
                  ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
