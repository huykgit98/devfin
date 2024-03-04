import 'package:carousel_slider/carousel_slider.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
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
            height: 250,
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
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.hardEdge,
      child: SymbolItem(
        onTap: () {
          final symbolId = 'AAPL';
          // context.push('${AppRoutes.markets}/$symbolId');
        },
        icons: Icons.apple,
        title: 'AAPL'.hardcoded,
        subtitle: 'Apple Inc.'.hardcoded,
        subtitleMaxLine: 1,
        trailing: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: Colors.teal.withOpacity(0.1),
          ),
          padding: const EdgeInsets.all(5),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                r'$182.45',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                children: [
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
    );
  }
}
