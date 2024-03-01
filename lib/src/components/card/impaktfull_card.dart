import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullCard extends StatelessWidget {
  final Widget child;
  final bool isSelected;

  const ImpaktfullCard({
    required this.child,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) {
        final border =
            isSelected ? theme.borders.selectedCard : theme.borders.card;
        final shadow =
            isSelected ? theme.shadows.selectedCard : theme.shadows.card;
        return Container(
          decoration: BoxDecoration(
            color: theme.colors.card,
            border: border,
            borderRadius:
                BorderRadius.circular(theme.dimens.generalBorderRadius),
            boxShadow: [
              if (shadow != null) shadow,
            ],
          ),
          padding: EdgeInsets.only(
            top: 16 - (border?.top.width ?? 0),
            right: 16 - (border?.right.width ?? 0),
            bottom: 16 - (border?.bottom.width ?? 0),
            left: 16 - (border?.left.width ?? 0),
          ),
          child: child,
        );
      },
    );
  }
}
