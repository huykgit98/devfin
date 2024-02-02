import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomHeader extends ConsumerWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      flexibleSpace: GradientBackground(
        gradient: LinearGradient(
          colors: darkMode
              ? ColorsUtil.darkLinearGradient
              : ColorsUtil.lightLinearGradient,
        ),
        child: FlexibleSpaceBar(
          title: Text('Markets'.hardcoded),
          titlePadding: const EdgeInsets.all(0),
          centerTitle: false,
        ),
      ),
    );
  }
}
