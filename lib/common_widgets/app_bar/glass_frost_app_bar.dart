import 'dart:ui';

import 'package:devfin/app/app.dart';
import 'package:flutter/material.dart';

class GlassFrostAppBar extends StatefulWidget {
  const GlassFrostAppBar(
      {super.key,
      required this.mainScrollController,
      required this.horizontalList});

  final ScrollController mainScrollController;
  final Widget horizontalList;

  @override
  State<GlassFrostAppBar> createState() => _GlassFrostAppBarState();
}

class _GlassFrostAppBarState extends State<GlassFrostAppBar>
    with TickerProviderStateMixin {
  late AnimationController _expandController;
  late Animation<double> animation;

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.fastOutSlowIn,
    );

    widget.mainScrollController.addListener(() {
      if (widget.mainScrollController.offset > kToolbarHeight) {
        _expandController.forward();
      } else {
        _expandController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: colors.linearGradientBackgroundWithOpacity,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: MediaQuery.of(context).padding.top),
              SizeTransition(
                axisAlignment: 1,
                sizeFactor: animation,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    // child: HorizontalDates(isCollapsed: true),
                    child: widget.horizontalList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
