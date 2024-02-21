import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ImpaktfullCheckBox({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Center(
        child: ImpaktfullTouchFeedback(
          onTap: () => onChanged(!value),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(theme.dimens.switchThumbBorderRadius),
                      border: Border.all(
                        color: theme.colors.accent2,
                        width: theme.dimens.borderWidth,
                      ),
                      color: theme.colors.card,
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
                        borderRadius: BorderRadius.circular(theme.dimens.switchThumbBorderRadius),
                        color: theme.colors.accent1,
                        border: Border.all(
                          color: theme.colors.accent1,
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
                          color: theme.colors.onAccent1,
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
}
