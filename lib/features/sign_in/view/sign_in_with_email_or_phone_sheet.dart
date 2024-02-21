import 'package:authentication_repository/authentication_repository.dart';
import 'package:devfin/app/app.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class SignInWithEmailOrPhoneSheet extends ConsumerWidget {
  const SignInWithEmailOrPhoneSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SheetContentScaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p8),
        child: BlocProvider(
          create: (_) => SignInCubit(context.read<AuthenticationRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
