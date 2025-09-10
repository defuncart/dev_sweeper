import 'package:dev_sweeper/core/l10n/l10n_extension.dart';
import 'package:dev_sweeper/core/models/tool.dart';
import 'package:dev_sweeper/features/home/common/sidebar_icon.dart';
import 'package:dev_sweeper/features/home/extensions/tool_panel_extensions.dart';
import 'package:dev_sweeper/features/home/panels/settings_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class HomeWindowDataMacOS extends StatefulWidget {
  const HomeWindowDataMacOS({super.key, required this.tools});

  final List<Tool> tools;

  @override
  State<HomeWindowDataMacOS> createState() => _HomeWindowDataMacOSState();
}

class _HomeWindowDataMacOSState extends State<HomeWindowDataMacOS> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        builder: (context, controller) => SidebarItems(
          scrollController: controller,
          itemSize: SidebarItemSize.large,
          items: [
            for (final (index, tool) in widget.tools.indexed)
              SidebarItem(
                leading: SidebarToolIcon(
                  tool: tool,
                  size: 16,
                  color: _currentIndex == index ? MacosColors.white : MacosTheme.of(context).primaryColor,
                ),
                label: Text(tool.locaString(context)),
              ),
            SidebarItem(
              leading: const MacosIcon(CupertinoIcons.settings),
              label: Text(context.l10n.settingsLabel),
            ),
          ],
          currentIndex: _currentIndex,
          onChanged: (index) => setState(() => _currentIndex = index),
        ),
        minWidth: 240,
        maxWidth: 240,
        isResizable: false,
      ),
      child: IndexedStack(
        index: _currentIndex,
        children: [
          for (final tool in widget.tools)
            MacosPanel(
              title: tool.locaString(context),
              child: tool.panel,
            ),
          MacosPanel(
            title: context.l10n.settingsLabel,
            child: const SettingsPanel(),
          ),
        ],
      ),
    );
  }
}

class MacosPanel extends StatelessWidget {
  const MacosPanel({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: ToolBar(
        title: Text(title),
      ),
      children: [
        ContentArea(
          builder: (_, _) => child,
        ),
      ],
    );
  }
}
