import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem({
    this.imageUrlList = const [],
    super.key,
  });

  final List<dynamic> imageUrlList;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
            child: Text(
              'News Flow',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ListView.builder(
            itemCount: imageUrlList.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SymbolItem(
                onTap: () {
                  final symbolId = 'AAPL';
                },
                icons: Icons.apple,
                title: 'AAPL'.hardcoded,
                subtitle: 'Apple Inc.'.hardcoded,
                subtitleMaxLine: 1,
                trailing: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.teal.withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$182.45',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        children: const [
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
              );
            },
          ),
        ],
      ),
    );
  }
}
