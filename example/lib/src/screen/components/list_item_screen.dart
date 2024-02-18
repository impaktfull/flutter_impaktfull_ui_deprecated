import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/snacky_uitl.dart';

class ListItemScreen extends StatelessWidget {
  const ListItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - List Item',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          children: [
            const ImpaktfullListItem(title: 'Some title'),
            const ImpaktfullListItem(
              title: 'Some title',
              subTitle: 'Some subtitle',
            ),
            ImpaktfullListItem(
              title: 'Some title',
              subTitle: 'Some subtitle',
              onTap: () => SnackyUtil.show('on tap'),
            ),
            ImpaktfullListItem(
              title: 'Some title',
              subTitle: 'Some subtitle',
              onAsyncTap: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
            ),
            ImpaktfullListItem(
              title: 'Some title',
              subTitle: 'Some subtitle',
              leadingAsset: theme.assets.icons.check,
            ),
          ],
        ),
      ),
    );
  }
}
