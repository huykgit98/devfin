import 'package:flutter/material.dart';

@immutable
class CustomColorsTheme extends ThemeExtension<CustomColorsTheme> {
  const CustomColorsTheme({
    required this.bottomNavigationBarBackgroundColor,
    required this.labelColor,
    required this.activeNavigationBarColor,
    required this.notActiveNavigationBarColor,
    required this.shadowNavigationBarColor,
    required this.linearGradientBackground,
    required this.loadingIndicatorGradient,
    required this.customLoadingGradient,
  });

  final Color bottomNavigationBarBackgroundColor;
  final Color labelColor;
  final Color activeNavigationBarColor;
  final Color notActiveNavigationBarColor;
  final Color shadowNavigationBarColor;
  final List<Color> linearGradientBackground;
  final List<Color> loadingIndicatorGradient;
  final List<Color> customLoadingGradient;

  @override
  CustomColorsTheme copyWith({
    Color? bottomNavigationBarBackgroundColor,
    Color? labelColor,
    Color? activeNavigationBarColor,
    Color? notActiveNavigationBarColor,
    Color? shadowNavigationBarColor,
    List<Color>? linearGradientBackground,
    List<Color>? loadingIndicatorGradient,
    List<Color>? customLoadingGradient,
  }) {
    return CustomColorsTheme(
      bottomNavigationBarBackgroundColor: bottomNavigationBarBackgroundColor ??
          this.bottomNavigationBarBackgroundColor,
      labelColor: labelColor ?? this.labelColor,
      activeNavigationBarColor:
          activeNavigationBarColor ?? this.activeNavigationBarColor,
      notActiveNavigationBarColor:
          notActiveNavigationBarColor ?? this.notActiveNavigationBarColor,
      shadowNavigationBarColor:
          shadowNavigationBarColor ?? this.shadowNavigationBarColor,
      linearGradientBackground:
          linearGradientBackground ?? this.linearGradientBackground,
      loadingIndicatorGradient:
          loadingIndicatorGradient ?? this.loadingIndicatorGradient,
      customLoadingGradient:
          customLoadingGradient ?? this.customLoadingGradient,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomColorsTheme lerp(
    ThemeExtension<CustomColorsTheme>? other,
    double t,
  ) {
    if (other is! CustomColorsTheme) {
      return this;
    }
    return CustomColorsTheme(
      linearGradientBackground: linearGradientBackground,
      loadingIndicatorGradient: loadingIndicatorGradient,
      customLoadingGradient: customLoadingGradient,
      bottomNavigationBarBackgroundColor: Color.lerp(
            bottomNavigationBarBackgroundColor,
            other.bottomNavigationBarBackgroundColor,
            t,
          ) ??
          bottomNavigationBarBackgroundColor,
      labelColor: Color.lerp(
            labelColor,
            other.labelColor,
            t,
          ) ??
          labelColor,
      activeNavigationBarColor: Color.lerp(
            activeNavigationBarColor,
            other.activeNavigationBarColor,
            t,
          ) ??
          activeNavigationBarColor,
      notActiveNavigationBarColor: Color.lerp(
            notActiveNavigationBarColor,
            other.notActiveNavigationBarColor,
            t,
          ) ??
          notActiveNavigationBarColor,
      shadowNavigationBarColor: Color.lerp(
            shadowNavigationBarColor,
            other.shadowNavigationBarColor,
            t,
          ) ??
          shadowNavigationBarColor,
    );
  }
}
