import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullListItemTitle extends StatelessWidget {
  final String title;

  const ImpaktfullListItemTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Container(
        padding: EdgeInsets.only(
          top: theme.dimens.listViewVerticalPadding,
          right: theme.dimens.listViewHorizontalPadding,
          left: theme.dimens.listViewHorizontalPadding,
        ),
        child: Text(
          title,
          style: theme.textStyles.onCanvasPrimary.titleSmall,
        ),
      ),
    );
  }
}
