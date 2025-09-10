import 'package:dev_sweeper/core/state/platform_state.dart';
import 'package:dev_sweeper/core/widgets/adaptive_folder_selection.dart';
import 'package:dev_sweeper/core/widgets/adaptive_radio_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPanel extends StatelessWidget {
  const SettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        SizedBox(height: 16),
        if (kDebugMode) SelectPlatformButton(),
        AdaptiveFolderSelection(),
      ],
    );
  }
}

class SelectPlatformButton extends ConsumerWidget {
  const SelectPlatformButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return AdaptiveRadioGroup<SupportedPlatform>(
      title: 'Platform',
      items: SupportedPlatform.values
          .map(
            (v) => (
              value: v,
              label: v.name,
            ),
          )
          .toList(),
      selected: state,
      onChanged: (value) => ref.read(platformControllerProvider.notifier).set(value),
    );
  }
}
