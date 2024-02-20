import 'package:authentication_repository/authentication_repository.dart';
import 'package:devfin/app/app.dart';
import 'package:devfin/features/authentication/authentication.dart';
import 'package:devfin/l10n/l10n.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
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
    final _themeNotifier = ref.watch(themeNotifierProvider);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
        ),
      ],
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Theme.of(context).platform == TargetPlatform.iOS
              ? Colors.transparent
              : null,
          highlightColor: Theme.of(context).platform == TargetPlatform.iOS
              ? Colors.transparent
              : null,
        ),
        child: MaterialApp.router(
          title: 'Devfin - Track All Markets'.hardcoded,
          debugShowCheckedModeBanner: false,
          routeInformationProvider: AppRoutes.route.routeInformationProvider,
          routeInformationParser: AppRoutes.route.routeInformationParser,
          routerDelegate: AppRoutes.route.routerDelegate,
          theme: AppTheme.get(isLight: true),
          darkTheme: AppTheme.get(isLight: false),
          themeMode: _themeNotifier.themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
