import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MarketsPage extends ConsumerStatefulWidget {
  const MarketsPage({super.key});

  @override
  ConsumerState<MarketsPage> createState() => _MarketsPageState();
}

class _MarketsPageState extends ConsumerState<MarketsPage>
    with AutomaticKeepAliveClientMixin<MarketsPage> {
  final List<Category> tabValueList = ExampleData.data;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
              tabs: tabValueList.map(
                (e) {
                  return Tab(
                    child: Text(
                      e.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ).toList(),
              choiceChips: CustomChoiceChips(
                choices: const [
                  'All',
                  'Stocks',
                  'ETFs',
                  'Funds',
                  'Cryptos',
                  'ABC',
                  'XYA'
                ],
                onSelected: (bool selected) {
                  print('selected');
                },
              ),
            ),
          ),
        ],
        body: TabBarView(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => SymbolItem(
                      onTap: () {
                        final symbolId = 'AAPL';
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
                              '\$182.45',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              children: const [
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
                    itemBuilder: (context, index) => SymbolItem(
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
                              children: const [
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
            ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  'Tab 3 content $index',
                ),
              ),
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

  @override
  bool get wantKeepAlive => true;
}
