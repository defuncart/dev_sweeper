import 'package:dev_sweeper/core/extensions/file_size_extensions.dart';
import 'package:dev_sweeper/core/l10n/l10n_extension.dart';
import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:dev_sweeper/core/widgets/adaptive_checkbox_group.dart';
import 'package:dev_sweeper/features/home/panels/common/base_panel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class XcodePanel extends ConsumerWidget {
  const XcodePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(xcodeControllerProvider);

    return BasePanel(
      state: state,
      onData: (state) => XcodePanelStateData(
        state: state,
        onDelete: (value) => ref.read(xcodeControllerProvider.notifier).deleteFolders(value),
      ),
    );
  }
}

class XcodePanelStateData extends StatelessWidget {
  const XcodePanelStateData({
    super.key,
    required this.state,
    required this.onDelete,
  });

  final XcodeState state;
  final void Function(Iterable<String>) onDelete;

  @override
  Widget build(BuildContext context) {
    final items = [
      if (state.archives.files.isNotEmpty)
        (
          title: context.l10n.xcodePanelArchives,
          items: state.archives.files,
          trailing: state.archives.length.displayString,
          path: state.archives.path,
        ),
      if (state.derivedData.files.isNotEmpty)
        (
          title: context.l10n.xcodePanelDerivedData,
          items: state.derivedData.files,
          trailing: state.derivedData.length.displayString,
          path: state.derivedData.path,
        ),
      if (state.iOSDeviceLogs.isNotEmpty)
        (
          title: context.l10n.xcodePaneliOSDeviceLogs,
          items: state.iOSDeviceLogs,
          trailing: state.iOSDeviceLogs.length.displayString,
          path: null,
        ),
      if (state.iOSDeviceSupport.files.isNotEmpty)
        (
          title: context.l10n.xcodePaneliOSDeviceSupport,
          items: state.iOSDeviceSupport.files,
          trailing: state.iOSDeviceSupport.length.displayString,
          path: state.iOSDeviceSupport.path,
        ),
      if (state.macOSDeviceSupport.files.isNotEmpty)
        (
          title: context.l10n.xcodePanelmacOSDeviceSupport,
          items: state.macOSDeviceSupport.files,
          trailing: state.macOSDeviceSupport.length.displayString,
          path: state.macOSDeviceSupport.path,
        ),
    ];

    if (items.isEmpty) {
      return Center(
        child: Text(context.l10n.xcodePanelAllDone),
      );
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 32,
            children: items
                .map(
                  (group) => AdaptiveCheckboxGroup(
                    title: group.title,
                    trailing: group.trailing,
                    items: group.items.map(
                      (item) => (
                        id: item.path,
                        title: group.path != null ? item.path.replaceAll(group.path!, '') : item.path,
                        trailing: item.len,
                      ),
                    ),
                    initiallyAllSelected: true,
                    buttonLabel: context.l10n.deleteLabel,
                    onButtonPressed: (value) {
                      if (value.isNotEmpty) {
                        onDelete(value);
                      }
                    },
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
