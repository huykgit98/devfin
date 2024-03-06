import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:models/models.dart';

class MarketsPage extends ConsumerStatefulWidget {
  const MarketsPage({super.key});

  @override
  ConsumerState<MarketsPage> createState() => _MarketsPageState();
}

class _MarketsPageState extends ConsumerState<MarketsPage>
    with SingleTickerProviderStateMixin<MarketsPage> {
  late List<String> tabValueList;
  late TabController _tabController;
  late int tabIndex = 0;
  late List<MarketsFilterItem> marketsFilterItems;
  late List<SymbolItem> cryptoItems;

  @override
  void initState() {
    super.initState();
    tabValueList = ExampleData.tabValueList;
    marketsFilterItems = ExampleData.marketsFilterItems;
    cryptoItems = ExampleData.cryptoItems;

    _tabController = TabController(
      length: tabValueList.length,
      vsync: this,
    );

    // Add listener to update tabIndex when tab is changed
    _tabController.addListener(() {
      setState(() {
        tabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabValueList.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomHeader(
            innerBoxIsScrolled: innerBoxIsScrolled,
            title: 'Markets'.hardcoded,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomTabBarDelegate(
              tabController: _tabController,
              tabs: tabValueList.map(
                (e) {
                  return Tab(
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ).toList(),
              onTap: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              choiceChips: CustomChoiceChips(
                choices: marketsFilterItems[tabIndex].filterList,
                onSelected: (bool selected) {
                  print('selected');
                },
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => SymbolItemWidget(
                      onTap: () {
                        const symbolId = 'AAPL';
                        context.push('${AppRoutes.markets}/$symbolId');
                      },
                      icons: Icons.apple,
                      title: 'AAPL'.hardcoded,
                      subtitle: 'Apple Inc.'.hardcoded,
                      subtitleMaxLine: 1,
                      trailing: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.teal.withOpacity(0.1),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              r'$182.45',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.green,
                                  size: 16,
                                ),
                                Text(
                                  '1.23%',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 0,
                        indent: 0,
                        thickness: 1,
                      );
                    },
                    itemCount: 100,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => SymbolItemWidget(
                      onTap: () {},
                      icons: Icons.apple,
                      title: 'AAPL'.hardcoded,
                      subtitle: 'Apple Inc.'.hardcoded,
                      subtitleMaxLine: 1,
                      trailing: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.redAccent.withOpacity(0.1),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$182.45',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              children: [
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.redAccent,
                                  size: 16,
                                ),
                                Text(
                                  '1.23%',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 0,
                        indent: 0,
                        thickness: 1,
                      );
                    },
                    itemCount: 100,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final item = cryptoItems[index];
                      return SymbolItemWidget(
                        onTap: () {
                          final symbolId = item.name;
                          context.push('${AppRoutes.markets}/$symbolId');
                        },
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              CachedNetworkImageProvider(item.imageUrl),
                        ),
                        title: item.name,
                        subtitle: item.description,
                        subtitleMaxLine: 1,
                        trailing: Container(
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: item.increase
                                ? Colors.teal.withOpacity(0.1)
                                : Colors.redAccent.withOpacity(0.1),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.price,
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      item.increase ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Wrap(
                                children: [
                                  Icon(
                                    item.increase
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    color: item.increase
                                        ? Colors.green
                                        : Colors.red,
                                    size: 16,
                                  ),
                                  Text(
                                    '${item.symbolChange}%',
                                    style: TextStyle(
                                      color: item.increase
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 0,
                        indent: 0,
                        thickness: 1,
                      );
                    },
                    itemCount: cryptoItems.length,
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  'Tab 4 content $index',
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  'Tab 5 content $index',
                ),
              ),
            ),
          ],
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
