import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/gradient_background.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:devfin/features/sign_in/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: GradientBackground(
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.icons.appIconDarkThemeTransparentBgPng.path,
                  height: 120,
                ),
                const SizedBox(height: 16),
                const EmailInput(),
                const SizedBox(height: 8),
                const PasswordInput(),
                const SizedBox(height: 8),
                const LoginButton(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
