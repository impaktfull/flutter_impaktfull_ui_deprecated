import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullSeparatedColumn extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final ImpaktfullSeparatorType type;
  final bool showFirstSeparator;
  final bool showLastSeparator;
  final bool clip;

  const ImpaktfullSeparatedColumn({
    required this.children,
    this.title,
    this.type = ImpaktfullSeparatorType.canvas,
    this.showFirstSeparator = false,
    this.showLastSeparator = false,
    this.clip = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullAutoLayout.vertical(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            ImpaktfullListItemTitle(
              title: title!,
            ),
          ],
          ClipRRect(
            borderRadius: clip
                ? BorderRadius.circular(theme.dimens.generalBorderRadius)
                : BorderRadius.zero,
            child: ColoredBox(
              color: type == ImpaktfullSeparatorType.canvas
                  ? Colors.transparent
                  : theme.colors.card,
              child: ImpaktfullAutoLayout.vertical(
                children: children.isEmpty
                    ? []
                    : [
                        for (int i = 0; i < children.length; i++) ...[
                          if (i > 0 || showFirstSeparator)
                            ImpaktfullSeparator(type: type),
                          children[i],
                        ],
                        if (showLastSeparator) ImpaktfullSeparator(type: type),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
