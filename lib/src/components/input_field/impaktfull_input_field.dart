import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullInputField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? title;
  final String? hintText;
  final String value;
  final bool obscureText;
  final TextInputType textInputType;

  const ImpaktfullInputField({
    required this.onChanged,
    this.value = '',
    this.hintText,
    this.title,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    super.key,
  });

  @override
  State<ImpaktfullInputField> createState() => _ImpaktfullInputFieldState();
}

class _ImpaktfullInputFieldState extends State<ImpaktfullInputField> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullAutoLayout.vertical(
        spacing: 4,
        children: [
          if (widget.title != null) ...[
            ImpaktfullListItemTitle(title: widget.title!),
          ],
          Container(
            decoration: BoxDecoration(
              color: theme.colors.card,
              borderRadius:
                  BorderRadius.circular(theme.dimens.generalBorderRadius),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _textEditingController,
              cursorColor: theme.colors.accent1,
              obscureText: widget.obscureText,
              keyboardType: widget.textInputType,
              decoration: InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: theme.textStyles.onCardSecondary.bodyInput,
              ),
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
