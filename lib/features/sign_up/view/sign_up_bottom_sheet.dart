import 'package:devfin/app/app.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpSheet {
  static void show(BuildContext context, bool darkMode) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9, // 90% of device height
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: darkMode
                      ? ColorsUtil.linearGradient
                      : ColorsUtil.linearGradientLightMode),
            ),
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:
                    MainAxisSize.min, // To make the sheet wrap-content
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
                          child: Container(
                              width: Sizes.p48,
                              height: Sizes.p48,
                              decoration: const BoxDecoration(
                                color: ColorsUtil.loadingIndicatorColor,
                              ),
                              child: Image(
                                  image: AssetImage(
                                      Assets.icons.appIconTransparentBg.path))),
                        ),
                        const SizedBox(height: Sizes.p32),
                        Text('Sign up for DevFin'.hardcoded,
                            style: TextStyle(
                                fontSize: Sizes.p24,
                                fontWeight: FontWeight.bold)),
                        Text('DevFin - Track All Markets'.hardcoded,
                            style: TextStyle(
                                // color: Colors.blueGrey[100],
                                fontSize: Sizes.p16,
                                fontWeight: FontWeight.normal)),
                        gapH16,
                        _buildButton(
                            'Use phone or email'.hardcoded, Icons.person),
                        gapH16,
                        _buildButton(
                            'Continue with Facebook'.hardcoded, Icons.facebook),
                        gapH16,
                        _buildButton(
                            'Continue with Apple'.hardcoded, Icons.apple),
                        gapH16,
                        _buildButton('Continue with Google'.hardcoded,
                            Icons.g_translate),
                      ],
                    ),
                  ),
                  const Spacer(),
                  _buildTermsAndConditions(),
                  _buildLoginPrompt(context, darkMode),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildButton(String text, IconData icon) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p20),
        gradient: const LinearGradient(
          colors: ColorsUtil.linearGradient,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(icon),
            Text(text, style: const TextStyle()),
            const SizedBox()
          ],
        ),
      ),
    );
  }

  static Widget _buildTermsAndConditions() {
    return Center(
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                // color: Colors.blueGrey[200],
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
                // color: Colors.blueGrey[200],
                fontSize: Sizes.p16,
                fontWeight: FontWeight.normal,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Log in'.hardcoded,
                  style: const TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to login bottom sheet
                      Navigator.pop(context);
                      SignInSheet.show(context, darkMode);
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
