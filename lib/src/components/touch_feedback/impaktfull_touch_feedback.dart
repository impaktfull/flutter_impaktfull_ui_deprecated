import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullTouchFeedback extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? color;
  final List<BoxShadow> shadow;

  const ImpaktfullTouchFeedback({
    required this.onTap,
    required this.child,
    this.borderRadius,
    this.color,
    this.shadow = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => PlatfomTouchFeedback(
        onTap: onTap,
        borderRadius: borderRadius,
        color: color,
        hoverColor: _getHoverColor(theme),
        androidSplashColor: _getSplashColor(theme),
        shadow: shadow,
        child: child,
      ),
    );
  }

  Color _getHoverColor(ImpaktfullTheme theme) {
    final themeColors = [
      theme.textStyles.onCanvasPrimary.button.color,
      theme.colors.accent1,
    ];
    if (color != null && themeColors.contains(color)) {
      return Colors.white.withOpacity(0.1);
    } else {
      return theme.colors.accent1.withOpacity(0.1);
    }
  }

  Color _getSplashColor(ImpaktfullTheme theme) {
    final themeColors = [
      theme.textStyles.onCanvasPrimary.button.color,
      theme.colors.accent1,
    ];
    if (color != null && themeColors.contains(color)) {
      return Colors.white.withOpacity(0.25);
    } else {
      return theme.colors.accent1.withOpacity(0.25);
    }
  }
}

class PlatfomTouchFeedback extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? hoverColor;
  final Color? androidSplashColor;
  final List<BoxShadow> shadow;

  const PlatfomTouchFeedback({
    required this.onTap,
    required this.child,
    this.onLongTap,
    this.borderRadius,
    this.color,
    this.hoverColor,
    this.androidSplashColor,
    this.shadow = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap == null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color ?? Colors.transparent,
          boxShadow: shadow,
        ),
        child: child,
      );
    }
    final isAndroid = Theme.of(context).platform == TargetPlatform.android;
    return ImpaktfullThemeLocalizer(
      builder: (contex, theme) => Container(
        decoration: BoxDecoration(
          boxShadow: shadow,
        ),
        child: Material(
          borderRadius: borderRadius,
          color: color ?? Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onTap,
            onLongPress: onLongTap,
            hoverColor: hoverColor,
            splashColor: androidSplashColor,
            splashFactory:
                isAndroid ? theme.splashFactory : NoSplash.splashFactory,
            child: ColoredBox(
              color: Colors.transparent,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
