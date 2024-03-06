import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/watchlist/widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:models/models.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage>
    with SingleTickerProviderStateMixin {
  List<SymbolItem> watchlist1 = ExampleData.cryptoItems.sublist(0, 5);
  List<SymbolItem> watchlist2 = ExampleData.cryptoItems.sublist(3, 8);
  late List<dynamic> watchlist;

  late AutoScrollController scrollController;
  late TabController tabController;
  final double collapsedHeight = kToolbarHeight;
  final listViewKey = RectGetter.createGlobalKey();

  Map<int, dynamic> itemKeys = {};

  // prevent animate when press on tab bar
  bool pauseRectGetterIndex = false;

  @override
  void initState() {
    scrollController = AutoScrollController();
    watchlist = [watchlist1, watchlist2];
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  List<int> getVisibleItemsIndex() {
    final rect = RectGetter.getRectFromKey(listViewKey);
    final items = <int>[];
    if (rect == null) return items;
    itemKeys.forEach((index, key) {
      final itemRect =
          RectGetter.getRectFromKey(key as GlobalKey<RectGetterState>);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;
    final lastTabIndex = tabController.length - 1;
    final visibleItems = getVisibleItemsIndex();

    final reachLastTabIndex = visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else if (visibleItems.isNotEmpty) {
      final sumIndex = visibleItems.reduce((value, element) => value + element);
      final middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex) {
        tabController.animateTo(middleIndex);
      }
    }
    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }

  @override
  Widget build(BuildContext context) {
    return RectGetter(
      key: listViewKey,
      child: NotificationListener<ScrollNotification>(
        onNotification: onScrollNotification,
        child: ScrollConfiguration(
          behavior: _ScrollbarBehavior(),
          child: buildSliverScrollView(),
        ),
      ),
    );
  }

  Widget buildSliverScrollView() {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        CustomHeader(
          title: 'Watchlist'.hardcoded,
        ),
        _buildBody(),
      ],
    );
  }

  Widget _buildBody() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => buildCategoryItem(index),
        childCount: watchlist.length,
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    itemKeys[index] = RectGetter.createGlobalKey();
    final item = watchlist[index] as List<SymbolItem>;
    return RectGetter(
      key: itemKeys[index] as GlobalKey<RectGetterState>,
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: scrollController,
        child: WatchlistItem(
          watchlistName: 'Watchlist ${index + 1}',
          watchlist: item,
        ),
      ),
    );
  }
}

class _ScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return PlatformScrollbar(controller: details.controller, child: child);
  }
}
