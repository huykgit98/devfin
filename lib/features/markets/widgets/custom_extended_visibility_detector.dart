import 'dart:async';

import 'package:devfin/common_widgets/widgets.dart';
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
          dragText: '',
          armedText: '',
          readyText: '',
          processingText: '',
          processedText: '',
          noMoreText: '',
          failedText: '',
          messageText: '',
          safeArea: false,
          pullIconBuilder: (stage, mode, status) {
            return const CircularProgressIndicator.adaptive();
          },
        ),
        footer: ClassicFooter(
          pullIconBuilder: (stage, mode, status) {
            return const CircularProgressIndicator.adaptive();
          },
          position: IndicatorPosition.locator,
          dragText: '',
          armedText: '',
          readyText: '',
          processingText: '',
          processedText: '',
          noMoreText: '',
          failedText: '',
          messageText: '',
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
