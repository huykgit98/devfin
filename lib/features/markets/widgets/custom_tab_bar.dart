import 'package:devfin/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabBar extends ConsumerWidget {
  const CustomTabBar(
      {required this.tabs, required this.tabController, this.onTap, super.key});

  final TabController tabController;
  final void Function(int)? onTap;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return TabBar(
      controller: tabController,
      isScrollable: true,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
      labelColor: darkMode ? Colors.white : Colors.black,
      indicatorColor: darkMode ? Colors.white : Colors.black,
      onTap: onTap,

      // indicator: ShapeDecoration(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //     side: const BorderSide(
      //         color: Color(0xffd5d2d2), width: 1),
      //   ),
      //   gradient: LinearGradient(
      //     colors: darkMode
      //         ? ColorsUtil.darkLinearGradientButton
      //         : ColorsUtil.lightLinearGradientButton,
      //   ),
      // ),
      tabs: tabs,
    );
  }
}
