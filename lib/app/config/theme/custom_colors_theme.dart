import 'package:flutter/material.dart';

@immutable
class CustomColorsTheme extends ThemeExtension<CustomColorsTheme> {
  const CustomColorsTheme({
    required this.bottomNavigationBarBackgroundColor,
    required this.labelColor,
    required this.activeNavigationBarColor,
    required this.notActiveNavigationBarColor,
    required this.shadowNavigationBarColor,
    required this.backgroundColor,
    required this.linearGradientBackground,
    required this.linearGradientBackgroundWithOpacity,
    required this.loadingIndicatorGradient,
    required this.customLoadingGradient,
    required this.buttonGradient,
    required this.disabledButtonGradient,
  });

  final Color bottomNavigationBarBackgroundColor;
  final Color labelColor;
  final Color activeNavigationBarColor;
  final Color notActiveNavigationBarColor;
  final Color shadowNavigationBarColor;
  final Color backgroundColor;
  final List<Color> linearGradientBackground;
  final List<Color> linearGradientBackgroundWithOpacity;
  final List<Color> loadingIndicatorGradient;
  final List<Color> customLoadingGradient;
  final List<Color> buttonGradient;
  final List<Color> disabledButtonGradient;

  @override
  CustomColorsTheme copyWith({
    Color? bottomNavigationBarBackgroundColor,
    Color? labelColor,
    Color? activeNavigationBarColor,
    Color? notActiveNavigationBarColor,
    Color? shadowNavigationBarColor,
    Color? backgroundColor,
    List<Color>? linearGradientBackground,
    List<Color>? linearGradientBackgroundWithOpacity,
    List<Color>? loadingIndicatorGradient,
    List<Color>? customLoadingGradient,
    List<Color>? buttonGradient,
    List<Color>? disabledButtonGradient,
  }) {
    return CustomColorsTheme(
      disabledButtonGradient:
          disabledButtonGradient ?? this.disabledButtonGradient,
      buttonGradient: buttonGradient ?? this.buttonGradient,
      bottomNavigationBarBackgroundColor: bottomNavigationBarBackgroundColor ??
          this.bottomNavigationBarBackgroundColor,
      labelColor: labelColor ?? this.labelColor,
      activeNavigationBarColor:
          activeNavigationBarColor ?? this.activeNavigationBarColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      notActiveNavigationBarColor:
          notActiveNavigationBarColor ?? this.notActiveNavigationBarColor,
      shadowNavigationBarColor:
          shadowNavigationBarColor ?? this.shadowNavigationBarColor,
      linearGradientBackground:
          linearGradientBackground ?? this.linearGradientBackground,
      linearGradientBackgroundWithOpacity:
          linearGradientBackgroundWithOpacity ??
              this.linearGradientBackgroundWithOpacity,
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
      disabledButtonGradient: disabledButtonGradient,
      buttonGradient: buttonGradient,
      linearGradientBackground: linearGradientBackground,
      linearGradientBackgroundWithOpacity: linearGradientBackgroundWithOpacity,
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
      backgroundColor: Color.lerp(
            backgroundColor,
            other.backgroundColor,
            t,
          ) ??
          backgroundColor,
    );
  }
}
