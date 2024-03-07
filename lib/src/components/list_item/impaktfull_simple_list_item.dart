import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/impaktfull_auto_layout.dart';
import 'package:impaktfull_ui/src/components/touch_feedback/impaktfull_touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullSimpleListItem extends StatelessWidget {
  final Widget? leadingWidget;
  final Widget? centerWidget;
  final String title;
  final String? subTitle;
  final Widget? trailingWidget;
  final VoidCallback? onTap;
  final bool danger;
  final EdgeInsetsGeometry padding;
  final double spacing;

  const ImpaktfullSimpleListItem({
    required this.title,
    this.onTap,
    this.subTitle,
    this.leadingWidget,
    this.trailingWidget,
    this.danger = false,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.spacing = 8,
    super.key,
  }) : centerWidget = null;

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
    super.key,
  })  : title = '',
        subTitle = null,
        danger = false;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullTouchFeedback(
        onTap: onTap,
        color: theme.colors.card,
        child: Padding(
          padding: padding,
          child: ImpaktfullAutoLayout.horizontal(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        style: _getTitleStyle(theme),
                      ),
                      if (subTitle != null) ...[
                        Text(
                          subTitle!,
                          style: theme.textStyles.onCardSecondary.body,
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
