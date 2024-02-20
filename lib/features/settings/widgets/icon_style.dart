import 'package:devfin/app/app.dart';
import 'package:flutter/material.dart';

class IconStyle {
  IconStyle({
    this.iconsColor = Colors.white,
    this.withBackground = true,
    this.backgroundColor = Colors.blue,
    this.borderRadius = Sizes.p8,
  });
  Color? iconsColor;
  bool? withBackground;
  Color? backgroundColor;
  double? borderRadius;
}
