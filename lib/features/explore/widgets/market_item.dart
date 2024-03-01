import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class MarketItemWidget extends StatelessWidget {
  const MarketItemWidget({
    required this.marketItem,
    Key? key,
  }) : super(key: key);

  final MarketItem marketItem;

  @override
  Widget build(BuildContext context) {
    final firstThreeImages = marketItem.imageUrlList.length > 3
        ? marketItem.imageUrlList.sublist(0, 3)
        : marketItem.imageUrlList;
    final firstSixImages = marketItem.imageUrlList.length > 6
        ? marketItem.imageUrlList.sublist(0, 6)
        : marketItem.imageUrlList;
    return Column(
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
        _buildFilmStripItemsSection(context),
        _buildNewsFlowSection(context,
            imageUrlList: firstThreeImages as List<dynamic>),
        _buildFilmStripItemsSection(context, isCommunityTrends: true),
        _buildHotItemsSection(context,
            sectionName: 'Highest volume', imageUrlList: firstSixImages),
        _buildHotItemsSection(context,
            sectionName: 'Unusual volume',
            imageUrlList: firstSixImages as List<dynamic>),
        _buildHotItemsSection(context,
            sectionName: 'Gainers',
            imageUrlList: firstSixImages as List<dynamic>),
        _buildHotItemsSection(context,
            sectionName: 'Losers',
            imageUrlList: firstSixImages as List<dynamic>),
      ],
    );
  }

  Widget _buildNewsFlowSection(BuildContext context,
          {List<dynamic> imageUrlList = const []}) =>
      SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'News Flow',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.apply(fontWeightDelta: 2),
              ),
            ),
            for (var i = 0; i < imageUrlList.length; i++) ...[
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const ListTile(
                  leading: Icon(Icons.star, color: Colors.red),
                  title: Text('Title', style: TextStyle(fontSize: 20)),
                  subtitle: Text('Subtitle', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  dense: true,
                  enabled: false,
                  selected: true,
                  selectedColor: Colors.blue,
                ),
              ),
            ],
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Button pressed');
                },
                child: const Text('Keep reading '),
              ),
            ),
          ],
        ),
      );

  Widget _buildHotItemsSection(BuildContext context,
          {String sectionName = '', List<dynamic> imageUrlList = const []}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              sectionName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.apply(fontWeightDelta: 2),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 300,
              enableInfiniteScroll: false,
              padEnds: false,
              aspectRatio: 2.0,
              enlargeCenterPage: false,
              disableCenter: true,
              pageViewKey: const PageStorageKey<String>('carousel_slider'),
            ),
            items: _buildHotItemsColumns(imgUrls: imageUrlList),
          ),
        ],
      );

  List<Widget> _buildHotItemsColumns({List<dynamic> imgUrls = const []}) {
    final columns = <Widget>[];

    int numOfColumns = (imgUrls.length / 3).ceil();
    for (var i = 0; i < numOfColumns; i++) {
      final startIndex = i * 3;
      var endIndex = startIndex + 3;
      if (endIndex > imgUrls.length) {
        endIndex = imgUrls.length;
      }
      final columnImages = imgUrls.sublist(startIndex, endIndex);
      columns.add(_buildHotItemsColumn(columnImages));
    }

    return columns;
  }

  Widget _buildHotItemsColumn(List<dynamic> images) {
    final List<Widget> imageWidgets = images
        .map((url) => Container(
              height: 100,
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  leading: Icon(Icons.star, color: Colors.red),
                  title: Text('Title', style: TextStyle(fontSize: 20)),
                  subtitle: Text('Subtitle', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  dense: true,
                  enabled: false,
                  selected: true,
                  selectedColor: Colors.blue,
                ),
              ),
            ))
        .toList();

    while (imageWidgets.length < 3) {
      imageWidgets.add(Container());
    }

    return SizedBox(
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: imageWidgets,
      ),
    );
  }

  Widget _buildFilmStripItemsSection(BuildContext context,
          {bool isCommunityTrends = false}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isCommunityTrends) _buildCommunityTrendsTitle(context),
          _buildImageListView(context),
        ],
      );

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
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: marketItem.imageUrlList
              .map((img) => _buildImageCard(context, img as String))
              .toList(),
        ),
      );

  Widget _buildImageCard(BuildContext context, String img) => SizedBox(
        width: 180,
        child: Card(
          color: Colors.transparent,
          elevation: 1,
          margin: const EdgeInsets.all(12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
