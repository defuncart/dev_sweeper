import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class HomeWindowLoadingMacOS extends StatelessWidget {
  const HomeWindowLoadingMacOS({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      child: MacosScaffold(
        children: [
          ContentArea(
            builder: (_, _) => const Center(child: CupertinoActivityIndicator()),
          ),
        ],
      ),
    );
  }
}
