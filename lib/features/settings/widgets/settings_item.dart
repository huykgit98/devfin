import 'package:devfin/features/settings/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.icons,
    required this.title,
    super.key,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.backgroundColor,
    this.trailing,
    this.onTap,
    this.titleMaxLine,
    this.subtitleMaxLine,
    this.overflow = TextOverflow.ellipsis,
  });
  final IconData icons;
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

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ListTile(
        // dense: true,
        onTap: onTap,
        leading: Icon(
          icons,
          size: SettingsScreenUtils.settingsGroupIconSize,
        ),
        title: Text(
          title,
          style: titleStyle ?? const TextStyle(fontWeight: FontWeight.normal),
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
