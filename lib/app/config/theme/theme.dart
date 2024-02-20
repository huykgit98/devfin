import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_colors_theme.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false) {
    _init();
  }
  late SharedPreferences prefs;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var darkMode = prefs.getBool('darkMode'.hardcoded);
    state = darkMode ?? false;
  }

  void toggle() {
    state = !state;
    prefs.setBool('darkMode'.hardcoded, state);
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);

class ThemeNotifier extends ChangeNotifier {
  // Define your default thememode here
  ThemeMode themeMode = ThemeMode.light;
  SharedPreferences? prefs;

  ThemeNotifier() {
    _init();
  }

  _init() async {
    // Get the stored theme from shared preferences
    prefs = await SharedPreferences.getInstance();

    int _theme = prefs?.getInt("theme") ?? themeMode.index;
    themeMode = ThemeMode.values[_theme];
    notifyListeners();
  }

  setTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
    // Save the selected theme using shared preferences
    prefs?.setInt("theme", mode.index);
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
          colorLabelColor: isLight ? Colors.grey : const Color(0xFF7A7FB0),
          bottomNavigationBarBackgroundColor: isLight ? Colors.blue : colorGray,
          activeNavigationBarColor: isLight ? Colors.yellow : colorOrange,
          notActiveNavigationBarColor: Colors.white,
          shadowNavigationBarColor: isLight ? Colors.blue : colorOrange,
        )
      ],
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: isLight ? Colors.yellow : colorOrange,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isLight ? Colors.blue : colorGray,
      ),
      colorScheme: base.colorScheme.copyWith(
        surface: isLight ? Colors.blue : colorGray,
        background: isLight ? Colors.white : colorGray,
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
