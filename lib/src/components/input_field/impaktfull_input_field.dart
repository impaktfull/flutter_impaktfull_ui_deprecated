import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;
  final bool obscureText;
  final TextInputType textInputType;

  const ImpaktfullInputField({
    required this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
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
          obscureText: obscureText,
          keyboardType: textInputType,
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
