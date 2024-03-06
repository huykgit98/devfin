/// Summarized information of a Symbol/Ticker item.
class SymbolItem {
  SymbolItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    this.price = "0.00",
    this.currency = "USD",
    this.symbolChange = 0.00,
    this.increase = true,
  });

  final int id;
  final String name;
  final String description;
  final String price;
  final String currency;
  final String imageUrl;
  final double symbolChange;
  final bool increase;
  List<Object?> get props {
    return [
      id,
      name,
      description,
      price,
      currency,
      imageUrl,
      symbolChange,
      increase,
    ];
  }
}
