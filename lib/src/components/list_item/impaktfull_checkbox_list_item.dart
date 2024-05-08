import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/checkbox/impaktfull_checkbox.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/list_item/impaktfull_simple_list_item.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullCheckBoxListItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? leadingAsset;
  final bool value;
  final ValueChanged<bool> onSelected;

  const ImpaktfullCheckBoxListItem({
    required this.title,
    required this.value,
    required this.onSelected,
    this.subTitle,
    this.leadingAsset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullSimpleListItem(
        title: title,
        subTitle: subTitle,
        onTap: () => onSelected(value),
        leadingWidget: leadingAsset == null
            ? null
            : ImpaktfullSvgIcon(
                asset: leadingAsset!,
                size: 16,
                color: theme.colors.primary,
              ),
        trailingWidget: ImpaktfullCheckBox(
          value: value,
          onChanged: onSelected,
        ),
      ),
    );
  }
}
