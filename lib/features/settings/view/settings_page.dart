import 'dart:math' as math;

import 'package:devfin/app/app.dart';
import 'package:devfin/features/profile/widgets/widgets.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  static const _imgHeight = 80.0;
  static const _expandedHeight = 120.0;

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

    return EasyRefresh(
      header: BuilderHeader(
        clamping: false,
        position: IndicatorPosition.locator,
        triggerOffset: 100000,
        notifyWhenInvisible: true,
        builder: (context, state) {
          const expandedExtent = _expandedHeight - kToolbarHeight;
          final pixels = state.notifier.position.pixels;
          final height = state.offset + _imgHeight;
          final clipEndHeight = pixels < expandedExtent
              ? _imgHeight
              : math.max(0.0, _imgHeight - pixels + expandedExtent);
          final imgHeight = pixels < expandedExtent
              ? _imgHeight
              : math.max(0.0, _imgHeight - (pixels - expandedExtent));
          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: _TrapezoidClipper(
                  height: height,
                  clipStartHeight: 0.0,
                  clipEndHeight: clipEndHeight,
                ),
                child: Container(
                  height: height,
                  width: double.infinity,
                  color: themeData.colorScheme.primary,
                ),
              ),
              Positioned(
                top: -1,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: _FillLineClipper(imgHeight),
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    color: themeData.colorScheme.primary,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: ClipOval(
                  child: Image.asset(
                    Assets.icons.launcherIcon.path,
                    height: imgHeight,
                    width: imgHeight,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      onRefresh: () {},
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: themeData.colorScheme.primary,
            foregroundColor: themeData.colorScheme.onPrimary,
            expandedHeight: _expandedHeight,
            pinned: true,
            leading: const SizedBox.shrink(),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Huy Nguyen',
                style: TextStyle(color: themeData.colorScheme.onPrimary),
              ),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 16),
            ),
          ),
          const HeaderLocator.sliver(paintExtent: 80),
          SliverToBoxAdapter(
            child: Card(
              elevation: 0,
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  SettingsGroup(
                    items: [
                      SettingsItem(
                        onTap: () {},
                        icons: CupertinoIcons.pencil_outline,
                        iconStyle: IconStyle(),
                        title:
                            'Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance',
                        subtitle:
                            "Make Ziar'App yours Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance",
                        titleMaxLine: 1,
                        subtitleMaxLine: 1,
                      ),
                      SettingsItem(
                        onTap: () {},
                        icons: Icons.dark_mode_rounded,
                        iconStyle: IconStyle(
                          iconsColor: Colors.white,
                          withBackground: true,
                          backgroundColor: Colors.red,
                        ),
                        title: 'Dark mode',
                        subtitle: "Automatic",
                        trailing: Switch.adaptive(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  SettingsGroup(
                    items: [
                      SettingsItem(
                        onTap: () {},
                        icons: Icons.info_rounded,
                        iconStyle: IconStyle(
                          backgroundColor: Colors.purple,
                        ),
                        title: 'About',
                        subtitle: "Learn more about Ziar'App",
                      ),
                    ],
                  ),
                  // You can add a settings title
                  SettingsGroup(
                    settingsGroupTitle: "Account",
                    items: [
                      SettingsItem(
                        onTap: () {},
                        icons: Icons.exit_to_app_rounded,
                        title: "Sign Out",
                      ),
                      SettingsItem(
                        onTap: () {},
                        icons: CupertinoIcons.repeat,
                        title: "Change email",
                      ),
                      SettingsItem(
                        onTap: () {},
                        icons: CupertinoIcons.delete_solid,
                        title: "Delete account",
                        titleStyle: TextStyle(
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
      ),
    );
  }
}

class _TrapezoidClipper extends CustomClipper<Path> {
  final double height;
  final double clipStartHeight;
  final double clipEndHeight;

  _TrapezoidClipper({
    required this.height,
    required this.clipStartHeight,
    required this.clipEndHeight,
  });

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height - clipEndHeight);
    path.lineTo(0, height - clipStartHeight);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_TrapezoidClipper oldClipper) {
    return oldClipper.height != height ||
        oldClipper.clipStartHeight != clipStartHeight ||
        oldClipper.clipEndHeight != clipEndHeight;
  }
}

class _FillLineClipper extends CustomClipper<Path> {
  final double imgHeight;

  _FillLineClipper(this.imgHeight);

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height / 2);
    path.lineTo(0, height / 2 + imgHeight / 2);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _FillLineClipper oldClipper) {
    return oldClipper.imgHeight != imgHeight;
  }
}
