import 'package:devfin/app/app.dart';
import 'package:devfin/features/sign_up/sign_up.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInSheet {
  static void show(BuildContext context, bool darkMode) {
    showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Container(
          height:
              MediaQuery.of(context).size.height * 0.9, // 90% of device height
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: darkMode
                    ? ColorsUtil.linearGradient
                    : ColorsUtil.linearGradientLightMode),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // To make the sheet wrap-content
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    // color: Colors.white,
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: ColorsUtil.loadingIndicatorColor,
                          ),
                          child: Image(
                            image: AssetImage(
                                Assets.icons.appIconTransparentBg.path),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      const Text('Log in to DevFin',
                          style: TextStyle(
                              // color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      Text('DevFin - Track All Markets',
                          style: TextStyle(
                              color: Colors.blueGrey[100],
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                      const SizedBox(height: 16.0),
                      _buildButton('Use phone or email', Icons.person),
                      const SizedBox(height: 16.0),
                      _buildButton('Continue with Facebook', Icons.facebook),
                      const SizedBox(height: 16.0),
                      _buildButton('Continue with Apple', Icons.apple),
                      const SizedBox(height: 16.0),
                      _buildButton('Continue with Google', Icons.g_translate),
                    ],
                  ),
                ),
                const Spacer(),
                // _buildTermsAndConditions(),
                _buildSignUpPrompt(context, darkMode),
              ],
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
        borderRadius: BorderRadius.circular(20.0),
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
            Text(text,
                style: const TextStyle(
                    // color: Colors.white,
                    )),
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
                color: Colors.blueGrey[200],
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                const TextSpan(text: 'By signing up, you agree to our '),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap on "Terms, Privacy Policy"
                    },
                    child: Text(
                      'Terms, Privacy Policy, ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[200]),
                    ),
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap on "Cookie Use"
                    },
                    child: Text(
                      'and ',
                      style: TextStyle(color: Colors.blueGrey[200]),
                    ),
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap on "Cookie Use"
                    },
                    child: Text(
                      'Cookies Policy.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[200]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  static Widget _buildSignUpPrompt(BuildContext context, bool darkMode) {
    return Center(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(
                color: Colors.blueGrey[200],
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Sign up',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to sign up bottom sheet
                      Navigator.pop(context);
                      SignUpSheet.show(context, darkMode);
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
