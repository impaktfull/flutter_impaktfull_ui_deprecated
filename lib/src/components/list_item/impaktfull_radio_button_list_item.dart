import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/list_item/impaktfull_simple_list_item.dart';
import 'package:impaktfull_ui/src/components/radio_button/impaktfull_radio_button.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullRadioButtonListItem<T> extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? leadingAsset;
  final T value;
  final T groupValue;
  final ValueChanged<T> onSelected;

  const ImpaktfullRadioButtonListItem({
    required this.title,
    required this.value,
    required this.groupValue,
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
        trailingWidget: ImpaktfullRadioButton(
          value: value,
          groupValue: groupValue,
          onSelected: onSelected,
        ),
      ),
    );
  }
}
