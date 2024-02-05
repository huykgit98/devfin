import 'dart:async';

import 'package:devfin/app/config/contants/app_sizes.dart';
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
  int _tabIndex = 0;
  late EasyRefreshController _easyRefreshController;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      onlyOneScrollInBody: true,
      pinnedHeaderSliverHeightBuilder: () {
        return MediaQuery.of(context).padding.top + kToolbarHeight;
      },
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          CustomHeader(
            innerBoxIsScrolled: innerBoxIsScrolled,
          )
        ];
      },
      body: Column(
        children: <Widget>[
          CustomTabBar(
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
            tabController: _tabController,
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
          ),
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
