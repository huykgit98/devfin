class ExampleData {
  ExampleData._internal();

  static List<String> images = [
    "https://s2.coinmarketcap.com/static/img/coins/128x128/1.png",
    "https://s2.coinmarketcap.com/static/img/coins/128x128/1027.png",
    "https://s2.coinmarketcap.com/static/img/coins/128x128/2.png",
    "https://s2.coinmarketcap.com/static/img/coins/128x128/1028.png",
    "https://s2.coinmarketcap.com/static/img/coins/128x128/1029.png",
  ];

  static List<Category> data = [
    indices,
    stocks,
    cryptoCurrencies,
    commodities,
    currencies
  ];

  static Category indices = Category(
    title: "Indices",
    subtitle: "subtitle",
    isHotSale: true,
    items: List.generate(
      5,
      (index) {
        return Item(
          name: "FLC",
          price: "200",
          comparePrice: "\$198",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category stocks = Category(
    title: "Stocks",
    subtitle: "subtitle",
    isHotSale: false,
    items: List.generate(
      3,
      (index) {
        return Item(
          name: "DXG",
          price: "230",
          comparePrice: "\$250",
          imageUrl: images[index % images.length],
          isHotSale: index == 2 ? true : false,
        );
      },
    ),
  );

  static Category cryptoCurrencies = Category(
    title: "CryptoCurrencies",
    subtitle: "subtitle",
    isHotSale: false,
    items: List.generate(
      1,
      (index) {
        return Item(
          name: "VNINDEX",
          price: "258",
          comparePrice: "\$289",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category commodities = Category(
    title: "Commodities",
    subtitle: "subtitle",
    isHotSale: false,
    items: List.generate(
      5,
      (index) {
        return Item(
          name: "VCG",
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
          name: "BITCOIN",
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
