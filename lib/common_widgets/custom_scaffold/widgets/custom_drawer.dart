import 'package:devfin/app/app.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    final notifier = ref.watch(themeNotifierProvider);

    Widget buildDrawerItem(String title, IconData icon, {VoidCallback? onTap}) {
      return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
    }

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: darkMode
                ? ColorsUtil.darkLinearGradient
                : ColorsUtil.lightLinearGradient,
          ),
        ),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(),
              accountName: Text(
                'Huy Nguyen'.hardcoded,
              ),
              accountEmail: Text(
                'huykgit98@gmail.com'.hardcoded,
              ),
              currentAccountPicture: const FlutterLogo(),
            ),
            buildDrawerItem(
              'Markets'.hardcoded,
              Icons.bar_chart_rounded,
              onTap: () {
                context.go(AppRoutes.markets);
                Navigator.pop(context);
              },
            ),
            buildDrawerItem(
              'Explore'.hardcoded,
              Icons.explore_rounded,
              onTap: () {
                context.go(AppRoutes.explore);
                Navigator.pop(context);
              },
            ),
            buildDrawerItem(
              'Watchlist'.hardcoded,
              Icons.star_rounded,
              onTap: () {
                context.go(AppRoutes.watchlist);
                Navigator.pop(context);
              },
            ),
            buildDrawerItem(
              'Profile'.hardcoded,
              Icons.person_rounded,
              onTap: () {
                context.go(AppRoutes.settings);
                Navigator.pop(context);
              },
            ),
            buildDrawerItem(
              'Messages'.hardcoded,
              Icons.chat_bubble_rounded,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            buildDrawerItem(
              'Notifications'.hardcoded,
              Icons.notifications_active_rounded,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            buildDrawerItem(
              'Sign Out'.hardcoded,
              Icons.logout_rounded,
              onTap: () {},
            ),
            AboutListTile(
              icon: Icon(
                Icons.info,
              ),
              applicationIcon: Icon(
                Icons.local_play_rounded,
              ),
              applicationName: 'DevFin - Track All Markets'.hardcoded,
              applicationVersion: '1.0.25'.hardcoded,
              applicationLegalese: '© 2023 NeganDev'.hardcoded,
              aboutBoxChildren: [
                ///Content goes here...
              ],
              child: Text('About app'.hardcoded),
            ),
            _singleTile('Dark Theme'.hardcoded, ThemeMode.dark, notifier),
            _singleTile('Light Theme'.hardcoded, ThemeMode.light, notifier),
            _singleTile('System Theme'.hardcoded, ThemeMode.system, notifier),
          ],
        ),
      ),
    );
  }

  Widget _singleTile(String title, ThemeMode mode, ThemeNotifier notifier) {
    return RadioListTile<ThemeMode>.adaptive(
        value: mode,
        title: Text(title),
        groupValue: notifier.themeMode,
        onChanged: (val) {
          if (val != null) notifier.setTheme(val);
        });
  }
}
