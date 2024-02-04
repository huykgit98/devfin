import 'dart:async';

import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';

class CustomExtendedVisibilityDetector extends StatelessWidget {
  const CustomExtendedVisibilityDetector({
    required this.tabKey,
    required this.items,
    super.key,
    this.onRefresh,
    this.onLoad,
  });
  final String tabKey;
  final List<dynamic> items;
  final FutureOr<dynamic> Function()? onRefresh;
  final FutureOr<dynamic> Function()? onLoad;

  @override
  Widget build(BuildContext context) {
    return ExtendedVisibilityDetector(
      uniqueKey: Key(tabKey),
      child: EasyRefresh(
        header: ClassicHeader(
          dragText: 'Pull to refresh'.hardcoded,
          armedText: 'Release ready'.hardcoded,
          readyText: 'Refreshing...'.hardcoded,
          processingText: 'Refreshing...'.hardcoded,
          processedText: 'Succeeded'.hardcoded,
          noMoreText: 'No more'.hardcoded,
          failedText: 'Failed'.hardcoded,
          messageText: 'Last updated at %T'.hardcoded,
          safeArea: false,
        ),
        footer: ClassicFooter(
          position: IndicatorPosition.locator,
          dragText: 'Pull to load'.hardcoded,
          armedText: 'Release ready'.hardcoded,
          readyText: 'Loading...'.hardcoded,
          processingText: 'Loading...'.hardcoded,
          processedText: 'Succeeded'.hardcoded,
          noMoreText: 'No more'.hardcoded,
          failedText: 'Failed'.hardcoded,
          messageText: 'Last updated at %T'.hardcoded,
        ),
        onRefresh: onRefresh,
        onLoad: onLoad,
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return const SkeletonItem();
            }, childCount: items.length)),
            const FooterLocator.sliver(),
          ],
        ),
      ),
    );
  }
}
