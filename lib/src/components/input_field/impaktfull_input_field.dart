import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullInputField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final String value;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final VoidCallback? onSubmit;

  const ImpaktfullInputField({
    required this.onChanged,
    this.value = '',
    this.controller,
    this.hintText,
    this.title,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onSubmit,
    super.key,
  });

  @override
  State<ImpaktfullInputField> createState() => _ImpaktfullInputFieldState();
}

class _ImpaktfullInputFieldState extends State<ImpaktfullInputField> {
  TextEditingController? _internalTextEditingController;

  TextEditingController get _textEditingController =>
      _internalTextEditingController ?? widget.controller!;
  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalTextEditingController =
          TextEditingController(text: widget.value);
    }
  }

  @override
  void dispose() {
    _internalTextEditingController?.dispose();
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: TextField(
              controller: _textEditingController,
              cursorColor: theme.colors.accent1,
              obscureText: widget.obscureText,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              onSubmitted: (value) => widget.onSubmit?.call(),
              style: theme.textStyles.onCardPrimary.bodyInput,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 4),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: widget.hintText,
                isDense: true,
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
