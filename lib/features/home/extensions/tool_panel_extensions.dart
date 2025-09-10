import 'package:dev_sweeper/core/models/tool.dart';
import 'package:dev_sweeper/features/home/panels/brew_panel.dart';
import 'package:dev_sweeper/features/home/panels/flutter_panel.dart';
import 'package:dev_sweeper/features/home/panels/fvm_panel.dart';
import 'package:dev_sweeper/features/home/panels/node_panel.dart';
import 'package:dev_sweeper/features/home/panels/rust_panel.dart';
import 'package:dev_sweeper/features/home/panels/shorebird_panel.dart';
import 'package:dev_sweeper/features/home/panels/xcode_panel.dart';
import 'package:flutter/widgets.dart';

extension ToolPanelExtensions on Tool {
  Widget get panel => Padding(
    padding: const EdgeInsetsGeometry.symmetric(horizontal: 8),
    child: switch (this) {
      Tool.xcode => const XcodePanel(),
      Tool.homebrew => const BrewPanel(),
      Tool.flutter => const FlutterPanel(),
      Tool.fvm => const FVMPanel(),
      Tool.shorebird => const ShorebirdPanel(),
      Tool.node => const NodePanel(),
      Tool.rust => const RustPanel(),
    },
  );
}
