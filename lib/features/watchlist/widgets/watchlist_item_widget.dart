import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem({
    required this.watchlistName,
    required this.watchlist,
    super.key,
  });

  final String watchlistName;
  final List<SymbolItem> watchlist;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
            child: Text(
              watchlistName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ListView.builder(
            itemCount: watchlist.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = watchlist[index];
              return SymbolItemWidget(
                onTap: () {
                  final symbolId = item.name;
                },
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: CachedNetworkImageProvider(item.imageUrl),
                ),
                title: item.name,
                subtitle: item.description,
                subtitleMaxLine: 1,
                trailing: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: item.increase
                        ? Colors.teal.withOpacity(0.1)
                        : Colors.redAccent.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.price,
                        style: TextStyle(
                          fontSize: 14,
                          color: item.increase ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(
                            item.increase
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: item.increase ? Colors.green : Colors.red,
                            size: 16,
                          ),
                          Text(
                            '${item.symbolChange}%',
                            style: TextStyle(
                              color: item.increase ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
