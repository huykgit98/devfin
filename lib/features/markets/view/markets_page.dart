import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/markets/widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MarketsPage extends ConsumerStatefulWidget {
  const MarketsPage({super.key});

  @override
  ConsumerState<MarketsPage> createState() => _MarketsPageState();
}

class _MarketsPageState extends ConsumerState<MarketsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _listCount = 20;
  int _gridCount = 20;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = ref.watch(darkModeProvider);
    return EasyRefresh.builder(
      header: ClassicHeader(
        clamping: true,
        position: IndicatorPosition.locator,
        mainAxisAlignment: MainAxisAlignment.end,
        dragText: 'Pull to refresh'.hardcoded,
        armedText: 'Release ready'.hardcoded,
        readyText: 'Refreshing...'.hardcoded,
        processingText: 'Refreshing...'.hardcoded,
        processedText: 'Succeeded'.hardcoded,
        noMoreText: 'No more'.hardcoded,
        failedText: 'Failed'.hardcoded,
        messageText: 'Last updated at %T'.hardcoded,
      ),
      footer: ClassicFooter(
        position: IndicatorPosition.locator,
        dragText: 'Pull to load'.hardcoded,
        armedText: 'Release ready'.hardcoded,
        readyText: 'Loading...'.hardcoded,
        processingText: 'Loading...'.hardcoded,
        processedText: 'Succeeded'.hardcoded,
        noMoreText: 'No more'.hardcoded,
        failedText: 'Failed'.hardcoded,
        messageText: 'Last updated at %T'.hardcoded,
      ),
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              if (_tabController.index == 0) {
                _listCount = 20;
              } else {
                _gridCount = 20;
              }
            });
          }
        });
      },
      onLoad: () async {
        await Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              if (_tabController.index == 0) {
                _listCount += 10;
              } else {
                _gridCount += 10;
              }
            });
          }
        });
      },
      childBuilder: (context, physics) {
        return ScrollConfiguration(
          behavior: const ERScrollBehavior(),
          child: ExtendedNestedScrollView(
            physics: physics,
            onlyOneScrollInBody: true,
            pinnedHeaderSliverHeightBuilder: () {
              return MediaQuery.of(context).padding.top + kToolbarHeight;
            },
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                const HeaderLocator.sliver(clearExtent: false),
                const CustomHeader(),
              ];
            },
            body: Column(
              children: [
                CustomTabBar(_tabController),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      CustomTabBarViewItem(
                        uniqueKey: const Key('IndicesTab'),
                        itemCount: _listCount,
                      ),
                      ExtendedVisibilityDetector(
                        uniqueKey: const Key('StocksTab'),
                        child: AutomaticKeepAlive(
                          child: CustomScrollView(
                            physics: physics,
                            slivers: [
                              SliverGrid(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                    return const SkeletonItem(
                                      direction: Axis.horizontal,
                                    );
                                  }, childCount: _gridCount),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 6 / 7,
                                  )),
                              const FooterLocator.sliver(),
                            ],
                          ),
                        ),
                      ),
                      CustomTabBarViewItem(
                        uniqueKey: const Key('CryptocurrenciesTab'),
                        itemCount: _listCount,
                      ),
                      CustomTabBarViewItem(
                        uniqueKey: const Key('CommoditiesTab'),
                        itemCount: _listCount,
                      ),
                      CustomTabBarViewItem(
                        uniqueKey: const Key('CurrenciesTab'),
                        itemCount: _listCount,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
