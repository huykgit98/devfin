import 'package:authentication_repository/authentication_repository.dart';
import 'package:devfin/app/app.dart';
import 'package:devfin/features/authentication/authentication.dart';
import 'package:devfin/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DevFinApp extends ConsumerWidget {
  const DevFinApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (_) => AuthenticationRepository(),
        ),
      ],
      child: const DevFinAppView(),
    );
  }
}

class DevFinAppView extends ConsumerStatefulWidget {
  const DevFinAppView({super.key});

  @override
  ConsumerState<DevFinAppView> createState() => _DevFinAppViewState();
}

class _DevFinAppViewState extends ConsumerState<DevFinAppView> {
  @override
  Widget build(BuildContext context) {
    final darkMode = ref.watch(darkModeProvider);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Devfin - Track All Markets',
        debugShowCheckedModeBanner: false,
        routeInformationProvider: AppRoutes.route.routeInformationProvider,
        routeInformationParser: AppRoutes.route.routeInformationParser,
        routerDelegate: AppRoutes.route.routerDelegate,
        theme: ThemeData(
          useMaterial3: true,
          // fontFamily: FontFamily.nunito,
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),

          // primaryColorDark: ColorUtils.primaryColor,
          // primaryColor: ColorUtils.primaryColor,
          // textSelectionTheme: const TextSelectionThemeData(
          //   cursorColor: ColorUtils.primaryColor,
          // ),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
