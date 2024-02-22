import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CustomHeader extends ConsumerStatefulWidget {
  const CustomHeader(
      {this.innerBoxIsScrolled,
      this.title = '',
      this.leading,
      this.bottom,
      super.key});
  final bool? innerBoxIsScrolled;
  final String title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  @override
  ConsumerState<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends ConsumerState<CustomHeader>
    with SingleTickerProviderStateMixin {
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
    final darkMode = AppTheme.darkMode(context);

    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        bool isFullyCollapsed = constraints.scrollOffset == 0;

        return SliverAppBar(
          shadowColor: Colors.black12.withOpacity(0.5),
          foregroundColor: colors.labelColor,
          collapsedHeight: 60,
          expandedHeight: 140,
          bottom: widget.bottom,
          leading: widget.leading,
          pinned: true,
          centerTitle: true,
          forceElevated: widget.innerBoxIsScrolled ?? false,
          title: AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            secondChild: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            firstChild: ClipOval(
              child: SizedBox(
                width: Sizes.p48,
                height: Sizes.p48,
                child: SvgPicture.asset(
                  darkMode
                      ? Assets.icons.appIconDarkThemeTransparentBgSvg
                      : Assets.icons.appIconTransparentBgSvg,
                  semanticsLabel: 'DevFin Logo',
                ),
              ),
            ),
            crossFadeState: isFullyCollapsed
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
          flexibleSpace: isFullyCollapsed
              ? FlexibleSpaceBar(
                  centerTitle: false,
                  collapseMode: CollapseMode.none,
                  stretchModes: const [StretchMode.blurBackground],
                  titlePadding:
                      const EdgeInsets.only(left: Sizes.p16, bottom: Sizes.p48),
                  title: Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: colors.labelColor),
                  ),
                  background: const GradientBackground(),
                )
              : const GradientBackground(),
          actions: [
            _buildActionButton(
              icon: Icons.search_rounded,
              onPressed: () {},
            ),
            _buildActionButton(
              icon: Icons.notifications_none_rounded,
              onPressed: () {},
              isShowBadge: true,
            ),
            gapW8,
          ],
        );
      },
    );
  }

  Widget _buildActionButton(
      {required IconData icon,
      required void Function()? onPressed,
      bool isShowBadge = false}) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          iconSize: Sizes.p24,
          onPressed: onPressed,
        ),
        if (isShowBadge)
          Positioned(
            right: Sizes.p8,
            top: Sizes.p8,
            child: Container(
              padding: const EdgeInsets.all(Sizes.p2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(Sizes.p4),
              ),
              constraints: const BoxConstraints(
                minWidth: Sizes.p16,
                minHeight: Sizes.p16,
              ),
              child: const Text(
                '99+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.p8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
