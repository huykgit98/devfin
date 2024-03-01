import 'package:devfin/features/explore/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:models/models.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  ItemScrollController _itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollConfiguration(
        behavior: _ScrollbarBehavior(),
        child: ScrollablePositionedList.builder(
          itemScrollController: _itemScrollController,
          itemCount: markets.length,
          itemBuilder: (context, index) {
            return MarketItemWidget(
              marketItem: markets[index],
            );
          },
        ),
      ),
    );
  }
}

class _ScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return PlatformScrollbar(child: child, controller: details.controller);
  }
}
