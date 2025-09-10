import 'package:dev_sweeper/core/l10n/l10n_extension.dart';
import 'package:flutter/cupertino.dart';

enum Tool {
  xcode,
  homebrew,
  flutter,
  fvm,
  shorebird,
  node,
  rust,
}

extension ToolExtensions on Tool {
  String locaString(BuildContext context) => switch (this) {
    Tool.xcode => context.l10n.xcodeLabel,
    Tool.homebrew => context.l10n.brewLabel,
    Tool.flutter => context.l10n.flutterLabel,
    Tool.fvm => context.l10n.fvmLabel,
    Tool.shorebird => context.l10n.shorebirdLabel,
    Tool.node => context.l10n.nodeLabel,
    Tool.rust => context.l10n.rustLabel,
  };
}
