import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class ThemeSettingsSheet extends ConsumerWidget {
  const ThemeSettingsSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    final notifier = ref.watch(themeNotifierProvider);
    final themeTitleList = ['System', 'Light', 'Dark'];
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        width: constraints.maxWidth,
        height: constraints.maxHeight * 0.5,
        child: SheetContentScaffold(
          appBar: GradientAppBar(
            leading: IconButton(
              onPressed: () => context.go(AppRoutes.settings),
              icon: const Icon(Icons.close),
            ),
            title: Text('Theme Settings'.hardcoded),
          ),
          body: GradientBackground(
            gradient: LinearGradient(
              colors: colors.linearGradientBackground,
            ),
            child: ListView.builder(
              itemCount: ThemeMode.values.length,
              itemBuilder: (context, index) => _buildRadioTile(
                title: themeTitleList[index],
                mode: ThemeMode.values[index],
                notifier: notifier,
                colors: colors,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildRadioTile(
      {required String title,
      required ThemeMode mode,
      required ThemeNotifier notifier,
      required CustomColorsTheme colors}) {
    return RadioListTile<ThemeMode>(
      value: mode,
      title: Text(title),
      activeColor: colors.activeNavigationBarColor,
      groupValue: notifier.themeMode,
      onChanged: (val) {
        if (val != null) notifier.setTheme(val);
      },
    );
  }
}
