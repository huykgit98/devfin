import 'package:devfin/app/app.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Center(
              child: Text('Log into existing account'.hardcoded),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('${AppRoutes.profile}/${AppRoutes.signIn}');
              },
              child: Text('Login'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }
}
