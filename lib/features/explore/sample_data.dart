class ExampleData {
  ExampleData._internal();

  static List<String> images = [
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
  ];

  static List<Category> data = [
    indeces,
    stocks,
    cryptoCurrencies,
    commodities,
    currencies
  ];

  static Category indeces = Category(
    title: "indeces",
    subtitle: "subtitle",
    isHotSale: true,
    items: List.generate(
      5,
      (index) {
        return Item(
          name: "701. 超人氣泡菜鍋",
          price: "200",
          comparePrice: "\$198",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category stocks = Category(
    title: "stocks",
    subtitle: "subtitle",
    isHotSale: false,
    items: List.generate(
      3,
      (index) {
        return Item(
          name: "706. 迷你原味鍋",
          price: "230",
          comparePrice: "\$250",
          imageUrl: images[index % images.length],
          isHotSale: index == 2 ? true : false,
        );
      },
    ),
  );

  static Category cryptoCurrencies = Category(
    title: "cryptoCurrencies",
    subtitle: "subtitle",
    isHotSale: false,
    items: List.generate(
      1,
      (index) {
        return Item(
          name: "經典火鍋",
          price: "258",
          comparePrice: "\$289",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category commodities = Category(
    title: "commodities",
    subtitle: "subtitle",
    isHotSale: false,
    items: List.generate(
      5,
      (index) {
        return Item(
          name: "728. 連庭素食鍋",
          price: "240",
          comparePrice: "\$300",
          imageUrl: images[index % images.length],
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );

  static Category currencies = Category(
    title: "Currencies",
    subtitle: "subtitle",
    isHotSale: false,
    items: List.generate(
      5,
      (index) {
        return Item(
          name: "728. 連庭素食鍋",
          price: "240",
          comparePrice: "\$300",
          imageUrl: images[index % images.length],
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );
}

class Category {
  String title;
  String? subtitle;
  List<Item> items;
  bool isHotSale;

  Category({
    required this.title,
    required this.subtitle,
    required this.items,
    required this.isHotSale,
  });
}

class Item {
  String name;
  String price;
  String comparePrice;
  String imageUrl;
  bool isHotSale;

  Item({
    required this.name,
    required this.price,
    required this.comparePrice,
    required this.imageUrl,
    required this.isHotSale,
  });
}
