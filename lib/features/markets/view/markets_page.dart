import 'dart:async';

import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/markets/widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MarketsPage extends ConsumerStatefulWidget {
  const MarketsPage({super.key});

  @override
  ConsumerState<MarketsPage> createState() => _MarketsPageState();
}

class _MarketsPageState extends ConsumerState<MarketsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  static const kExpandedHeight = 140.0;
  bool _isAppBarFullyExpanded = true;

  int _listCount = 20;
  int _tabIndex = 0;
  late EasyRefreshController _easyRefreshController;

  void _scrollListener() {
    if (_scrollController.hasClients) {
      setState(() {
        _isAppBarFullyExpanded = _scrollController.offset == 0.0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);

    _tabController = TabController(length: 5, vsync: this);
    _easyRefreshController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _easyRefreshController.dispose();
    _tabController.dispose();
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      controller: _scrollController,
      onlyOneScrollInBody: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          CustomHeader(
            innerBoxIsScrolled: innerBoxIsScrolled,
            isFullyExpanded: _isAppBarFullyExpanded,
            title: 'Markets'.hardcoded,
            expandedHeight: kExpandedHeight,
            leading: IconButton(
              icon: const FaIcon(FontAwesomeIcons.barsStaggered),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            bottom: CustomTabBar(
              tabController: _tabController,
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
              onTap: (index) {
                setState(() {
                  _tabIndex = index;
                });
              },
            ),
          )
        ];
      },
      body: Column(
        children: <Widget>[
          gapH2,
          Expanded(
            child: IndexedStack(
              index: _tabIndex,
              children: <Widget>[
                CustomExtendedVisibilityDetector(
                  tabKey: 'IndicesTab',
                  items: List.generate(_listCount, (index) => null),
                  onRefresh: () async {
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        if (mounted) {
                          setState(() {
                            _listCount = 20;
                          });
                        }
                      },
                    );
                  },
                  onLoad: () async {
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        if (mounted) {
                          setState(
                            () {
                              _listCount += 10;
                            },
                          );
                        }
                      },
                    );
                  },
                ),
                CustomExtendedVisibilityDetector(
                  tabKey: 'StocksTab',
                  items: List.generate(_listCount, (index) => null),
                  onRefresh: () async {
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        if (mounted) {
                          setState(() {
                            _listCount = 20;
                          });
                        }
                      },
                    );
                  },
                  onLoad: () async {
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        if (mounted) {
                          setState(() {
                            _listCount += 10;
                          });
                        }
                      },
                    );
                  },
                ),
                CustomExtendedVisibilityDetector(
                  tabKey: 'CryptocurrenciesTab',
                  items: List.generate(_listCount, (index) => null),
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1), () {
                      if (mounted) {
                        setState(() {
                          _listCount = 20;
                        });
                      }
                    });
                  },
                  onLoad: () async {
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        if (mounted) {
                          setState(() {
                            _listCount += 10;
                          });
                        }
                      },
                    );
                  },
                ),
                CustomExtendedVisibilityDetector(
                  tabKey: 'CommoditiesTab',
                  items: List.generate(_listCount, (index) => null),
                  onRefresh: () async {
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        if (mounted) {
                          setState(() {
                            _listCount = 20;
                          });
                        }
                      },
                    );
                  },
                  onLoad: () async {
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        if (mounted) {
                          setState(() {
                            _listCount += 10;
                          });
                        }
                      },
                    );
                  },
                ),
                CustomExtendedVisibilityDetector(
                  tabKey: 'CurrenciesTab',
                  items: List.generate(_listCount, (index) => null),
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1), () {
                      if (mounted) {
                        setState(() {
                          _listCount = 20;
                        });
                      }
                    });
                  },
                  onLoad: () async {
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        if (mounted) {
                          setState(() {
                            _listCount += 10;
                          });
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
