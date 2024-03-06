import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullListItemTitle extends StatelessWidget {
  final String title;
  final TextAlign textAlign;

  const ImpaktfullListItemTitle({
    required this.title,
    this.textAlign = TextAlign.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Container(
        padding: EdgeInsets.only(
          top: theme.dimens.listViewTitleVerticalPadding,
          right: theme.dimens.listViewTitleHorizontalPadding,
          left: theme.dimens.listViewTitleHorizontalPadding,
        ),
        child: Text(
          title,
          style: theme.textStyles.onCanvasPrimary.titleSmall,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
