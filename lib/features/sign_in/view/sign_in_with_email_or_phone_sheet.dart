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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Call unfocus when the tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SheetContentScaffold(
      appBar: GradientAppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(Icons.adaptive.arrow_back),
        ),
        title: Text(
          'Sign in'.hardcoded,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
                    _buildTab(context, 'Email'.hardcoded),
                    _buildTab(context, 'Phone'.hardcoded),
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
                              child: const EmailSignInForm(),
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
                              child: const PhoneSignInForm(),
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

  Widget _buildTab(BuildContext context, String title) {
    return Tab(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
