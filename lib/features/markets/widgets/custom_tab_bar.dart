import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomTabBar(
      {required this.tabs, required this.tabController, this.onTap, super.key});

  final TabController tabController;
  final void Function(int)? onTap;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return GradientBackground(
      gradient: LinearGradient(
        colors: darkMode
            ? ColorsUtil.darkLinearGradient
            : ColorsUtil.lightLinearGradient,
      ),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        labelColor: darkMode ? Colors.white : Colors.black,
        indicatorColor: darkMode ? Colors.white : Colors.black,
        onTap: onTap,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
