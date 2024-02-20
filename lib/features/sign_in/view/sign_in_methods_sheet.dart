import 'package:devfin/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class SignInMethodsSheet extends ConsumerWidget {
  const SignInMethodsSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = Theme.of(context).colorScheme.onSecondaryContainer;
    final textStyle = Theme.of(context).textTheme.displayMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: textColor,
        );

    return SheetContentScaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.settings),
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Sign In'),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: textColor,
                ),
                onPressed: () => context.go(
                    '${AppRoutes.settings}/${AppRoutes.signIn}/${AppRoutes.signInWithEmailOrPhone}'),
                child: const Text(AppRoutes.signInWithEmailOrPhone),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: textColor,
                ),
                onPressed: () =>
                    context.go('${AppRoutes.settings}/${AppRoutes.signUp}'),
                child: const Text('No account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
