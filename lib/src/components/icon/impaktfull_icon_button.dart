import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/touch_feedback/impaktfull_touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullIconButton extends StatelessWidget {
  final String svgIcon;
  final VoidCallback onTap;
  final Color? color;

  const ImpaktfullIconButton({
    required this.svgIcon,
    required this.onTap,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullTouchFeedback(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ImpaktfullSvgIcon(
            asset: svgIcon,
            color: color ?? theme.colors.primary,
          ),
        ),
      ),
    );
  }
}
