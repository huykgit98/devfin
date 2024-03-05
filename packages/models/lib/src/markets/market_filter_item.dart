/// Summarized information of a Market Filter item.
class MarketsFilterItem {
  MarketsFilterItem({
    required this.id,
    required this.name,
    required this.filterList,
  });

  factory MarketsFilterItem.fromJson(Map<String, dynamic> json) =>
      MarketsFilterItem(
        id: json['id'] as int,
        name: json['name'] as String,
        filterList: [],
      );

  final int id;
  final String name;
  final List<String> filterList;
}
