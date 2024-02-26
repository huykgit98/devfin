import 'package:devfin/app/app.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    this.child,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.stops,
    super.key,
  });
  final Widget? child;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors.linearGradientBackground,
              begin: begin,
              end: end,
              stops: stops,
            ),
          ),
        ),
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}
