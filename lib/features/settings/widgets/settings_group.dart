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
      margin: margin ?? const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The title
          if (settingsGroupTitle != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                settingsGroupTitle!,
                style: (settingsGroupTitleStyle == null)
                    ? const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    : settingsGroupTitleStyle,
              ),
            )
          else
            Container(),
          // The SettingsGroup sections
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
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
