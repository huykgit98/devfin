import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_tab_bar.dart';

class CustomHeader extends ConsumerStatefulWidget {
  const CustomHeader(
      {required this.innerBoxIsScrolled,
      required this.tabController,
      required this.tabs,
      required this.onTapTapped,
      required this.isFullyExpanded,
      this.title = '',
      this.expandedHeight = 180.0,
      super.key});
  final bool innerBoxIsScrolled;
  final TabController tabController;
  final List<Widget> tabs;
  final void Function(int)? onTapTapped;
  final String title;
  final bool isFullyExpanded;

  final double expandedHeight;

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
    final darkMode = ref.watch(darkModeProvider);

    return SliverAppBar(
      shadowColor: Colors.black12.withOpacity(0.5),
      // backgroundColor: Colors.transparent,
      foregroundColor: darkMode ? Colors.white : Colors.black,
      collapsedHeight: 60,

      bottom: CustomTabBar(
        tabController: widget.tabController,
        tabs: widget.tabs,
        onTap: widget.onTapTapped,
      ),
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.barsStaggered),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      pinned: true,
      centerTitle: true,
      forceElevated: widget.innerBoxIsScrolled,
      title: AnimatedCrossFade(
        duration: const Duration(milliseconds: 500),
        secondChild: Text(
          widget.title,
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
        crossFadeState: widget.isFullyExpanded
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
      expandedHeight: widget.expandedHeight,
      flexibleSpace: widget.isFullyExpanded
          ? FlexibleSpaceBar(
              centerTitle: false,
              collapseMode: CollapseMode.none,
              stretchModes: const [StretchMode.blurBackground],
              titlePadding:
                  const EdgeInsets.only(left: Sizes.p16, bottom: Sizes.p48),
              title: Text(
                widget.title,
                style: TextStyle(color: darkMode ? Colors.white : Colors.black),
              ),
              background: GradientBackground(
                gradient: LinearGradient(
                  colors: darkMode
                      ? ColorsUtil.darkLinearGradient
                      : ColorsUtil.lightLinearGradient,
                ),
              ),
            )
          : GradientBackground(
              gradient: LinearGradient(
                colors: darkMode
                    ? ColorsUtil.darkLinearGradient
                    : ColorsUtil.lightLinearGradient,
              ),
            ),

      actions: [
        _buildActionButton(
          icon: Icons.search_rounded,
          onPressed: () {},
        ),
        _buildActionButton(
          icon: Icons.chat_bubble_outline_rounded,
          onPressed: () {},
          isShowBadge: true,
        ),
        _buildActionButton(
          icon: Icons.notifications_none_rounded,
          onPressed: () {},
          isShowBadge: true,
        ),
        gapW8,
      ],
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
