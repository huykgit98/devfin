import 'package:models/models.dart';

class ExampleData {
  ExampleData._internal();

  static List<String> tabValueList = [
    "Indices",
    "Stocks",
    "CryptoCurrencies",
    "Commodities",
    "Currencies",
  ];
  static List<MarketsFilterItem> marketsFilterItems = [
    MarketsFilterItem(
      id: 0,
      name: 'Indices',
      filterList: [
        'Vietnam',
        'United States',
      ],
    ),
    MarketsFilterItem(
      id: 1,
      name: 'Stocks',
      filterList: [
        'Vietnam',
        'United States',
      ],
    ),
    MarketsFilterItem(
      id: 2,
      name: 'CryptoCurrencies',
      filterList: ['Trending', 'New Listing', 'Top Gainer', 'Top Volume'],
    ),
    MarketsFilterItem(
      id: 3,
      name: 'Commodities',
      filterList: [],
    ),
    MarketsFilterItem(
      id: 4,
      name: 'Currencies',
      filterList: [],
    ),
  ];

  static List<SymbolItem> cryptoItems = [
    SymbolItem(
      id: 1,
      name: 'PEPE',
      price: r'$0.000000612',
      description: 'Pepe',
      imageUrl: 'https://s2.coinmarketcap.com/static/img/coins/64x64/24478.png',
      symbolChange: 12.2,
      increase: true,
    ),
    SymbolItem(
      id: 2,
      name: 'BTC',
      price: r'$69,012.05',
      description: 'Bitcoin',
      imageUrl:
          'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20201110/87496d50-2408-43e1-ad4c-78b47b448a6a.png',
      symbolChange: 6.4,
      increase: false,
    ),
    SymbolItem(
      id: 3,
      name: 'ETH',
      price: r'$3598.4',
      description: 'Ethereum',
      imageUrl:
          'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20201110/3a8c9fe6-2a76-4ace-aa07-415d994de6f0.png',
      symbolChange: 2.3,
      increase: true,
    ),
    SymbolItem(
      id: 4,
      name: 'SHIB',
      price: r'$0.00004123',
      description: 'Shiba Inu',
      imageUrl:
          'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20210510/028e07ac-4117-4ddf-b9fd-90d8bd1c9406.png',
      symbolChange: 1.7,
      increase: true,
    ),
    SymbolItem(
      id: 5,
      name: 'DOGE',
      price: r'$0.1582',
      description: 'Doge coin',
      imageUrl:
          'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20201110/22ef2baf-b210-4882-afd9-1317bb7a3603.png',
      symbolChange: 12.1,
      increase: false,
    ),
    SymbolItem(
      id: 6,
      name: 'SOL',
      price: r'$131.41',
      description: 'Solana',
      imageUrl:
          'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20230404/b2f0c70f-4fb2-4472-9fe7-480ad1592421.png',
      symbolChange: 2.9,
      increase: false,
    ),
    SymbolItem(
      id: 7,
      name: 'BONK',
      price: r'$0.0003231',
      description: 'Bonk',
      imageUrl:
          'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20231215/c82e3e80-e26e-4ccb-8f59-ff22b21c3cb7.png',
      symbolChange: 25.0,
      increase: true,
    ),
    SymbolItem(
      id: 8,
      name: 'LUNC',
      price: r'$0.0002412',
      description: 'Terra Classic',
      imageUrl:
          'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20220527/ac6e1e2b-a18b-4ab7-9d0b-18104b78fdbe.png',
      symbolChange: 5.2,
      increase: true,
    ),
  ];

  static List<String> imgUrlList = [
    'https://s2.coinmarketcap.com/static/img/coins/64x64/24478.png',
    'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20201110/87496d50-2408-43e1-ad4c-78b47b448a6a.png',
    'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20201110/3a8c9fe6-2a76-4ace-aa07-415d994de6f0.png',
    'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20210510/028e07ac-4117-4ddf-b9fd-90d8bd1c9406.png',
    'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20230404/b2f0c70f-4fb2-4472-9fe7-480ad1592421.png',
    'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20231215/c82e3e80-e26e-4ccb-8f59-ff22b21c3cb7.png',
  ];
}
