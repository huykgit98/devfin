import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/authentication/authentication.dart';
import 'package:devfin/features/explore/explore.dart';
import 'package:devfin/features/markets/markets.dart';
import 'package:devfin/features/search/search.dart';
import 'package:devfin/features/settings/settings.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:devfin/features/sign_up/sign_up.dart';
import 'package:devfin/features/splash/splash_screen.dart';
import 'package:devfin/features/symbol_details/symbol_details.dart';
import 'package:devfin/features/watchlist/watchlist.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

const ValueKey<String> scaffoldKey = ValueKey<String>('App scaffold');
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final sheetTransitionObserver = NavigationSheetTransitionObserver();

class AppRoutes {
  static const splash = '/';

  static const signIn = 'sign-in';
  static const signInWithEmailOrPhone = 'sign-in-with-email-or-phone';

  static const signUp = 'sign-up';
  static const signUpWithEmailOrPhone = 'sign-up-with-email-or-phone';

  static const markets = '/markets';
  static const explore = '/explore';
  static const search = '/search';
  static const watchlist = '/watchlist';

  static const settings = '/settings';
  static const themeSettings = 'theme-settings';

  static final GoRouter route = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: splash,
    navigatorKey: _rootNavigatorKey,
    errorPageBuilder: (context, state) => MaterialPage(
      child: Scaffold(
        body: Center(
          child: Text('Route not found!'.hardcoded),
        ),
      ),
    ),
    redirect: (context, state) async {
      // We should be using `context.read()` not `context.watch()`
      final status = context.read<AuthenticationBloc>().state.status;

      //When the user taps on the profile tab, if the user is not authenticated,
      // then navigate to the sign-up sheet.
      // if (status == AuthenticationStatus.unauthenticated &&
      //     state.fullPath == profile) {
      //   return '$signUp';
      // }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: splash,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return DevFinScaffold(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: markets,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: scaffoldKey,
                child: const MarketsPage(),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: ':symbolId',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  final String symbolId = state.pathParameters['symbolId']!;
                  // final Symbol? selectedSymbol = libraryInstance.allSymbols
                  //     .firstWhereOrNull((Author a) => a.id == symbolId);

                  return const SymbolDetailsPage();
                },
              ),
            ],
          ),
          GoRoute(
            path: explore,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: scaffoldKey,
                child: const ExplorePage(),
              );
            },
            routes: <RouteBase>[],
          ),
          GoRoute(
            path: search,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: scaffoldKey,
                child: const SearchPage(),
              );
            },
            routes: <RouteBase>[],
          ),
          GoRoute(
            path: watchlist,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: scaffoldKey,
                child: const WatchlistPage(),
              );
            },
            routes: <RouteBase>[],
          ),
          GoRoute(
            path: settings,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: scaffoldKey,
                child: const SettingsPage(),
              );
            },
            routes: <RouteBase>[
              ShellRoute(
                // Do not remove this line!
                observers: [sheetTransitionObserver],
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state, navigator) {
                  return ModalSheetPage(
                    key: state.pageKey,
                    child: SafeArea(
                      bottom: false,
                      child: NavigationSheet(
                        transitionObserver: sheetTransitionObserver,
                        child: _SheetShell(navigator: navigator),
                      ),
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: signUp,
                    pageBuilder: (context, state) {
                      return const DraggableNavigationSheetPage(
                        child: SignUpMethodsSheet(),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: signUpWithEmailOrPhone,
                        pageBuilder: (context, state) {
                          return DraggableNavigationSheetPage(
                            key: state.pageKey,
                            child: const SignUpWithEmailOrPhoneSheet(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: signIn,
                    pageBuilder: (context, state) {
                      return const DraggableNavigationSheetPage(
                        child: SignInMethodsSheet(),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: signInWithEmailOrPhone,
                        pageBuilder: (context, state) {
                          return DraggableNavigationSheetPage(
                            key: state.pageKey,
                            child: const SignInWithEmailOrPhoneSheet(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: themeSettings,
                    pageBuilder: (context, state) {
                      return const DraggableNavigationSheetPage(
                        child: ThemeSettingsSheet(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class _SheetShell extends StatelessWidget {
  const _SheetShell({
    required this.navigator,
  });

  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return Material(
      // Add circular corners to the sheet.
      borderRadius: BorderRadius.circular(Sizes.p16),
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.surface,
      child: navigator,
    );
  }
}
