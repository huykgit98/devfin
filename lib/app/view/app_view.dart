import 'package:flutter/material.dart';

class DevFinApp extends StatelessWidget {
  const DevFinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Devfin - Track All Markets',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('DevFin'),
          ),
          body: Center(child: Text('DevFin - Track All Marketsads')),
        ));
  }
}
