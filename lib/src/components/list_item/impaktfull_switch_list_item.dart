import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/list_item/base_list_item.dart';
import 'package:impaktfull_ui/src/components/switch/impaktfull_switch.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullSwitchListItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? leadingAsset;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ImpaktfullSwitchListItem({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subTitle,
    this.leadingAsset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => BaseListItem(
        title: title,
        subTitle: subTitle,
        onTap: () => onChanged(!value),
        leadingWidget: leadingAsset == null
            ? null
            : ImpaktfullSvgIcon(
                asset: leadingAsset!,
                size: 16,
                color: theme.colors.primary,
              ),
        trailingWidget: ImpaktfullSwitch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
