import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/list_item/impaktfull_simple_list_item.dart';
import 'package:impaktfull_ui/src/components/switch/impaktfull_switch.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullSwitchListItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? leadingAsset;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final EdgeInsetsGeometry padding;
  final double spacing;

  const ImpaktfullSwitchListItem({
    required this.title,
    required this.value,
    this.onChanged,
    this.subTitle,
    this.leadingAsset,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.spacing = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => IgnorePointer(
        ignoring: onChanged == null,
        child: ImpaktfullSimpleListItem(
          title: title,
          subTitle: subTitle,
          spacing: spacing,
          padding: padding,
          onTap: () => onChanged?.call(!value),
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
      ),
    );
  }
}
