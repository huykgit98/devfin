import 'package:devfin/app/app.dart';
import 'package:devfin/common_widgets/widgets.dart';
import 'package:devfin/features/markets/widgets/widgets.dart';
import 'package:devfin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomHeader extends ConsumerStatefulWidget {
  const CustomHeader(
      {required this.innerBoxIsScrolled,
      required this.tabController,
      required this.tabs,
      required this.onTapTapped,
      this.title = '',
      super.key});
  final bool innerBoxIsScrolled;
  final TabController tabController;
  final List<Widget> tabs;
  final void Function(int)? onTapTapped;
  final String title;
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
      // backgroundColor: Colors.transparent,
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
      title: Text(
        widget.title,
        style: TextStyle(color: darkMode ? Colors.white : Colors.black),
      ),
      expandedHeight: 180.0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: const Text('Flight Report'),
        background: GradientBackground(
          gradient: LinearGradient(
            colors: darkMode
                ? ColorsUtil.darkLinearGradient
                : ColorsUtil.lightLinearGradient,
          ),
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
