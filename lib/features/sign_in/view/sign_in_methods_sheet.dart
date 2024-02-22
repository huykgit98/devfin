import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class SignInMethodsSheet extends ConsumerWidget {
  const SignInMethodsSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    final darkMode =
        ref.watch(themeNotifierProvider).themeMode == ThemeMode.dark;
    return SheetContentScaffold(
      appBar: GradientAppBar(
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.settings),
          icon: const Icon(Icons.close),
        ),
      ),
      extendBody: true,
      body: GradientBackground(
        gradient: LinearGradient(
          colors: colors.linearGradientBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // To make the sheet wrap-content
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: SizedBox(
                        width: Sizes.p48,
                        height: Sizes.p48,
                        child: SvgPicture.asset(
                          darkMode
                              ? Assets.icons.appIconDarkThemeTransparentBgSvg
                              : Assets.icons.appIconTransparentBgSvg,
                          semanticsLabel: 'DevFin Logo',
                        ),
                      ),
                    ),
                    const SizedBox(height: Sizes.p32),
                    Text(
                      'Log in to DevFin'.hardcoded,
                      style: TextStyle(
                        fontSize: Sizes.p24,
                        color: colors.labelColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'DevFin - Track All Markets'.hardcoded,
                      style: TextStyle(
                        color: colors.labelColor,
                        fontSize: Sizes.p16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    gapH16,
                    _buildButton(
                      text: 'Use phone or email'.hardcoded,
                      icon: FontAwesomeIcons.user,
                      onPressed: () {
                        context.go(
                          '${AppRoutes.settings}/${AppRoutes.signIn}/${AppRoutes.signInWithEmailOrPhone}',
                        );
                      },
                      colors: colors,
                    ),
                    gapH16,
                    _buildButton(
                      text: 'Continue with Facebook'.hardcoded,
                      icon: FontAwesomeIcons.facebook,
                      colors: colors,
                      onPressed: () {
                        // Handle tap on "Continue with Facebook" ,
                      },
                    ),
                    gapH16,
                    _buildButton(
                      text: 'Continue with Apple'.hardcoded,
                      icon: FontAwesomeIcons.apple,
                      colors: colors,
                      onPressed: () {
                        // Handle tap on "Continue with Apple"
                      },
                    ),
                    gapH16,
                    _buildButton(
                      text: 'Continue with Google'.hardcoded,
                      icon: FontAwesomeIcons.google,
                      colors: colors,
                      onPressed: () {
                        // Handle tap on "Continue with Google"
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _buildTermsAndConditions(context, colors),
              _buildLoginPrompt(context, colors),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required void Function()? onPressed,
    required String text,
    required IconData icon,
    required CustomColorsTheme colors,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p20),
        gradient: LinearGradient(
          colors: colors.linearGradientBackground,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FaIcon(icon, color: colors.labelColor),
            Text(
              text,
              style: TextStyle(
                color: colors.labelColor,
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions(
      BuildContext context, CustomColorsTheme colors) {
    return Center(
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: colors.labelColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(text: 'By signing up, you agree to our '.hardcoded),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap on "Terms, Privacy Policy"
                    },
                    child: Text(
                      'Terms, Privacy Policy, '.hardcoded,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.blueGrey[200],
                      ),
                    ),
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap on "Cookie Use"
                    },
                    child: Text(
                      'and '.hardcoded,
                      // style: TextStyle(color: Colors.blueGrey[200]),
                    ),
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap on "Cookie Use"
                    },
                    child: Text(
                      'Cookies Policy.'.hardcoded,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.blueGrey[200]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Sizes.p16),
        ],
      ),
    );
  }

  Widget _buildLoginPrompt(BuildContext context, CustomColorsTheme colors) {
    return Center(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: "Don't have an account? ".hardcoded,
              style: TextStyle(
                color: colors.labelColor,
                fontSize: Sizes.p16,
                fontWeight: FontWeight.normal,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Sign up'.hardcoded,
                  style: TextStyle(
                    color: colors.labelColor,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        context.go('${AppRoutes.settings}/${AppRoutes.signUp}'),
                ),
              ],
            ),
          ),
          const SizedBox(height: Sizes.p32),
        ],
      ),
    );
  }
}
