import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/badge/impaktfull_badge.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';
import 'package:impaktfull_ui/src/components/touch_feedback/impaktfull_touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullBottomNavigationItem extends StatelessWidget {
  final String label;
  final String svgIcon;
  final String? svgIconSelected;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showBadge;
  final String? badgeText;
  final Color? badgeColor;
  final BorderRadius? badgeBorderRadius;

  const ImpaktfullBottomNavigationItem({
    required this.label,
    required this.svgIcon,
    required this.isSelected,
    required this.onTap,
    this.svgIconSelected,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.badgeBorderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ImpaktfullThemeLocalizer(
        builder: (context, theme) => ImpaktfullTouchFeedback(
          onTap: onTap,
          child: ColoredBox(
            color: Colors.transparent,
            child: Column(
              children: [
                const SizedBox(height: 8),
                ImpaktfullBadge(
                  showBadge: showBadge,
                  badgeText: badgeText,
                  color: badgeColor ??
                      (isSelected
                          ? theme.colors.primary
                          : theme.colors.accent1),
                  borderRadius: badgeBorderRadius,
                  child: ImpaktfullSvgIcon(
                    asset: isSelected ? svgIconSelected ?? svgIcon : svgIcon,
                    color: isSelected
                        ? theme.colors.accent1
                        : theme.colors.primary,
                  ),
                ),
                Text(
                  label,
                  style: theme.textStyles.onCanvasPrimary.smallBody.copyWith(
                    color: isSelected
                        ? theme.colors.accent1
                        : theme.colors.primary,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
