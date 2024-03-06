import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/list_item/impaktfull_simple_list_item.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';
import 'package:impaktfull_ui/src/util/asset_util.dart';

class ImpaktfullSelectableListItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? leadingAsset;
  final bool isSelected;
  final VoidCallback onTap;

  const ImpaktfullSelectableListItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
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
        onTap: onTap,
        leadingWidget: leadingAsset == null
            ? null
            : ImpaktfullSvgIcon(
                asset: leadingAsset!,
                size: 16,
                color: AssetUtil.isIcon(leadingAsset!)
                    ? theme.colors.primary
                    : null,
              ),
        trailingWidget: AnimatedOpacity(
          opacity: isSelected ? 1 : 0,
          duration: theme.durations.short,
          curve: Curves.easeInOut,
          child: ImpaktfullSvgIcon(
            asset: theme.assets.icons.check,
            color: theme.colors.accent1,
          ),
        ),
      ),
    );
  }
}
