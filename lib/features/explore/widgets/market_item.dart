import 'package:devfin/features/explore/widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class MarketItemWidget extends StatelessWidget {
  const MarketItemWidget({
    required this.marketItem,
    required this.id,
    super.key,
  });

  final MarketItem marketItem;
  final String id;

  @override
  Widget build(BuildContext context) {
    print('MarketItemWidget rebuild: $id');
    //Replace this when the model is updated
    final firstThreeImages = marketItem.imageUrlList.length > 3
        ? marketItem.imageUrlList.sublist(0, 3)
        : marketItem.imageUrlList;
    final firstSixImages = marketItem.imageUrlList.length > 6
        ? marketItem.imageUrlList.sublist(0, 6)
        : marketItem.imageUrlList;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              marketItem.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(fontWeightDelta: 2),
            ),
          ),
          FilmStripItemsSection(
            marketItem: marketItem,
          ),
          NewsFlowSection(
            imageUrlList: firstThreeImages,
          ),
          FilmStripItemsSection(
            marketItem: marketItem,
            isCommunityTrends: true,
          ),
          HotItemsSection(
            sectionName: 'Highest volume'.hardcoded,
            imageUrlList: firstSixImages,
          ),
          HotItemsSection(
            sectionName: 'Unusual volume'.hardcoded,
            imageUrlList: firstSixImages,
          ),
          HotItemsSection(
            sectionName: 'Gainers'.hardcoded,
            imageUrlList: firstSixImages,
          ),
          HotItemsSection(
            sectionName: 'Losers'.hardcoded,
            imageUrlList: firstSixImages,
          ),
        ],
      ),
    );
  }
}
