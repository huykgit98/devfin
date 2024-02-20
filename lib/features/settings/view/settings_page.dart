import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/settings/widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
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
    final darkMode = ref.watch(darkModeProvider);
    // Center(
    //   child: Text('Log into existing account'.hardcoded),
    // ),
    // ElevatedButton(
    // onPressed: () {
    // context.go('${AppRoutes.profile}/${AppRoutes.signIn}');
    // },
    // child: Text('Login'.hardcoded),
    // ),

    final themeData = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          shadowColor: Colors.black12.withOpacity(0.5),
          foregroundColor: darkMode ? Colors.white : Colors.black,
          collapsedHeight: 60,
          pinned: true,
          centerTitle: true,
          forceElevated: true,
          title: Text('Settings'.hardcoded),
          flexibleSpace: GradientBackground(
            gradient: LinearGradient(
              colors: darkMode
                  ? ColorsUtil.darkLinearGradient
                  : ColorsUtil.lightLinearGradient,
            ),
          ),
          actions: [],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SettingsGroup(
                  settingsGroupTitle: 'General'.hardcoded,
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.notifications_active,
                      title: 'Notifications'.hardcoded,
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.dark_mode_rounded,
                      title: 'Theme'.hardcoded,
                    ),
                  ],
                ),
                SettingsGroup(
                  settingsGroupTitle: 'ACCOUNT'.hardcoded,
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.account_circle_rounded,
                      title: 'Name'.hardcoded,
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.accessible_forward_rounded,
                      title: 'Username'.hardcoded,
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.email,
                      title: 'Email'.hardcoded,
                      titleStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SettingsGroup(
                  settingsGroupTitle: 'Data & Privacy'.hardcoded,
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.lock_rounded,
                      title: 'Privacy policy'.hardcoded,
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.house_siding_rounded,
                      title: 'Terms of service'.hardcoded,
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.network_cell_rounded,
                      title: "About".hardcoded,
                      titleStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SettingsGroup(
                  settingsGroupTitle: 'Sign Out'.hardcoded,
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.logout_rounded,
                      title: 'Sign Out'.hardcoded,
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.repeat,
                      title: 'Change email',
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.delete_solid,
                      title: 'Delete account'.hardcoded,
                      titleStyle: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
