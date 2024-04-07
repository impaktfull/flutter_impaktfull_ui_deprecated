import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/nav/impaktfull_wrapper_container.dart';
import 'package:impaktfull_ui/src/util/extensions/context_extensions.dart';

class ImpaktfullTopNavbar extends StatefulWidget {
  final Widget content;
  final Widget? leadingWidget;
  final Widget? centerWidget;
  final Widget? trailingWidget;
  final Alignment inputFieldAlignment;
  final String? inputFieldHintText;
  final ValueChanged<String>? inputFieldOnChanged;

  const ImpaktfullTopNavbar({
    required this.content,
    this.centerWidget,
    this.leadingWidget,
    this.trailingWidget,
    this.inputFieldAlignment = Alignment.center,
    this.inputFieldHintText,
    this.inputFieldOnChanged,
    super.key,
  });

  @override
  State<ImpaktfullTopNavbar> createState() => _ImpaktfullTopNavbarState();
}

class _ImpaktfullTopNavbarState extends State<ImpaktfullTopNavbar> {
  var _isMobileMenuOpen = false;
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) {
        if (!context.isMobile && _isMobileMenuOpen) {
          _isMobileMenuOpen = false;
        }
        final inputField = widget.inputFieldOnChanged == null
            ? null
            : Align(
                alignment: widget.inputFieldAlignment,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: context.isMobile ? double.infinity : 500),
                  child: ImpaktfullInputField(
                    controller: _textController,
                    onChanged: widget.inputFieldOnChanged!,
                    hintText: widget.inputFieldHintText,
                  ),
                ),
              );
        return ColoredBox(
          color: _isMobileMenuOpen ? theme.colors.primary : Colors.transparent,
          child: ImpaktfullAutoLayout.vertical(
            children: [
              ColoredBox(
                color: theme.colors.primary,
                child: ImpaktfullWrapperContainer(
                  child: ImpaktfullAutoLayout.horizontal(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(),
                      if (widget.leadingWidget != null) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: widget.leadingWidget!,
                        ),
                      ],
                      if (widget.centerWidget != null) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: widget.centerWidget!,
                        ),
                      ],
                      if (context.isMobile) ...[
                        const Spacer(),
                        ImpaktfullNavbarAction(
                          svgIcon: _isMobileMenuOpen
                              ? theme.assets.icons.close
                              : theme.assets.icons.menu,
                          onTap: _onOpenMenuTapped,
                        ),
                      ] else ...[
                        if (widget.inputFieldOnChanged != null) ...[
                          Expanded(
                            child: inputField!,
                          ),
                        ],
                        if (widget.trailingWidget != null) ...[
                          widget.trailingWidget!,
                        ],
                      ],
                      const SizedBox(),
                    ],
                  ),
                ),
              ),
              if (context.isMobile && _isMobileMenuOpen) ...[
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: SafeArea(
                      child: ImpaktfullAutoLayout.vertical(
                        children: [
                          if (widget.inputFieldOnChanged != null) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: inputField!,
                            ),
                          ],
                          if (widget.centerWidget != null) ...[
                            Expanded(
                              child: Center(
                                child: widget.centerWidget!,
                              ),
                            ),
                          ],
                          if (widget.trailingWidget != null) ...[
                            if (widget.centerWidget == null) ...[
                              const Spacer(),
                            ],
                            widget.trailingWidget!,
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ] else ...[
                Expanded(
                  child: widget.content,
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  void _onOpenMenuTapped() {
    setState(() => _isMobileMenuOpen = !_isMobileMenuOpen);
  }
}
