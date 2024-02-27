import 'package:flutter/material.dart';

import 'list_item.dart';

class ListGroup extends StatelessWidget {
  const ListGroup({required this.label, required this.items, super.key});

  final String label;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.apply(fontWeightDelta: 2),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == items.length - 1 ? 20 : 0,
              ),
              child: ListItem(id: '${index + 1}'),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: items.length,
        )
      ],
    );
  }
}
