import 'package:dev_sweeper/core/l10n/l10n_extension.dart';
import 'package:dev_sweeper/core/models/tool.dart';
import 'package:dev_sweeper/features/home/common/sidebar_icon.dart';
import 'package:dev_sweeper/features/home/extensions/tool_panel_extensions.dart';
import 'package:dev_sweeper/features/home/panels/settings_panel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class HomeWindowDataLinux extends StatelessWidget {
  const HomeWindowDataLinux({super.key, required this.tools});

  final List<Tool> tools;

  @override
  Widget build(BuildContext context) {
    final items = [
      for (final tool in tools)
        (
          () => SidebarToolIcon(
            tool: tool,
            size: 20,
            color: Theme.of(context).textTheme.bodySmall!.color!,
          ),
          tool.locaString(context),
          () => tool.panel,
        ),
      (
        () => const Icon(YaruIcons.settings),
        context.l10n.settingsLabel,
        () => const SettingsPanel(),
      ),
    ];

    return YaruMasterDetailPage(
      length: items.length,
      paneLayoutDelegate: const YaruResizablePaneDelegate(
        initialPaneSize: 240,
        minPageSize: kYaruMasterDetailBreakpoint / 2,
        minPaneSize: 240,
      ),
      tileBuilder: (context, index, selected, availableWidth) => YaruMasterTile(
        leading: items[index].$1(),
        title: Text(items[index].$2),
      ),
      pageBuilder: (context, index) => YaruDetailPage(
        // when simulating yaru on macOS, YaruWindowTitleBar has a conflict with macos_ui native methods
        appBar: kDebugMode
            ? AppBar(
                title: Text(items[index].$2),
              )
            : YaruWindowTitleBar(
                backgroundColor: Colors.transparent,
                border: BorderSide.none,
                title: Text(items[index].$2),
              ),
        body: items[index].$3(),
      ),
    );
  }
}
