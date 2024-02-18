import 'package:devfin/app/app.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomBottomAppBar extends ConsumerWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: darkMode
              ? ColorsUtil.darkLinearGradient
              : ColorsUtil.lightLinearGradient,
        ),
      ),
      child: NavigationBar(
        onDestinationSelected: (int idx) => _onItemTapped(idx, context),
        height: 70,
        indicatorColor: darkMode ? Colors.white : Colors.grey.shade400,
        backgroundColor: Colors.transparent,
        selectedIndex: _calculateSelectedIndex(context),
        // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon:
                const Icon(Icons.bar_chart_rounded, color: Colors.black),
            icon: const Icon(Icons.bar_chart_rounded),
            label: 'Markets'.hardcoded,
          ),
          NavigationDestination(
            selectedIcon:
                const Icon(Icons.explore_rounded, color: Colors.black),
            icon: const Icon(Icons.explore_rounded),
            label: 'Explore'.hardcoded,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.star_rounded, color: Colors.black),
            icon: const Icon(Icons.star_rounded),
            label: 'Watchlist'.hardcoded,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.person_rounded, color: Colors.black),
            icon: const Icon(Icons.person_rounded),
            label: 'Profile'.hardcoded,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (ScaffoldTab.values[index]) {
      case ScaffoldTab.markets:
        context.go(AppRoutes.markets);
      case ScaffoldTab.explore:
        context.go(AppRoutes.explore);
      case ScaffoldTab.watchlist:
        context.go(AppRoutes.watchlist);
      case ScaffoldTab.profile:
        context.go(AppRoutes.profile);
    }
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRoutes.markets)) {
      return ScaffoldTab.markets.index;
    }
    if (location.startsWith(AppRoutes.explore)) {
      return ScaffoldTab.explore.index;
    }
    if (location.startsWith(AppRoutes.watchlist)) {
      return ScaffoldTab.watchlist.index;
    }
    if (location.startsWith(AppRoutes.profile)) {
      return ScaffoldTab.profile.index;
    }
    return 0;
  }
}
