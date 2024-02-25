import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SymbolDetailsPage extends StatefulWidget {
  const SymbolDetailsPage() : super();

  @override
  _SymbolDetailsPageState createState() => _SymbolDetailsPageState();
}

class _SymbolDetailsPageState extends State<SymbolDetailsPage>
    with AutomaticKeepAliveClientMixin<SymbolDetailsPage> {
  final List<String> tabValueList = [
    'Overview',
    'Chart',
    'News',
  ];

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

    return Material(
      child: GradientBackground(
        child: DefaultTabController(
          length: tabValueList.length,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                shadowColor: Colors.black12.withOpacity(0.5),
                foregroundColor: colors.labelColor,
                collapsedHeight: 60,
                pinned: true,
                centerTitle: true,
                title: Text(
                  'AAPL'.hardcoded,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                flexibleSpace: const GradientBackground(),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () {},
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_active_outlined),
                    onPressed: () {},
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                  ),
                  IconButton(
                    icon: const Icon(Icons.star_border_outlined),
                    onPressed: () {},
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                  ),
                ],
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: CustomTabBarDelegate(
                  tabAlignment: TabAlignment.center,
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
                ),
              ),
            ],
            body: TabBarView(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [],
                ),
                SizedBox(
                  height: 600,
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                        url: WebUri(
                            'https://www.tradingview.com/chart/?symbol=AAPL')),
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      'News Tab content $index',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
