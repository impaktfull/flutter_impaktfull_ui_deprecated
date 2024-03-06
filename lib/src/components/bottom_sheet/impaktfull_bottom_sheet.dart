import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/impaktfull_auto_layout.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_icon_button.dart';
import 'package:impaktfull_ui/src/components/list_item/impaktfull_list_item_title.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullBottomSheet extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool hasCloseButton;

  const ImpaktfullBottomSheet({
    required this.child,
    this.title,
    this.hasCloseButton = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Container(
        decoration: BoxDecoration(
          color: theme.colors.card,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(theme.dimens.generalBorderRadius),
          ),
        ),
        child: SafeArea(
          top: false,
          child: ImpaktfullAutoLayout.vertical(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              ImpaktfullAutoLayout.horizontal(
                children: [
                  if (hasCloseButton) ...[
                    const SizedBox(width: 48),
                  ],
                  Expanded(
                    child: ImpaktfullAutoLayout.vertical(
                      children: [
                        const SizedBox(height: 8),
                        Center(
                          child: Container(
                            width: 48,
                            height: 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  theme.dimens.generalBorderRadius),
                              color:
                                  theme.textStyles.onCardSecondary.body.color,
                            ),
                          ),
                        ),
                        if (title != null) ...[
                          SizedBox(
                            width: double.infinity,
                            child: ImpaktfullListItemTitle(
                              title: title!,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (hasCloseButton) ...[
                    ImpaktfullIconButton(
                      svgIcon: theme.assets.icons.close,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ]
                ],
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
