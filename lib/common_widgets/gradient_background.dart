import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({this.child, super.key, this.gradient});
  final Gradient? gradient;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: gradient ??
                const LinearGradient(
                  colors: ColorsUtil.lightLinearGradient,
                ),
          ),
        ),
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}
