import 'package:impaktfull_ui/impaktfull_ui.dart';

class ListItemTitleScreen extends StatelessWidget {
  const ListItemTitleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - List Item Title',
        onBackTapped: () => Navigator.of(context).pop(),
        child: const ImpaktfullListView(
          children: [
            ImpaktfullListItemTitle(title: 'Some title'),
          ],
        ),
      ),
    );
  }
}
