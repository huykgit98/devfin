import 'package:devfin/features/explore/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../../../common_widgets/scrollable_list_tab_scroller.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  List<MarketItem> markets = [
    MarketItem(
      id: DateTime.now().microsecondsSinceEpoch,
      name: 'Indices',
      imageUrl: 'https://picsum.photos/200',
      imageUrlList: [
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
      ],
    ),
    MarketItem(
      id: DateTime.now().microsecondsSinceEpoch,
      name: 'Stocks',
      imageUrl: 'https://picsum.photos/200',
      imageUrlList: [
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
      ],
    ),
    MarketItem(
      id: DateTime.now().microsecondsSinceEpoch,
      name: 'Crypto Currencies',
      imageUrl: 'https://picsum.photos/200',
      imageUrlList: [
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
      ],
    ),
    MarketItem(
      id: DateTime.now().microsecondsSinceEpoch,
      name: 'Commodities',
      imageUrl: 'https://picsum.photos/200',
      imageUrlList: [
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
      ],
    ),
    MarketItem(
      id: DateTime.now().microsecondsSinceEpoch,
      name: 'Currencies',
      imageUrl: 'https://picsum.photos/200',
      imageUrlList: [
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
      ],
    ),
  ];
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollableListTabScroller(
        tabBuilder: (BuildContext context, int scrollIndex, bool active) =>
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            markets.elementAt(scrollIndex).name,
            style: !active
                ? null
                : const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        itemCount: markets.length,
        itemBuilder: (BuildContext context, int scrollIndex) =>
            MarketItemWidget(
          marketItem: markets.elementAt(scrollIndex),
        ),
      ),
    );
  }
}
