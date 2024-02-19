import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/snacky_uitl.dart';

class SelectableListItemScreen extends StatelessWidget {
  const SelectableListItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Selectable List Item',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullSelectableListItem(
              title: 'Some title',
              isSelected: true,
              onTap: () => SnackyUtil.show('On tap'),
            ),
            ImpaktfullSelectableListItem(
              title: 'Some title',
              isSelected: false,
              onTap: () => SnackyUtil.show('On tap'),
            ),
            ImpaktfullSelectableListItem(
              title: 'Some title',
              isSelected: true,
              leadingAsset: theme.assets.icons.arrowLeft,
              onTap: () => SnackyUtil.show('On tap'),
            ),
          ],
        ),
      ),
    );
  }
}
