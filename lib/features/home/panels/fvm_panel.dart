import 'package:dev_sweeper/core/extensions/file_size_extensions.dart';
import 'package:dev_sweeper/core/l10n/l10n_extension.dart';
import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:dev_sweeper/core/widgets/adaptive_checkbox_group.dart';
import 'package:dev_sweeper/features/home/panels/common/base_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FVMPanel extends ConsumerWidget {
  const FVMPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fVMControllerProvider);

    return BasePanel(
      state: state,
      onData: (state) => FVMPanelData(
        state: state,
        onDelete: (value) => ref.read(fVMControllerProvider.notifier).removeVersions(value),
      ),
    );
  }
}

class FVMPanelData extends StatelessWidget {
  const FVMPanelData({
    super.key,
    required this.state,
    required this.onDelete,
  });

  final FVMState state;
  final void Function(Iterable<String>) onDelete;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 32,
            children: [
              AdaptiveCheckboxGroup(
                title: context.l10n.fvmPanelUnusedVersions,
                trailing: state.developer.map((e) => e.size).displayString,
                items: state.developer.map(
                  (item) => (
                    id: item.version,
                    title: item.version,
                    trailing: item.size,
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
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
