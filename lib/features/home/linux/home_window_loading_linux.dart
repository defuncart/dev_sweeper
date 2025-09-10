import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class HomeWindowLoadingLinux extends StatelessWidget {
  const HomeWindowLoadingLinux({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: YaruCircularProgressIndicator(),
      ),
    );
  }
}
