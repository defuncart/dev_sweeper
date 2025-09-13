import 'package:dev_sweeper/core/extensions/file_size_extensions.dart';
import 'package:dev_sweeper/core/l10n/l10n_extension.dart';
import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:dev_sweeper/core/widgets/adaptive_button.dart';
import 'package:dev_sweeper/features/home/panels/common/base_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShorebirdPanel extends ConsumerWidget {
  const ShorebirdPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shorebirdControllerProvider);

    return BasePanel(
      state: state,
      onData: (state) => Center(
        child: state.toInt() > 0
            ? Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  Text(context.l10n.shorebirdPanelCacheInfo(state.displayString)),
                  AdaptiveButton(
                    title: context.l10n.cleanCacheLabel,
                    onPressed: () => ref.read(shorebirdControllerProvider.notifier).clearCache(),
                  ),
                ],
              )
            : Text(context.l10n.shorebirdPanelCacheEmpty),
      ),
    );
  }
}
