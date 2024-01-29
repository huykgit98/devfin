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
          iconSize: 32,
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: darkMode ? const Color(0xFFA6A6AA) : Colors.black38,
          ),
          prefixIcon: const Icon(Icons.search_rounded, size: 24),
          filled: true,
          fillColor: darkMode ? const Color(0xFF323340) : Colors.white,
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(
              color: darkMode ? Colors.grey : Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
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
          onPressed: () {},
        ),
        Positioned(
          right: 11,
          top: 11,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: const Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
