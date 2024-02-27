import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.network('https://picsum.photos/500/300?random=$id'),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Text('This is item number $id'),
        ),
      ],
    );
  }
}
