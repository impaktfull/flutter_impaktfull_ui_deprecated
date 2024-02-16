import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/touch_feedback/impaktfull_touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

enum _ButtonType {
  primary,
  secondary,
  accent,
}

class ImpaktfullButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final _ButtonType _type;

  const ImpaktfullButton.primary({
    required this.label,
    required this.onTap,
    super.key,
  }) : _type = _ButtonType.primary;

  const ImpaktfullButton.secondary({
    required this.label,
    required this.onTap,
    super.key,
  }) : _type = _ButtonType.secondary;

  const ImpaktfullButton.accent({
    required this.label,
    required this.onTap,
    super.key,
  }) : _type = _ButtonType.accent;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Opacity(
        opacity: onTap == null ? 0.3 : 1,
        child: IgnorePointer(
          ignoring: onTap == null,
          child: ImpaktfullTouchFeedback(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: _getBackground(theme),
                borderRadius:
                    BorderRadius.circular(theme.dimens.generalBorderRadius),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              child: Text(
                label,
                style: _getTextStyle(theme).title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackground(ImpaktfullTheme theme) {
    if (onTap == null) return theme.colors.primary;
    switch (_type) {
      case _ButtonType.primary:
        return theme.colors.primary;
      case _ButtonType.secondary:
        return Colors.transparent;
      case _ButtonType.accent:
        return theme.colors.accent1;
    }
  }

  ImpaktfullTextStyleTheme _getTextStyle(ImpaktfullTheme theme) {
    switch (_type) {
      case _ButtonType.primary:
        return theme.textStyles.onPrimary;
      case _ButtonType.secondary:
        return theme.textStyles.onCanvasPrimary;
      case _ButtonType.accent:
        return theme.textStyles.onAccent1;
    }
  }
}
