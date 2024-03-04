import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class FilmStripItemsSection extends StatelessWidget {
  const FilmStripItemsSection({
    required this.marketItem,
    this.isCommunityTrends = false,
    super.key,
  });

  final bool isCommunityTrends;
  final MarketItem marketItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isCommunityTrends) _buildCommunityTrendsTitle(context),
        _buildImageListView(context),
      ],
    );
  }

  Widget _buildCommunityTrendsTitle(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Text(
          'Community Trends',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.apply(fontWeightDelta: 2),
        ),
      );

  Widget _buildImageListView(BuildContext context) => SizedBox(
        height: 180,
        width: double.infinity,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: marketItem.imageUrlList.length,
            itemBuilder: (context, index) {
              return _buildImageCard(
                  context, marketItem.imageUrlList[index] as String);
            },
          ),
        ),
      );

  Widget _buildImageCard(BuildContext context, String img) => SizedBox(
        width: 180,
        child: Card(
          color: Colors.transparent,
          elevation: 1,
          margin: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: _buildCardContent(context, img),
        ),
      );

  Widget _buildCardContent(BuildContext context, String img) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(img),
          ),
          Text(
            'ALT',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.apply(fontWeightDelta: 2),
          ),
          Text(
            'ALT',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          _buildPriceRow(context),
          _buildPercentageChange(context),
        ],
      );

  Widget _buildPriceRow(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'USD',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            '180',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.apply(fontWeightDelta: 2),
          ),
        ],
      );

  Widget _buildPercentageChange(BuildContext context) => Text(
        '+ 1.71%',
        style: Theme.of(context).textTheme.titleSmall?.apply(
              color: Colors.green,
              fontWeightDelta: 2,
              fontSizeFactor: 1.2,
            ),
      );
}
