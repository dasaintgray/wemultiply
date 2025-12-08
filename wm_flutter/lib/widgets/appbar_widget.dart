import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final Widget? child;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color> colors;
  final TileMode tileMode;

  const AppbarWidget({
    super.key,
    this.child,
    this.begin = Alignment.topRight,
    this.end = Alignment.bottomLeft,
    required this.colors,
    this.tileMode = TileMode.clamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
          tileMode: tileMode,
        ),
      ),
      child: child,
    );
  }
}
