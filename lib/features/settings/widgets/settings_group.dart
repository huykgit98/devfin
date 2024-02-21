import 'package:devfin/features/settings/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// This component group the Settings items (BabsComponentSettingsItem)
/// All one SettingsGroup have a title and the developer can improve the design
class SettingsGroup extends StatelessWidget {
  const SettingsGroup({
    required this.items,
    super.key,
    this.settingsGroupTitle,
    this.settingsGroupTitleStyle,
    this.margin,
    this.iconItemSize = 25,
  });
  final String? settingsGroupTitle;
  final TextStyle? settingsGroupTitleStyle;
  final List<SettingsItem> items;
  final EdgeInsets? margin;
  // Icons size
  final double? iconItemSize;

  @override
  Widget build(BuildContext context) {
    if (iconItemSize != null) {
      SettingsScreenUtils.settingsGroupIconSize = iconItemSize;
    }

    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The title
          if (settingsGroupTitle != null)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                settingsGroupTitle!,
                style: (settingsGroupTitleStyle == null)
                    ? const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                    : settingsGroupTitleStyle,
              ),
            )
          else
            const SizedBox.shrink(),
          // The SettingsGroup sections
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 0,
                  indent: 0,
                  thickness: 1,
                );
              },
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return items[index];
              },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
