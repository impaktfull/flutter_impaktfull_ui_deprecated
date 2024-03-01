import 'package:impaktfull_ui/impaktfull_ui.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Card',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullCard(
              child: ImpaktfullAutoLayout.vertical(
                spacing: 8,
                children: [
                  Text(
                    'Some normal title',
                    style: theme.textStyles.onCardPrimary.title,
                  ),
                  Text(
                    'And this will be some body text that is a bit longer than the title',
                    style: theme.textStyles.onCardPrimary.body,
                  ),
                ],
              ),
            ),
            ImpaktfullCard(
              isSelected: true,
              child: ImpaktfullAutoLayout.vertical(
                spacing: 8,
                children: [
                  Text(
                    'Some normal title (selected)',
                    style: theme.textStyles.onCardPrimary.title,
                  ),
                  Text(
                    'And this will be some body text that is a bit longer than the title',
                    style: theme.textStyles.onCardPrimary.body,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
