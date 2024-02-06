import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff6750A4),
      ),
      home: DefaultTabController(
        length: 3,
        child: Material(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar.medium(
                leading: IconButton(
                    icon: const Icon(Icons.more_vert), onPressed: () {}),
                title: const Text(
                  'Large App Bar',
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.more_vert), onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.more_vert), onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.more_vert), onPressed: () {}),
                ],
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(text: 'Tab 1'),
                    Tab(text: 'Tab 2'),
                    Tab(text: 'Tab 3'),
                  ],
                ),
              ),

              // Just some content big enough to have something to scroll.
              SliverToBoxAdapter(
                child: Card(
                  child: SizedBox(
                    height: 1200,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 100, 8, 100),
                      child: Text(
                        'Here be scrolling content...',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
