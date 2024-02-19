import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/authentication/authentication.dart';
import 'package:devfin/features/explore/explore.dart';
import 'package:devfin/features/markets/markets.dart';
import 'package:devfin/features/profile/profile.dart';
import 'package:devfin/features/search/search.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:devfin/features/sign_up/sign_up.dart';
import 'package:devfin/features/splash/splash_screen.dart';
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
  static const profile = '/profile';

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
                path: 'details',
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsScreen(label: 'A');
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
            routes: <RouteBase>[
              GoRoute(
                path: 'details',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsScreen(label: 'B');
                },
              ),
            ],
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
            routes: <RouteBase>[
              GoRoute(
                path: 'details',
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsScreen(label: 'C');
                },
              ),
            ],
          ),
          GoRoute(
            path: profile,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return FadeTransitionPage(
                key: scaffoldKey,
                child: const ProfilePage(),
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
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// The details screen for either the A or B screen.
class DetailsScreen extends StatefulWidget {
  /// Constructs a [DetailsScreen].
  const DetailsScreen({
    required this.label,
    this.param,
    this.extra,
    this.withScaffold = true,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String label;

  /// Optional param
  final String? param;

  /// Optional extra object
  final Object? extra;

  /// Wrap in scaffold
  final bool withScaffold;

  @override
  State<StatefulWidget> createState() => DetailsScreenState();
}

/// The state for DetailsScreen
class DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.withScaffold) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Details Screen - ${widget.label}'),
        ),
        body: _build(context),
      );
    } else {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: _build(context),
      );
    }
  }

  Widget _build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Details for ${widget.label} - Counter: $_counter',
              style: Theme.of(context).textTheme.titleLarge),
          const Padding(padding: EdgeInsets.all(4)),
          TextButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Increment counter'),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          if (widget.param != null)
            Text('Parameter: ${widget.param!}',
                style: Theme.of(context).textTheme.titleMedium),
          const Padding(padding: EdgeInsets.all(8)),
          if (widget.extra != null)
            Text('Extra: ${widget.extra!}',
                style: Theme.of(context).textTheme.titleMedium),
          if (!widget.withScaffold) ...<Widget>[
            const Padding(padding: EdgeInsets.all(16)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text('< Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ]
        ],
      ),
    );
  }
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
