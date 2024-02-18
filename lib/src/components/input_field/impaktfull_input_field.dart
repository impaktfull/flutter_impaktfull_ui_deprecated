import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;

  const ImpaktfullInputField({
    required this.onChanged,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Container(
        decoration: BoxDecoration(
          color: theme.colors.card,
          borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          cursorColor: theme.colors.accent1,
          decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: theme.textStyles.onCardSecondary.bodyInput,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
