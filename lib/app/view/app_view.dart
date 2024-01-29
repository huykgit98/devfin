import 'package:devfin/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DevFinApp extends ConsumerWidget {
  const DevFinApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return MaterialApp.router(
      title: 'Devfin - Track All Markets',
      routerConfig: AppRoutes.route,
      darkTheme: ThemeData.dark(),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
