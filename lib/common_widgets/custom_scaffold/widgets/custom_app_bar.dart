import 'package:devfin/app/app.dart';
import 'package:devfin/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.darkMode, super.key});
  final bool darkMode;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Builder(
        builder: (context) => IconButton(
          iconSize: Sizes.p32,
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Search'.hardcoded,
          hintStyle: TextStyle(
            color: darkMode ? const Color(0xFFA6A6AA) : Colors.black38,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: Sizes.p24,
          ),
          filled: true,
          fillColor: darkMode ? const Color(0xFF323340) : Colors.white,
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.all(
            Sizes.p8,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(
              Sizes.p32,
            )),
            borderSide: BorderSide(
              color: darkMode ? Colors.grey : Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(
              Sizes.p32,
            )),
            borderSide: BorderSide(
              color: darkMode ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        _buildNotificationIconButton(Icons.chat_bubble_outline_rounded),
        _buildNotificationIconButton(Icons.notifications_none_rounded),
      ],
    );
  }

  Widget _buildNotificationIconButton(IconData icon) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          iconSize: Sizes.p32,
          onPressed: () {},
        ),
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
