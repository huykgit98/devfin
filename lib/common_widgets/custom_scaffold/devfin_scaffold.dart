import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/custom_scaffold/widgets/widgets.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DevFinScaffold extends ConsumerStatefulWidget {
  const DevFinScaffold({required this.child, super.key});
  final Widget child;
  @override
  ConsumerState<DevFinScaffold> createState() => _DevFinScaffoldState();
}

class _DevFinScaffoldState extends ConsumerState<DevFinScaffold>
    with TickerProviderStateMixin {
  late AnimationController _hideBottomBarAnimationController;

  @override
  void initState() {
    super.initState();
    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
        case ScrollDirection.idle:
      }
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GradientBackground(
        gradient: LinearGradient(
          colors: Theme.of(context)
              .extension<CustomColorsTheme>()!
              .linearGradientBackground,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: NotificationListener<ScrollNotification>(
            onNotification: _onScrollNotification,
            child: widget.child,
          ),
          extendBody: true,
          // drawer: const CustomDrawer(),
          bottomNavigationBar: CustomBottomAppBar(
              hideAnimationController: _hideBottomBarAnimationController),
          // floatingActionButton: ScaleTransition(
          //   scale: _hideBottomBarAnimationController.drive(
          //     Tween(begin: 1.0, end: 0.0).chain(
          //       CurveTween(curve: Curves.fastOutSlowIn),
          //     ),
          //   ),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(100),
          //     child: FloatingActionButton(
          //       child: Icon(
          //         Icons.search_rounded,
          //         color: AppTheme.colorGray,
          //       ),
          //       onPressed: () {
          //         context.go(AppRoutes.search);
          //       },
          //     ),
          //   ),
          // ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
        ),
      );
}
