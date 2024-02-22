import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GradientAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const GradientAppBar(
      {required this.leading, this.title, this.bottom, super.key});
  final Widget leading;
  final Widget? title;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;

    return GradientBackground(
      child: AppBar(
        leading: leading,
        backgroundColor: Colors.transparent,
        title: title,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); //remove extra spaces between tabs and appbar
}
