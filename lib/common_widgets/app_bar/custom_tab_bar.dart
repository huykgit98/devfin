import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomTabBar(
      {required this.tabs,
      this.tabAlignment,
      this.tabController,
      this.onTap,
      super.key});

  final TabController? tabController;
  final void Function(int)? onTap;
  final List<Widget> tabs;
  final TabAlignment? tabAlignment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return GradientBackground(
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        dividerColor: Colors.transparent,
        tabAlignment: tabAlignment ?? TabAlignment.start,
        labelColor: colors.labelColor,
        indicatorColor: colors.labelColor,
        splashFactory: NoSplash.splashFactory,
        splashBorderRadius: BorderRadius.circular(100),
        onTap: onTap,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight / 3); //remove extra spaces between tabs and appbar
}
