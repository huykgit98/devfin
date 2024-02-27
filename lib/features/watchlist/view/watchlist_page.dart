import 'package:devfin/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage>
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
    return SafeArea(
      child: Text('HUHUHU'),
    );
  }
}
