import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SymbolItemWidget extends StatelessWidget {
  const SymbolItemWidget({
    required this.title,
    this.icons,
    super.key,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.backgroundColor,
    this.leading,
    this.trailing,
    this.onTap,
    this.titleMaxLine,
    this.subtitleMaxLine,
    this.overflow = TextOverflow.ellipsis,
  });
  final IconData? icons;
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final int? titleMaxLine;
  final int? subtitleMaxLine;
  final TextOverflow? overflow;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        contentPadding: const EdgeInsets.only(
          left: 16,
          right: 8,
        ),
        dense: true,
        onTap: onTap,
        leading: leading ??
            const CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(
                  'https://s2.coinmarketcap.com/static/img/coins/64x64/24478.png'),
            ),
        title: Text(
          title,
          style: titleStyle ?? const TextStyle(fontWeight: FontWeight.bold),
          maxLines: titleMaxLine,
          overflow: titleMaxLine != null ? overflow : null,
        ),
        subtitle: (subtitle != null)
            ? Text(
                subtitle!,
                style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium!,
                maxLines: subtitleMaxLine,
                overflow:
                    subtitleMaxLine != null ? TextOverflow.ellipsis : null,
              )
            : null,
        trailing: (trailing != null)
            ? trailing
            : const Icon(
                Icons.navigate_next,
              ),
      ),
    );
  }
}
