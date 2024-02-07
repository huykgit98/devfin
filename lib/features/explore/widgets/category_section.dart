import 'package:devfin/app/app.dart';
import 'package:devfin/features/explore/sample_data.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    required this.category,
    super.key,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      margin: const EdgeInsets.only(bottom: Sizes.p16),
      // color: Colors.cyanAccent.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTileHeader(context),
          _buildItemTileList(context),
        ],
      ),
    );
  }

  Widget _buildItemTileList(BuildContext context) {
    return Column(
      children: List.generate(
        category.items.length,
        (index) {
          final item = category.items[index];
          bool isLastIndex = index == category.items.length - 1;
          return _buildItemTile(
            item: item,
            context: context,
            isLastIndex: isLastIndex,
          );
        },
      ),
    );
  }

  Widget _buildSectionTileHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Sizes.p16),
        _sectionTitle(context),
        const SizedBox(height: Sizes.p8),
        if (category.subtitle != null)
          _sectionSubtitle(context)
        else
          const SizedBox(),
        const SizedBox(height: Sizes.p16),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context) {
    return Row(
      children: [
        Text(
          category.title,
        )
      ],
    );
  }

  Widget _sectionSubtitle(BuildContext context) {
    return Text(
      category.subtitle!,
    );
  }

  Widget _buildItemTile({
    required BuildContext context,
    required bool isLastIndex,
    required Item item,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItemDetail(item: item, context: context),
            _buildItemImage(item.imageUrl),
          ],
        ),
        if (!isLastIndex)
          const Divider(height: Sizes.p16)
        else
          const SizedBox(height: Sizes.p8)
      ],
    );
  }

  Widget _buildItemImage(String url) {
    return FadeInImage.assetNetwork(
      placeholder: Assets.icons.appIconDarkNoBackground.path,
      image: url,
      width: Sizes.p64,
    );
  }

  Widget _buildItemDetail({
    required BuildContext context,
    required Item item,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.name),
        const SizedBox(height: Sizes.p16),
        Row(
          children: [
            Text(
              "HUHUHU${item.price} ",
            ),
            Text(
              item.comparePrice,
            ),
            const SizedBox(width: Sizes.p8),
          ],
        ),
      ],
    );
  }
}
