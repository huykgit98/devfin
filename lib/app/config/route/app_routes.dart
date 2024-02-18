import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/authentication/authentication.dart';
import 'package:devfin/features/explore/explore.dart';
import 'package:devfin/features/markets/markets.dart';
import 'package:devfin/features/profile/profile.dart';
import 'package:devfin/features/splash/splash_screen.dart';
import 'package:devfin/features/watchlist/watchlist.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const ValueKey<String> scaffoldKey = ValueKey<String>('App scaffold');
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRoutes {
  static const splash = '/';

  static const signIn = '/sign-in';
  static const signUp = '/sign-up';

  static const markets = '/markets';
  static const explore = '/explore';
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
      if (status == AuthenticationStatus.authenticated) {
        return null;
      }
      // return signIn;
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
            builder: (BuildContext context, GoRouterState state) {
              return const MarketsPage();
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
            builder: (BuildContext context, GoRouterState state) {
              return const ExplorePage();
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
            path: watchlist,
            builder: (BuildContext context, GoRouterState state) {
              return const WatchlistPage();
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
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
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
        ],
      ),
    ],
  );
}

class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen].
  const DetailsScreen({
    required this.label,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Text(
          'Details for $label',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
