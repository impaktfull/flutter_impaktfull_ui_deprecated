import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/touch_feedback/impaktfull_touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullFab extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;

  const ImpaktfullFab({
    required this.asset,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullTouchFeedback(
        onTap: onTap,
        color: theme.colors.accent1,
        borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
        shadow: [
          if (theme.shadows.button != null) theme.shadows.button!,
        ],
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ImpaktfullSvgIcon(
            asset: asset,
            size: 24,
            color: theme.colors.onAccent1,
          ),
        ),
      ),
    );
  }
}
