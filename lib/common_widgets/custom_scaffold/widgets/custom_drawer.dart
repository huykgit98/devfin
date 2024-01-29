import 'package:devfin/app/app.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({required this.ref, super.key});

  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    final trackColor = MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.blueGrey.shade400;
        }
        return null;
      },
    );
    final overlayColor = MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        return null;
      },
    );

    final thumbIcon = MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.mode_night_outlined);
        }
        return const Icon(Icons.light_mode_outlined);
      },
    );

    Widget buildDrawerItem(String title, IconData icon, {VoidCallback? onTap}) {
      return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
    }

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: darkMode
                ? ColorsUtil.linearGradient
                : ColorsUtil.linearGradientLightMode,
          ),
        ),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: darkMode
                      ? ColorsUtil.linearGradient
                      : ColorsUtil.linearGradientLightMode,
                ),
              ),
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
                context.go(AppRoutes.profile);
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
              child: Text('About app.hardcoded'),
            ),
            Switch(
              thumbIcon: thumbIcon,
              value: darkMode,
              overlayColor: overlayColor,
              trackColor: trackColor,
              thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
              onChanged: (bool value) {
                ref.read(darkModeProvider.notifier).toggle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
