import 'package:devfin/common_widgets/gradient_background.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({super.key});

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
      child: const GradientBackground(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EmailInput(),
                SizedBox(height: 8),
                PasswordInput(),
                SizedBox(height: 8),
                LoginButton(),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
