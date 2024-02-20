import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ThemeSettingsPage extends ConsumerWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    final notifier = ref.watch(themeNotifierProvider);
    final darkMode = notifier.themeMode == ThemeMode.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: darkMode
              ? ColorsUtil.darkLinearGradient
              : ColorsUtil.lightLinearGradient,
        ),
      ),
      alignment: Alignment.center,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            shadowColor: Colors.black12.withOpacity(0.5),
            collapsedHeight: 60,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.adaptive.arrow_back),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            centerTitle: true,
            forceElevated: true,
            title: Text('Theme Settings'.hardcoded),
            flexibleSpace: GradientBackground(
              gradient: LinearGradient(
                colors: darkMode
                    ? ColorsUtil.darkLinearGradient
                    : ColorsUtil.lightLinearGradient,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _singleTile('Dark Theme'.hardcoded, ThemeMode.dark, notifier),
                _singleTile('Light Theme'.hardcoded, ThemeMode.light, notifier),
                _singleTile(
                    'System Theme'.hardcoded, ThemeMode.system, notifier),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _singleTile(String title, ThemeMode mode, ThemeNotifier notifier) {
    return RadioListTile<ThemeMode>(
      value: mode,
      title: Text(title),
      groupValue: notifier.themeMode,
      onChanged: (val) {
        if (val != null) notifier.setTheme(val);
      },
    );
  }
}
