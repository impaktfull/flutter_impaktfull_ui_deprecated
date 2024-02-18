import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullSeparatedColumn extends StatelessWidget {
  final List<Widget> children;
  final ImpaktfullSeparatorType type;

  const ImpaktfullSeparatedColumn({
    required this.children,
    this.type = ImpaktfullSeparatorType.canvas,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
          color: type == ImpaktfullSeparatorType.canvas ? Colors.transparent : theme.colors.card,
        ),
        child: Column(
          children: children.isEmpty
              ? []
              : [
                  for (int i = 0; i < children.length; i++) ...[
                    if (i > 0) ImpaktfullSeparator(type: type),
                    children[i],
                  ],
                ],
        ),
      ),
    );
  }
}
