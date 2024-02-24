import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/explore/sample_data.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return DefaultTabController(
      length: tabValueList.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomHeader(
            innerBoxIsScrolled: innerBoxIsScrolled,
            title: 'Markets'.hardcoded,
            bottom: CustomTabBar(
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
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        'Tab 1 content $index',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  'Tab 2 content $index',
                ),
              ),
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
