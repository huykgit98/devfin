import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/explore/explore.dart';
import 'package:devfin/features/markets/markets.dart';
import 'package:devfin/features/profile/profile.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:devfin/features/sign_up/sign_up.dart';
import 'package:devfin/features/splash/splash_screen.dart';
import 'package:devfin/features/watchlist/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const ValueKey<String> scaffoldKey = ValueKey<String>('App scaffold');

class AppRoutes {
  static const splash = '/';
  static const markets = '/markets';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const profile = '/profile';
  static const explore = '/explore';
  static const watchlist = '/watchlist';

  static final GoRouter route = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: signIn,
        builder: (context, state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) {
          return const SignUpPage();
        },
      ),
      //Markets Tab
      GoRoute(
        path: markets,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.markets,
            child: MarketsPage(),
          ),
        ),
        routes: const <GoRoute>[
          // GoRoute(
          //   path: ':authorId',
          //   builder: (BuildContext context, GoRouterState state) {
          //     final int authorId = int.parse(state.pathParameters['authorId']!);
          //     final Author? selectedAuthor =
          //         libraryInstance.allAuthors.firstWhereOrNull((Author a) => a.id == authorId);

          //     return AuthorDetailsScreen(author: selectedAuthor);
          //   },
          // ),
        ],
      ),
      //watchlist Tab
      GoRoute(
        path: watchlist,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.watchlist,
            child: WatchlistPage(),
          ),
        ),
      ),
      //Market Tab
      GoRoute(
        path: explore,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.explore,
            child: ExplorePage(),
          ),
        ),
      ),
      //Profile Tab
      GoRoute(
        path: profile,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.profile,
            child: ProfilePage(),
          ),
        ),
      ),
    ],
    // redirect: guard,
    // refreshListenable: auth,
    debugLogDiagnostics: true,
  );
}
