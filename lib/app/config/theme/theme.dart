import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_colors_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    _init();
  }

  // Default theme mode
  ThemeMode themeMode = ThemeMode.light;
  SharedPreferences? prefs;

  Future<void> _init() async {
    // Get the stored theme from shared preferences
    prefs = await SharedPreferences.getInstance();

    final theme = prefs?.getInt('theme') ?? themeMode.index;
    themeMode = ThemeMode.values[theme];
    notifyListeners();
  }

  void setTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
    // Save the selected theme using shared preferences
    prefs?.setInt('theme', mode.index);
  }
}

final themeNotifierProvider =
    ChangeNotifierProvider<ThemeNotifier>((_) => ThemeNotifier());

class AppTheme {
  static bool darkMode(BuildContext context) {
    final currentBrightness = MediaQuery.of(context).platformBrightness;
    final isDark = ProviderContainer().read(themeNotifierProvider).themeMode ==
        ThemeMode.dark;
    return isDark || currentBrightness == Brightness.dark;
  }

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  static ThemeData get({required bool isLight}) {
    final base = isLight ? ThemeData.light() : ThemeData.dark();
    return base.copyWith(
      extensions: [
        CustomColorsTheme(
          disabledButtonGradient: isLight
              ? [
                  const Color(0xFFAEB3C1).withOpacity(0.3),
                  const Color(0xFF6C6A6A).withOpacity(0.3),
                  const Color(0xFFAEB3C1).withOpacity(0.3),
                ]
              : [
                  const Color(0xFF323340).withOpacity(0.3),
                  const Color(0xFF6C6A6A).withOpacity(0.3),
                  const Color(0xFF323340).withOpacity(0.3),
                ],
          buttonGradient: isLight
              ? const [
                  Color(0xFFAEB3C1),
                  Color(0xFF6C6A6A),
                  Color(0xFFAEB3C1),
                ]
              : const [
                  Color(0xFF323340),
                  Color(0xFF6C6A6A),
                  Color(0xFF323340),
                ],
          backgroundColor:
              isLight ? const Color(0xFFD3DAFD) : const Color(0xFF121212),
          labelColor: isLight ? Colors.black : Colors.white,
          bottomNavigationBarBackgroundColor: Colors.transparent,
          activeNavigationBarColor: isLight ? Colors.black87 : Colors.white,
          notActiveNavigationBarColor:
              isLight ? Colors.black54 : Colors.white54,
          shadowNavigationBarColor: isLight ? Colors.blue : Colors.white54,
          linearGradientBackground: isLight
              ? const [
                  Color(0xFF6BB3FF),
                  Color(0xFFD3DAFD),
                ]
              : const [
                  Color(0xFF0c355a),
                  Color(0xFF121212),
                ],
          linearGradientBackgroundWithOpacity: isLight
              ? [
                  const Color(0xFF6BB3FF).withOpacity(0.5),
                  const Color(0xFFD3DAFD).withOpacity(0.5),
                ]
              : [
                  const Color(0xFF0c355a).withOpacity(0.5),
                  const Color(0xFF121212).withOpacity(0.5),
                ],
          loadingIndicatorGradient: const [
            Color(0xFF0695FF),
            Color(0xFFA334FA),
            Color(0xFFFF6968),
          ],
          customLoadingGradient: const [
            Color(0xFFFF0069),
            Color(0xFFFED602),
            Color(0xFF7639FB),
            Color(0xFFD500C5),
            Color(0xFFFF7A01),
            Color(0xFFFF0069),
          ],
        ),
      ],
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: isLight ? Colors.black : Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isLight ? Colors.blue : const Color(0xff021a2c),
      ),
      colorScheme: base.colorScheme.copyWith(
        surface: isLight ? const Color(0xFF6BB3FF) : const Color(0xff021a2c),
        background: isLight ? Colors.white : const Color(0xff021a2c),
      ),

      splashColor: Platform.isIOS ? Colors.transparent : null,
      // highlightColor: Platform.isIOS ? Colors.transparent : null,
      // hoverColor: Platform.isIOS ? Colors.transparent : null,
    );
  }
}
