import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onSelected;

  const ImpaktfullRadioButton({
    required this.value,
    required this.groupValue,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Center(
        child: ImpaktfullTouchFeedback(
          onTap: () => onSelected(value),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                    opacity: isSelected ? 1 : 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
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
                    opacity: isSelected ? 1 : 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.colors.onAccent1,
                        ),
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
