import 'package:authentication_repository/authentication_repository.dart';
import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/sign_in/sign_in.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class SignInWithEmailOrPhoneSheet extends ConsumerStatefulWidget {
  const SignInWithEmailOrPhoneSheet({super.key});

  @override
  ConsumerState<SignInWithEmailOrPhoneSheet> createState() =>
      _SignInWithEmailOrPhoneSheetState();
}

class _SignInWithEmailOrPhoneSheetState
    extends ConsumerState<SignInWithEmailOrPhoneSheet>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    return SheetContentScaffold(
      appBar: GradientAppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(Icons.adaptive.arrow_back),
        ),
        title: Text('Sign in'.hardcoded),
      ),
      body: GradientBackground(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                CustomTabBar(
                  tabController: _tabController,
                  tabs: [
                    Tab(
                      text: 'Email'.hardcoded,
                    ),
                    Tab(
                      text: 'Phone'.hardcoded,
                    ),
                  ],
                  tabAlignment: TabAlignment.center,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(Sizes.p8),
                            child: BlocProvider(
                              create: (_) => SignInCubit(
                                  context.read<AuthenticationRepository>()),
                              child: const LoginForm(),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(Sizes.p8),
                            child: BlocProvider(
                              create: (_) => SignInCubit(
                                  context.read<AuthenticationRepository>()),
                              child: const LoginForm(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
