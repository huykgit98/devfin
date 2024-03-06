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

  final SymbolItem marketItem;
  final String id;

  @override
  Widget build(BuildContext context) {
    print('MarketItemWidget rebuild: $id');
    //Replace this when the model is updated
    final firstThreeImages = [''];
    final firstSixImages = [''];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              'asd',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(fontWeightDelta: 2),
            ),
          ),
          FilmStripItemsSection(),
          NewsFlowSection(
            imageUrlList: firstThreeImages,
          ),
          FilmStripItemsSection(
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
