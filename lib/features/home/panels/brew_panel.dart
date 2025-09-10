import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:dev_sweeper/core/widgets/adaptive_button.dart';
import 'package:dev_sweeper/features/home/panels/common/base_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrewPanel extends ConsumerWidget {
  const BrewPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(brewControllerProvider);

    return BasePanel(
      state: state,
      onData: (state) => Center(
        child: AdaptiveButton(
          title: 'brew update && brew upgrade && brew cleanup',
          onPressed: () => ref.read(brewControllerProvider.notifier).updateClean(),
        ),
      ),
    );
  }
}
