import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/example_assets.dart';
import 'package:impaktfull_ui_example/src/util/snacky_uitl.dart';

class FabScreen extends StatelessWidget {
  const FabScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Fab',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            Center(
              child: ImpaktfullFab(
                asset: ExampleAssets.add,
                onTap: () => SnackyUtil.show('OnTap'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
