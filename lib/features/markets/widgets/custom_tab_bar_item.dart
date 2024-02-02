import 'package:flutter/material.dart';

class CustomTabBarItem extends StatelessWidget {
  final String title;

  const CustomTabBarItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
