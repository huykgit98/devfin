import 'package:devfin/app/app.dart';
import 'package:devfin/features/sign_up/sign_up.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    required this.darkMode,
    required this.selectedTab,
    super.key,
  });

  final bool darkMode;
  final ScaffoldTab selectedTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: darkMode
              ? ColorsUtil.darkLinearGradient
              : ColorsUtil.lightLinearGradient,
        ),
      ),
      child: NavigationBar(
        onDestinationSelected: (int idx) {
          switch (ScaffoldTab.values[idx]) {
            case ScaffoldTab.markets:
              context.go(AppRoutes.markets);
            case ScaffoldTab.explore:
              context.go(AppRoutes.explore);
            case ScaffoldTab.watchlist:
              context.go(AppRoutes.watchlist);
            case ScaffoldTab.profile:
              SignUpSheet.show(context, darkMode);
              context.go(AppRoutes.profile);
          }
        },
        height: 70,
        indicatorColor: darkMode ? Colors.white : Colors.grey.shade400,
        backgroundColor: Colors.transparent,
        selectedIndex: selectedTab.index,
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
}
