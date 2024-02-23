import 'package:devfin/app/app.dart';
import 'package:devfin/features/settings/widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          shadowColor: Colors.black12.withOpacity(0.5),
          pinned: true,
          floating: true,
          foregroundColor: colors.labelColor,
          title: Text(
            'Settings'.hardcoded,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors.linearGradientBackground,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      context.go('${AppRoutes.settings}/${AppRoutes.signIn}');
                    },
                    icons: Icons.login_rounded,
                    title: 'Login'.hardcoded,
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: 'General'.hardcoded,
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.notifications_active,
                    title: 'Notifications'.hardcoded,
                  ),
                  SettingsItem(
                    onTap: () {
                      context.go(
                        '${AppRoutes.settings}/${AppRoutes.themeSettings}',
                      );
                    },
                    icons: Icons.dark_mode_rounded,
                    title: 'Theme'.hardcoded,
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: 'Account'.hardcoded,
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
                    icons: Icons.info_rounded,
                    title: 'About'.hardcoded,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
