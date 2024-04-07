import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? backgroundColor;

  const ImpaktfullSwitch({
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Opacity(
        opacity: onChanged == null ? 0.5 : 1,
        child: ImpaktfullTouchFeedback(
          onTap: onChanged == null ? null : () => onChanged!.call(!value),
          color: backgroundColor ?? theme.colors.card,
          borderRadius: BorderRadius.circular(theme.dimens.switchBorderRadius),
          child: AnimatedContainer(
            duration: theme.durations.short,
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(theme.dimens.switchBorderRadius),
              border: Border.all(
                color: value
                    ? activeColor ?? theme.colors.accent1
                    : inactiveColor ?? theme.colors.accent1TurnedOffState,
                width: theme.dimens.borderWidth,
              ),
            ),
            child: AnimatedPadding(
              padding: EdgeInsets.only(
                top: 4,
                bottom: 4,
                right: value ? 4 : 20,
                left: value ? 20 : 4,
              ),
              curve: Curves.easeInOut,
              duration: theme.durations.short,
              child: AnimatedContainer(
                duration: theme.durations.short,
                curve: Curves.easeInOut,
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: value
                      ? activeColor ?? theme.colors.accent1
                      : inactiveColor ?? theme.colors.accent1TurnedOffState,
                  borderRadius: BorderRadius.circular(
                    theme.dimens.switchThumbBorderRadius,
                  ),
                ),
                child: AnimatedOpacity(
                  opacity: MediaQuery.of(context).accessibleNavigation && value
                      ? 1
                      : 0,
                  duration: theme.durations.short,
                  curve: Curves.easeInOut,
                  child: Transform.scale(
                    scale: 0.75,
                    child: ImpaktfullSvgIcon(
                      asset: theme.assets.icons.check,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
