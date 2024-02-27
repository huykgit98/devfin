import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({
    required this.controller,
    required this.data,
    required this.overlapsContent,
    super.key,
  });

  final TabController controller;
  final List<dynamic> data;
  final bool overlapsContent;

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return GradientBackground(
      child: LayoutBuilder(
        builder: (context, constraints) => TabBar(
          controller: widget.controller,
          isScrollable: true,
          labelPadding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          indicatorWeight: 2,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          labelColor: colors.labelColor,
          indicatorColor: colors.labelColor,
          splashFactory: NoSplash.splashFactory,
          onTap: (index) {
            GlobalKey globalKey = widget.data[index]['key'] as GlobalKey;

            Scrollable.ensureVisible(
              globalKey.currentContext!,
              duration: const Duration(milliseconds: 250),
            );
          },
          tabs: List.generate(widget.data.length, (index) {
            var item = widget.data[index];

            return SizedBox(
              // Explicit set the height to take full height of the tab bar
              height: constraints.maxHeight,
              child: Text(
                '${item['label']}',
                style: TextStyle(
                    color: colors.labelColor, fontWeight: FontWeight.bold),
              ),
            );
          }),
        ),
      ),
    );
  }
}
