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
    items: List.generate(
      5,
      (index) {
        return Item(
          name: "FLC",
          price: "200",
          comparePrice: "\$198",
          imageUrl: images[index % images.length],
        );
      },
    ),
    trendingItems: List.generate(
      5,
      (index) {
        return TrendingItem(
          title: "BITCOIN",
          subtitle: "BITCOIN",
          price: "240",
          currency: "\$",
          imageUrl: images[index % images.length],
          symbolChange: '+${index / 1.2}%',
        );
      },
    ),
    articles: List.generate(
      5,
      (index) {
        return Article(
          title:
              "Coinbase Records Major BTC Withdrawal as Bitcoin Price Stands",
          date: "3 hours ago",
          sources: "Reuters",
        );
      },
    ),
  );

  static Category stocks = Category(
    title: "Stocks",
    subtitle: "subtitle",
    items: List.generate(
      3,
      (index) {
        return Item(
          name: "DXG",
          price: "230",
          comparePrice: "\$250",
          imageUrl: images[index % images.length],
        );
      },
    ),
    trendingItems: List.generate(
      5,
      (index) {
        return TrendingItem(
          title: "BITCOIN",
          subtitle: "BITCOIN",
          price: "240",
          currency: "\$",
          imageUrl: images[index % images.length],
          symbolChange: '+${index / 1.2}%',
        );
      },
    ),
    articles: List.generate(
      5,
      (index) {
        return Article(
          title:
              "Coinbase Records Major BTC Withdrawal as Bitcoin Price Stands",
          date: "3 hours ago",
          sources: "Reuters",
        );
      },
    ),
  );

  static Category cryptoCurrencies = Category(
    title: "CryptoCurrencies",
    subtitle: "subtitle",
    items: List.generate(
      1,
      (index) {
        return Item(
          name: "VNINDEX",
          price: "258",
          comparePrice: "\$289",
          imageUrl: images[index % images.length],
        );
      },
    ),
    trendingItems: List.generate(
      5,
      (index) {
        return TrendingItem(
          title: "BITCOIN",
          subtitle: "BITCOIN",
          price: "240",
          currency: "\$",
          imageUrl: images[index % images.length],
          symbolChange: '+${index / 1.2}%',
        );
      },
    ),
    articles: List.generate(
      5,
      (index) {
        return Article(
          title:
              "Coinbase Records Major BTC Withdrawal as Bitcoin Price Stands",
          date: "3 hours ago",
          sources: "Reuters",
        );
      },
    ),
  );

  static Category commodities = Category(
    title: 'Commodities',
    subtitle: 'subtitle',
    items: List.generate(
      5,
      (index) {
        return Item(
          name: "VCG",
          price: "240",
          comparePrice: "\$300",
          imageUrl: images[index % images.length],
        );
      },
    ),
    trendingItems: List.generate(
      5,
      (index) {
        return TrendingItem(
          title: "BITCOIN",
          subtitle: "BITCOIN",
          price: "240",
          currency: "\$",
          imageUrl: images[index % images.length],
          symbolChange: '+0.5%',
        );
      },
    ),
    articles: List.generate(
      5,
      (index) {
        return Article(
          title:
              "Coinbase Records Major BTC Withdrawal as Bitcoin Price Stands",
          date: "3 hours ago",
          sources: "Reuters",
        );
      },
    ),
  );

  static Category currencies = Category(
    title: "Currencies",
    subtitle: "subtitle",
    items: List.generate(
      5,
      (index) {
        return Item(
          name: "BITCOIN",
          price: "240",
          comparePrice: "\$300",
          imageUrl: images[index % images.length],
        );
      },
    ),
    trendingItems: List.generate(
      5,
      (index) {
        return TrendingItem(
          title: "BITCOIN",
          subtitle: "BITCOIN",
          price: "240",
          currency: "\$",
          imageUrl: images[index % images.length],
          symbolChange: '+${index / 1.2}%',
        );
      },
    ),
    articles: List.generate(
      5,
      (index) {
        return Article(
          title:
              "Coinbase Records Major BTC Withdrawal as Bitcoin Price Stands",
          date: "3 hours ago",
          sources: "Reuters",
        );
      },
    ),
  );
}

class Category {
  Category(
      {required this.title,
      required this.subtitle,
      required this.items,
      required this.trendingItems,
      this.articles = const []});
  String title;
  String? subtitle;
  List<Item> items;
  List<TrendingItem> trendingItems;
  List<Article> articles;
}

class TrendingItem {
  TrendingItem(
      {required this.title,
      required this.price,
      required this.subtitle,
      required this.imageUrl,
      required this.currency,
      required this.symbolChange});
  String title;
  String subtitle;
  String price;
  String imageUrl;
  String currency;
  String symbolChange;
}

class Item {
  Item({
    required this.name,
    required this.price,
    required this.comparePrice,
    required this.imageUrl,
  });
  String name;
  String price;
  String comparePrice;
  String imageUrl;
}

class Article {
  Article({
    required this.title,
    required this.date,
    required this.sources,
  });
  String title;
  String date;
  String sources;
}
