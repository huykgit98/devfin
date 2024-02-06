import 'package:devfin/app/app.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_tab_bar.dart';

class CustomHeader extends ConsumerWidget {
  const CustomHeader({
    required this.tabs,
    required this.tabController,
    required this.innerBoxIsScrolled,
    super.key,
  });
  final bool innerBoxIsScrolled;
  final TabController tabController;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return SliverAppBar.medium(
      backgroundColor: Colors.transparent,
      bottom: CustomTabBar(
        tabController: tabController,
        tabs: tabs,
      ),
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.barsStaggered),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      floating: true,
      centerTitle: false,
      forceElevated: innerBoxIsScrolled,
      title: Text(
        'Markets'.hardcoded,
        style: TextStyle(color: darkMode ? Colors.white : Colors.black),
      ),
      actions: [
        _buildActionButton(
          icon: Icons.search_rounded,
          onPressed: () {},
        ),
        _buildActionButton(
          icon: Icons.chat_bubble_outline_rounded,
          onPressed: () {},
          isShowBadge: true,
        ),
        _buildActionButton(
          icon: Icons.notifications_none_rounded,
          onPressed: () {},
          isShowBadge: true,
        ),
        gapW8,
      ],
    );
  }

  Widget _buildActionButton(
      {required IconData icon,
      required void Function()? onPressed,
      bool isShowBadge = false}) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          iconSize: Sizes.p24,
          onPressed: onPressed,
        ),
        if (isShowBadge)
          Positioned(
            right: Sizes.p8,
            top: Sizes.p8,
            child: Container(
              padding: const EdgeInsets.all(Sizes.p2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(Sizes.p4),
              ),
              constraints: const BoxConstraints(
                minWidth: Sizes.p16,
                minHeight: Sizes.p16,
              ),
              child: const Text(
                '99+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.p8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
