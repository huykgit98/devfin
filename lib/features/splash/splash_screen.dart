import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(milliseconds: 2000), () {
      GoRouter.of(context).go(AppRoutes.markets);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = ref.watch(darkModeProvider);
    return GradientBackground(
      gradient: LinearGradient(
        colors: darkMode
            ? ColorsUtil.darkLinearGradient
            : ColorsUtil.lightLinearGradient,
      ),
      child: Center(
        child: CustomProgressWidget(
          darkMode: darkMode,
          backgroundGradientColors: ColorsUtil.customLoadingGradient,
          liquidGradient: ColorsUtil.messengerLikeGradient,
        ),
      ),
    );
  }
}
