import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/impaktfull_auto_layout.dart';
import 'package:impaktfull_ui/src/components/touch_feedback/impaktfull_touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class BaseListItem extends StatelessWidget {
  final Widget? leadingWidget;
  final String title;
  final String? subTitle;
  final Widget? trailingWidget;
  final VoidCallback? onTap;

  const BaseListItem({
    required this.title,
    this.onTap,
    this.subTitle,
    this.leadingWidget,
    this.trailingWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullTouchFeedback(
        onTap: onTap,
        child: ImpaktfullAutoLayout.horizontal(
          crossAxisAlignment: CrossAxisAlignment.center,
          backgroundColor: theme.colors.card,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          spacing: 8,
          children: [
            if (leadingWidget != null) ...[
              leadingWidget!,
            ],
            Expanded(
              child: ImpaktfullAutoLayout.vertical(
                spacing: 2,
                children: [
                  Text(
                    title,
                    style: theme.textStyles.onCardPrimary.body,
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
            if (trailingWidget != null) ...[
              trailingWidget!,
            ],
          ],
        ),
      ),
    );
  }
}
