import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  late SharedPreferences prefs;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var darkMode = prefs.getBool('darkMode'.hardcoded);
    state = darkMode ?? false;
  }

  DarkModeNotifier() : super(false) {
    _init();
  }

  void toggle() {
    state = !state;
    prefs.setBool('darkMode'.hardcoded, state);
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);
