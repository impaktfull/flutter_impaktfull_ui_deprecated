import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/snacky_uitl.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Buttons',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullButton.primary(
              label: 'Primary Button',
              onTap: () => SnackyUtil.show('On Primary tapped'),
            ),
            ImpaktfullButton.secondary(
              label: 'Secondary Button',
              onTap: () => SnackyUtil.show('On Secondary tapped'),
            ),
            ImpaktfullButton.accent(
              label: 'Accent Button',
              onTap: () => SnackyUtil.show('On Accent tapped'),
            ),
            ImpaktfullButton.accent(
              label: 'Loading button on tap',
              onAsyncTap: () => Future.delayed(const Duration(seconds: 2)),
            ),
          ],
        ),
      ),
    );
  }
}
