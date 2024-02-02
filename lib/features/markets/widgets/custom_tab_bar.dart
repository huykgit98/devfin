import 'package:devfin/app/app.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabBar extends ConsumerWidget {
  const CustomTabBar(this._tabController, {super.key});

  final TabController _tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
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
      tabs: <Widget>[
        Tab(
          text: 'Indices'.hardcoded,
        ),
        Tab(
          text: 'Stocks'.hardcoded,
        ),
        Tab(
          text: 'Cryptocurrencies'.hardcoded,
        ),
        Tab(
          text: 'Commodities'.hardcoded,
        ),
        Tab(
          text: 'Currencies'.hardcoded,
        ),
      ],
    );
  }
}
