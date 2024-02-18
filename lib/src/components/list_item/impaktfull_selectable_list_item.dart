import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/impaktfull_auto_layout.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/touch_feedback/impaktfull_touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullSelectableListItem extends StatelessWidget {
  final String title;
  final String? leadingAsset;
  final bool isSelected;
  final VoidCallback onTap;

  const ImpaktfullSelectableListItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.leadingAsset,
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
            if (leadingAsset != null) ...[
              ImpaktfullSvgIcon(
                asset: leadingAsset!,
                size: 16,
                color: theme.colors.primary,
              ),
            ],
            Expanded(
              child: Text(
                title,
                style: theme.textStyles.onCardPrimary.body,
              ),
            ),
            AnimatedOpacity(
              opacity: isSelected ? 1 : 0,
              duration: theme.durations.short,
              curve: Curves.easeInOut,
              child: ImpaktfullSvgIcon(
                asset: theme.assets.icons.check,
                color: theme.colors.accent1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
