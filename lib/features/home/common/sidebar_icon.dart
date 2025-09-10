import 'package:dev_sweeper/core/models/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SidebarToolIcon extends StatelessWidget {
  const SidebarToolIcon({super.key, required this.tool, required this.size, required this.color});

  final Tool tool;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.asset(
        tool.path,
        // colorFilter: ColorFilter.mode(Colors.white, BlendMode.),
        color: color,
        alignment: Alignment.center,
      ),
    );
  }
}

extension on Tool {
  String get path => 'assets/logos/$name.svg';
}
