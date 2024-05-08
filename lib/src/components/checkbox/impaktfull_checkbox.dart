import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullCheckBoxTheme {
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? checkMarkColor;
  final Color? backgroundColor;

  const ImpaktfullCheckBoxTheme({
    this.activeColor,
    this.inactiveColor,
    this.checkMarkColor,
    this.backgroundColor,
  });
}

class ImpaktfullCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final ImpaktfullCheckBoxTheme? theme;

  const ImpaktfullCheckBox({
    required this.value,
    required this.onChanged,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Center(
        child: ImpaktfullTouchFeedback(
          onTap: () => onChanged(!value),
          borderRadius:
              BorderRadius.circular(theme.dimens.switchThumbBorderRadius),
          color: _getBackgroundColor(theme),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          theme.dimens.switchThumbBorderRadius),
                      border: Border.all(
                        color: _getInactiveColor(theme),
                        width: theme.dimens.borderWidth,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    duration: theme.durations.short,
                    curve: Curves.easeInOut,
                    opacity: value ? 1 : 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            theme.dimens.switchThumbBorderRadius),
                        border: Border.all(
                          color: _getActiveColor(theme),
                          width: theme.dimens.borderWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    duration: theme.durations.short,
                    curve: Curves.easeInOut,
                    opacity: value ? 1 : 0,
                    child: Center(
                      child: ImpaktfullSvgIcon(
                        asset: theme.assets.icons.check,
                        color: _getCheckMarkColor(theme),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImpaktfullCheckBoxTheme? _getComponentTheme(ImpaktfullTheme theme) =>
      this.theme ?? theme.components.checkBox;

  Color _getInactiveColor(ImpaktfullTheme theme) =>
      _getComponentTheme(theme)?.inactiveColor ??
      theme.colors.accent1TurnedOffState;

  Color _getActiveColor(ImpaktfullTheme theme) =>
      _getComponentTheme(theme)?.activeColor ?? theme.colors.accent1;

  Color _getCheckMarkColor(ImpaktfullTheme theme) =>
      _getComponentTheme(theme)?.checkMarkColor ?? theme.colors.onAccent1;

  Color _getBackgroundColor(ImpaktfullTheme theme) {
    if (value) return _getActiveColor(theme);
    return _getComponentTheme(theme)?.backgroundColor ?? theme.colors.card;
  }
}
