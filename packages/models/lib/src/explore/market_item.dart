/// Summarized information of a Market item.
class MarketItem {
  MarketItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.imageUrlList,
  });

  factory MarketItem.fromJson(Map<String, dynamic> json) => MarketItem(
        id: json['id'] as int,
        name: json['name'] as String,
        imageUrl: json['image_url'] as String,
        imageUrlList: [
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
          json['image_url'],
        ],
      );

  final int id;
  final String name;
  final String imageUrl;
  final List<dynamic> imageUrlList;
}
