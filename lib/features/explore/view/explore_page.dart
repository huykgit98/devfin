import 'package:devfin/features/explore/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

import '../sample_data.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  final List<Category> data = ExampleData.data;

  late TabController tabController;

  late AutoScrollController autoScrollController;

  @override
  void initState() {
    tabController = TabController(length: data.length, vsync: this);
    autoScrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VerticalScrollableTabView(
      autoScrollController: autoScrollController,
      scrollbarThumbVisibility: false,
      tabController: tabController,
      listItemData: data,
      eachItemChild: (object, index) =>
          CategorySection(category: object as Category),
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text("Explore"),
            titlePadding: EdgeInsets.only(bottom: 50),
            collapseMode: CollapseMode.pin,
            background: FlutterLogo(),
          ),
          bottom: TabBar(
            isScrollable: true,
            controller: tabController,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            indicatorColor: Colors.cyan,
            labelColor: Colors.cyan,
            unselectedLabelColor: Colors.white,
            indicatorWeight: 3.0,
            tabs: data.map((e) {
              return Tab(text: e.title);
            }).toList(),
            onTap: (index) {
              VerticalScrollableTabBarStatus.setIndex(index);
            },
          ),
        ),
      ],
    );
  }
}
