import 'dart:math' as math;

import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/explore/widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final List<dynamic> _dataList = [];
  final List<dynamic> _tabInfoList = [];
  final List<Category> tabValueList = ExampleData.data;

  void _getData() {
    for (int i = 0; i < tabValueList.length; i++) {
      _dataList.add({
        'category': tabValueList[i].title,
        'items': List.generate(math.Random().nextInt(5) + 2, (index) => null),
        // 'trendingItems':
        //     List.generate(math.Random().nextInt(4) + 3, (index) => null),
        // 'articles':
        //     List.generate(math.Random().nextInt(4) + 4, (index) => null),
      });
    }
  }

  void _initTabList() {
    for (int i = 0; i < _dataList.length; i++) {
      _tabInfoList.add({
        'key': GlobalKey(),
        'label': _dataList[i]['category'],
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
    _initTabList();
    _tabController = TabController(length: _tabInfoList.length, vsync: this);
  }

  @override
  void deactivate() {
    super.deactivate();
    // Clear all pending timer before dispose()
    VisibilityDetectorController.instance.notifyNow();
  }

  @override
  Widget build(BuildContext context) {
    Widget contentList() {
      return SingleChildScrollView(
        child: Column(
          children: List.generate(_dataList.length, (index) {
            var item = _dataList[index];
            return VisibilityDetector(
              key: _tabInfoList[index]['key'] as Key,
              onVisibilityChanged: (VisibilityInfo info) {
                double screenHeight = MediaQuery.of(context).size.height;
                double visibleAreaOnScreen =
                    info.visibleBounds.bottom - info.visibleBounds.top;

                if (info.visibleFraction > 0.5 ||
                    visibleAreaOnScreen > screenHeight * 0.5) {
                  _tabController.animateTo(index);
                }
              },
              child: ListGroup(
                label: item['category'] as String,
                items: item['items'] as List<dynamic>,
                // trendingItems: item['trendingItems'] as List<dynamic>,
                // articles: item['articles'] as List<dynamic>,
              ),
            );
          }),
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        CustomHeader(
          title: 'Explore'.hardcoded,
        ),
        SliverPersistentHeader(
          delegate: _CategoryTabBarDelegate(
            controller: _tabController,
            data: _tabInfoList,
          ),
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: contentList(),
          ),
        )
      ],
    );
  }
}

class _CategoryTabBarDelegate extends SliverPersistentHeaderDelegate {
  _CategoryTabBarDelegate({
    required this.controller,
    required this.data,
  });

  final TabController controller;
  final List<dynamic> data;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: CategoryTabBar(
        controller: controller,
        data: data,
        overlapsContent: shrinkOffset / maxExtent > 0,
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
