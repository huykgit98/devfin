import 'package:devfin/common_widgets/widgets.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';

class CustomTabBarViewItem extends StatelessWidget {
  const CustomTabBarViewItem({
    required this.uniqueKey,
    this.itemCount,
    super.key,
  });
  final Key uniqueKey;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return ExtendedVisibilityDetector(
      uniqueKey: uniqueKey,
      child: AutomaticKeepAlive(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const SkeletonItem();
                },
                childCount: itemCount,
              ),
            ),
            const FooterLocator.sliver(),
          ],
        ),
      ),
    );
  }
}
