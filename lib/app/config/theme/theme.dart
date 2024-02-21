import 'dart:io' show Platform;

import 'package:devfin/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static HexColor colorOrange = HexColor('#FFA400');
  static HexColor colorGray = HexColor('#373A36');

  static ThemeData get({required bool isLight}) {
    final base = isLight ? ThemeData.light() : ThemeData.dark();
    return base.copyWith(
      extensions: [
        CustomColorsTheme(
          labelColor: isLight ? Colors.black : Colors.white,
          bottomNavigationBarBackgroundColor: Colors.transparent,
          activeNavigationBarColor: isLight ? Colors.black87 : Colors.white,
          notActiveNavigationBarColor:
              isLight ? Colors.black54 : Colors.white54,
          shadowNavigationBarColor: isLight ? Colors.blue : colorOrange,
          linearGradientBackground: isLight
              ? const [
                  Color(0xFF6BB3FF),
                  Color(0xFFD3DAFD),
                ]
              : const [
                  Color(0xFF0c355a),
                  Color(0xFF121212),
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
        backgroundColor: isLight ? Colors.blue : colorGray,
      ),
      colorScheme: base.colorScheme.copyWith(
        surface: isLight ? Colors.blue : colorGray,
        background: isLight ? Colors.white : colorGray,
      ),
      splashColor: Platform.isIOS ? Colors.transparent : null,
      // highlightColor: Platform.isIOS ? Colors.transparent : null,
      // hoverColor: Platform.isIOS ? Colors.transparent : null,
    );
  }
}

class HexColor extends Color {
  HexColor(String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
