import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HotItemsSection extends StatelessWidget {
  const HotItemsSection({
    this.imageUrlList = const [],
    this.sectionName = '',
    super.key,
  });

  final String sectionName;
  final List<dynamic> imageUrlList;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        CarouselSlider.builder(
          itemCount: (imageUrlList.length / 3).ceil(),
          itemBuilder: (context, index, realIndex) {
            final startIndex = index * 3;
            final endIndex = startIndex + 3;
            final columnImages = imageUrlList.sublist(
              startIndex,
              endIndex.clamp(0, imageUrlList.length),
            );
            return _buildHotItemsColumn(columnImages);
          },
          options: CarouselOptions(
            height: 300,
            enableInfiniteScroll: false,
            padEnds: false,
            disableCenter: true,
            pageViewKey: const PageStorageKey<String>('carousel_slider'),
          ),
        ),
      ],
    );
  }

  Widget _buildHotItemsColumn(List<dynamic> images) {
    final imageWidgets =
        images.map((url) => _buildImageCard(url as String)).toList();
    while (imageWidgets.length < 3) {
      imageWidgets.add(Container());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: imageWidgets,
    );
  }

  Widget _buildImageCard(String img) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: 4,
        color: Colors.transparent,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const ListTile(
          leading: Icon(Icons.star, color: Colors.red),
          title: Text('Title', style: TextStyle(fontSize: 20)),
          subtitle: Text('Subtitle', style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          dense: true,
          enabled: false,
          selected: true,
          selectedTileColor: Colors.blue,
        ),
      ),
    );
  }
}
