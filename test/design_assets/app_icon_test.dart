import 'package:app_store_screenshots/app_store_screenshots.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  generateAppIconMacOS(
    onBuildIcon: (size) => AppIcon(size: size),
  );
}

class AppIcon extends StatelessWidget {
  const AppIcon({
    required this.size,
    super.key,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: SizedBox(
        width: size,
        height: size,
        child: CupertinoPageScaffold(
          child: Center(
            child: Icon(
              Icons.delete,
              fill: 1,
              size: size * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
