import 'package:devfin/app/app.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : Container(
                height: Sizes.p48,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.p20),
                  gradient: LinearGradient(
                    colors: colors.gradientButton,
                  ),
                ),
                child: ElevatedButton(
                  key: const Key('loginForm_continue_raisedButton'),
                  onPressed: () => state.isValid
                      ? () =>
                          context.read<SignInCubit>().signInWithCredentials()
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    'Sign in'.hardcoded,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
