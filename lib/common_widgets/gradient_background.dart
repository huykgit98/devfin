import 'package:devfin/app/app.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    this.child,
    super.key,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors.linearGradientBackground,
            ),
          ),
        ),
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}
