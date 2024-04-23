import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/impaktfull_auto_layout.dart';
import 'package:impaktfull_ui/src/components/touch_feedback/impaktfull_touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullSimpleListItem extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? leadingWidget;
  final Widget? centerWidget;
  final String title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final Widget? trailingWidget;
  final VoidCallback? onTap;
  final bool danger;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final Color? backgroundColor;

  const ImpaktfullSimpleListItem({
    required this.title,
    this.titleStyle,
    this.onTap,
    this.subTitle,
    this.subTitleStyle,
    this.leadingWidget,
    this.trailingWidget,
    this.danger = false,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.spacing = 8,
    this.backgroundColor,
    super.key,
  })  : centerWidget = null,
        crossAxisAlignment = CrossAxisAlignment.center;

  const ImpaktfullSimpleListItem.centerWidget({
    required this.centerWidget,
    this.onTap,
    this.leadingWidget,
    this.trailingWidget,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.spacing = 8,
    this.backgroundColor,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    super.key,
  })  : title = '',
        subTitle = null,
        danger = false,
        titleStyle = null,
        subTitleStyle = null;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullTouchFeedback(
        onTap: onTap,
        color: backgroundColor ?? theme.colors.card,
        child: Padding(
          padding: padding,
          child: ImpaktfullAutoLayout.horizontal(
            crossAxisAlignment: crossAxisAlignment,
            spacing: spacing,
            children: [
              if (leadingWidget != null) ...[
                leadingWidget!,
              ],
              if (centerWidget == null) ...[
                Expanded(
                  child: ImpaktfullAutoLayout.vertical(
                    spacing: 2,
                    children: [
                      Text(
                        title,
                        style: titleStyle ?? _getTitleStyle(theme),
                      ),
                      if (subTitle != null) ...[
                        Text(
                          subTitle!,
                          style: subTitleStyle ??
                              theme.textStyles.onCardSecondary.body,
                        ),
                      ],
                    ],
                  ),
                ),
              ] else ...[
                Expanded(
                  child: centerWidget!,
                ),
              ],
              if (trailingWidget != null) ...[
                trailingWidget!,
              ],
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _getTitleStyle(ImpaktfullTheme theme) {
    if (danger) {
      return theme.textStyles.onCardPrimary.body
          .copyWith(color: theme.colors.danger);
    }
    return theme.textStyles.onCardPrimary.body;
  }
}
