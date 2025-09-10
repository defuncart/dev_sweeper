import 'package:dev_sweeper/core/extensions/file_size_extensions.dart';
import 'package:dev_sweeper/core/state/platform_state.dart';
import 'package:dev_sweeper/core/widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

typedef CheckboxGroupItem = ({String id, String title, BigInt trailing});

class AdaptiveCheckboxGroup extends StatefulWidget {
  const AdaptiveCheckboxGroup({
    super.key,
    required this.title,
    required this.trailing,
    required this.items,
    required this.initiallyAllSelected,
    required this.buttonLabel,
    required this.onButtonPressed,
  });

  final String title;
  final String trailing;
  final Iterable<CheckboxGroupItem> items;
  final bool initiallyAllSelected;
  final String buttonLabel;
  final void Function(Iterable<String>) onButtonPressed;

  @override
  State<AdaptiveCheckboxGroup> createState() => _AdaptiveCheckboxGroupState();
}

class _AdaptiveCheckboxGroupState extends State<AdaptiveCheckboxGroup> {
  var _isExpanded = true;
  var _checkboxStatuses = <String, bool>{};

  bool get _canSubmit => _checkboxStatuses.values.any((t) => t);

  @override
  void initState() {
    super.initState();
    _updateStatues();
  }

  @override
  void didUpdateWidget(AdaptiveCheckboxGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateStatues();
  }

  void _updateStatues() {
    final newMap = {
      for (final id in widget.items.map((i) => i.id)) id: _checkboxStatuses[id] ?? widget.initiallyAllSelected,
    };
    _checkboxStatuses = newMap;
  }

  void _setAll(bool value) {
    _checkboxStatuses = {
      for (final id in widget.items.map((i) => i.id)) id: value,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Row(
          spacing: 8,
          children: [
            AdaptiveAccordionIcon(
              isEnabled: _isExpanded,
              onToggle: () => setState(() => _isExpanded = !_isExpanded),
            ),
            Expanded(
              child: AdaptiveCheckboxRow(
                isTristate: true,
                isSelected: _checkboxStatuses.values.every((t) => t)
                    ? true
                    : _checkboxStatuses.values.every((t) => !t)
                    ? false
                    : null,
                onChanged: (value) => setState(() => _setAll(value)),
                label: widget.title,
                trailing: widget.trailing,
              ),
            ),
          ],
        ),
        if (_isExpanded)
          AdaptiveCheckboxGroupContentPadding(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                for (final item in widget.items)
                  AdaptiveCheckboxRow(
                    isTristate: false,
                    isSelected: _checkboxStatuses[item.id]!,
                    onChanged: (value) => setState(() => _checkboxStatuses[item.id] = value),
                    label: item.title,
                    trailing: item.trailing.displayString,
                  ),
              ],
            ),
          ),
        Align(
          alignment: Alignment.centerRight,
          child: AdaptiveButton(
            title: widget.buttonLabel,
            onPressed: _canSubmit
                ? () => widget.onButtonPressed(
                    _checkboxStatuses.entries.where((kvp) => kvp.value).map((kvp) => kvp.key),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class AdaptiveCheckboxGroupContentPadding extends ConsumerWidget {
  const AdaptiveCheckboxGroupContentPadding({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: switch (state) {
          SupportedPlatform.linux => 80,
          SupportedPlatform.macOS => 60,
        },
      ),
      child: child,
    );
  }
}

class AdaptiveCheckboxRow extends StatelessWidget {
  const AdaptiveCheckboxRow({
    super.key,
    required this.isTristate,
    required this.isSelected,
    required this.onChanged,
    required this.label,
    required this.trailing,
  });

  final bool isTristate;
  final bool? isSelected;
  final void Function(bool) onChanged;
  final String label;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 32,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8,
            children: [
              AdaptiveCheckbox(
                isTristate: isTristate,
                isSelected: isSelected,
                onChanged: onChanged,
              ),
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        Text(trailing),
      ],
    );
  }
}

class AdaptiveCheckbox extends ConsumerWidget {
  const AdaptiveCheckbox({
    super.key,
    required this.isTristate,
    required this.isSelected,
    required this.onChanged,
  });

  final bool isTristate;
  final bool? isSelected;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return switch (state) {
      SupportedPlatform.linux => YaruCheckbox(
        value: isSelected,
        onChanged: (v) {
          // simulate macOS behavior
          if (isTristate && isSelected == null && v == false) {
            onChanged(true);
            return;
          }

          // if tristate, true -> false (do not show null state)
          onChanged(v ?? false);
        },
        tristate: isTristate,
      ),
      SupportedPlatform.macOS => MacosCheckbox(
        value: isSelected,
        onChanged: onChanged,
      ),
    };
  }
}

class AdaptiveAccordionIcon extends ConsumerWidget {
  const AdaptiveAccordionIcon({
    super.key,
    required this.isEnabled,
    required this.onToggle,
  });

  final bool isEnabled;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(platformControllerProvider);

    return switch (state) {
      SupportedPlatform.linux => YaruIconButton(
        icon: Icon(
          isEnabled ? YaruIcons.arrow_down : YaruIcons.arrow_right,
          color: isEnabled ? Theme.of(context).disabledColor : null,
        ),
        onPressed: onToggle,
      ),
      SupportedPlatform.macOS => MacosIconButton(
        icon: MacosIcon(
          isEnabled ? CupertinoIcons.chevron_down : CupertinoIcons.chevron_right,
          color: isEnabled ? MacosTheme.of(context).dividerColor : MacosTheme.of(context).typography.body.color,
        ),
        hoverColor: const Color.from(alpha: 0, red: 0, green: 0, blue: 0),
        onPressed: onToggle,
      ),
    };
  }
}
