import 'package:dev_sweeper/core/state/platform_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

typedef RadioItem<T> = ({T value, String label});

class AdaptiveRadioGroup<T> extends ConsumerWidget {
  const AdaptiveRadioGroup({
    super.key,
    required this.title,
    required this.items,
    required this.selected,
    required this.onChanged,
  });

  final String title;
  final List<RadioItem> items;
  final T selected;
  final void Function(T) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(title),
        Column(
          spacing: 4,
          children: [
            for (final item in items)
              switch (state) {
                SupportedPlatform.linux => YaruRadioButton<T>(
                  value: item.value,
                  groupValue: selected,
                  onChanged: (value) {
                    if (value != null) {
                      onChanged(value);
                    }
                  },
                  toggleable: false,
                  title: Text(item.label),
                ),
                SupportedPlatform.macOS => Row(
                  spacing: 8,
                  children: [
                    MacosRadioButton<T>(
                      value: item.value,
                      groupValue: selected,
                      onChanged: (value) {
                        if (value != null) {
                          onChanged(value);
                        }
                      },
                    ),
                    Text(item.label),
                  ],
                ),
              },
          ],
        ),
      ],
    );
  }
}
