import 'package:devfin/app/app.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SignUpSheet extends ConsumerWidget {
  const SignUpSheet({
    required this.size,
    required this.destinations,
    super.key,
  });

  final double size;
  final List<String> destinations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    final textColor = Theme.of(context).colorScheme.onSecondaryContainer;
    final textStyle = Theme.of(context).textTheme.displayMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: textColor,
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: darkMode
                    ? ColorsUtil.darkLinearGradient
                    : ColorsUtil.lightLinearGradient),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // To make the sheet wrap-content
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          width: Sizes.p48,
                          height: Sizes.p48,
                          child: SvgPicture.asset(
                              darkMode
                                  ? Assets
                                      .icons.appIconDarkThemeTransparentBgSvg
                                  : Assets.icons.appIconTransparentBgSvg,
                              semanticsLabel: 'DevFin Logo'),
                        ),
                      ),
                      const SizedBox(height: Sizes.p32),
                      Text('Sign up for DevFin'.hardcoded,
                          style: TextStyle(
                              fontSize: Sizes.p24,
                              color: darkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text('DevFin - Track All Markets'.hardcoded,
                          style: TextStyle(
                              color: darkMode ? Colors.white : Colors.black,
                              fontSize: Sizes.p16,
                              fontWeight: FontWeight.normal)),
                      gapH16,
                      _buildButton(
                          text: 'Use phone or email'.hardcoded,
                          icon: FontAwesomeIcons.user,
                          darkMode: darkMode,
                          onPressed: () {
                            // Navigator.pop(context);
                            GoRouter.of(context).go(AppRoutes.signUp);
                          }),
                      gapH16,
                      _buildButton(
                        text: 'Continue with Facebook'.hardcoded,
                        icon: FontAwesomeIcons.facebook,
                        darkMode: darkMode,
                        onPressed: () {
                          // Handle Facebook sign up
                        },
                      ),
                      gapH16,
                      _buildButton(
                        text: 'Continue with Apple'.hardcoded,
                        icon: FontAwesomeIcons.apple,
                        darkMode: darkMode,
                        onPressed: () {
                          // Handle Apple sign up
                        },
                      ),
                      gapH16,
                      _buildButton(
                        text: 'Continue with Google'.hardcoded,
                        icon: FontAwesomeIcons.google,
                        darkMode: darkMode,
                        onPressed: () {
                          // Handle Google sign up
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                _buildTermsAndConditions(context, darkMode),
                _buildLoginPrompt(context, darkMode),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildButton(
      {required String text,
      required IconData icon,
      required bool darkMode,
      required void Function()? onPressed}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p20),
        gradient: LinearGradient(
          colors: darkMode
              ? ColorsUtil.darkLinearGradient
              : ColorsUtil.lightLinearGradient,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FaIcon(icon, color: darkMode ? Colors.white : Colors.black),
            Text(text,
                style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                )),
            const SizedBox()
          ],
        ),
      ),
    );
  }

  static Widget _buildTermsAndConditions(BuildContext context, bool darkMode) {
    return Center(
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: darkMode ? Colors.white : Colors.black,
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
                      style: TextStyle(
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.blueGrey[200]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Sizes.p16),
        ],
      ),
    );
  }

  static Widget _buildLoginPrompt(BuildContext context, bool darkMode) {
    return Center(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Already have an account? '.hardcoded,
              style: TextStyle(
                color: darkMode ? Colors.white : Colors.black,
                fontSize: Sizes.p16,
                fontWeight: FontWeight.normal,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Log in'.hardcoded,
                  style: TextStyle(
                    color: darkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to login bottom sheet
                      context.pop();
                      SignInSheet.show(context, darkMode: darkMode);
                    },
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
