import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  CustomTabBarDelegate({
    required this.tabs,
    this.tabAlignment,
    this.tabController,
    this.onTap,
    this.choiceChips,
  });

  final TabController? tabController;
  final void Function(int)? onTap;
  final List<Widget> tabs;
  final TabAlignment? tabAlignment;
  final CustomChoiceChips? choiceChips;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: GradientBackground(
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              isScrollable: true,
              dividerColor: Colors.transparent,
              tabAlignment: tabAlignment ?? TabAlignment.start,
              labelColor: colors.labelColor,
              indicatorColor: colors.labelColor,
              splashFactory: NoSplash.splashFactory,
              splashBorderRadius: BorderRadius.circular(100),
              onTap: onTap,
              // indicatorSize: TabBarIndicatorSize.tab,
              tabs: tabs,
            ),
            if (choiceChips != null) ...[
              const SizedBox(height: 4),
              choiceChips!,
            ]
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
