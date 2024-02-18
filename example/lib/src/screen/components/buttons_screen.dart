import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/snacky_uitl.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, teme) => ImpaktfullScreen(
        title: 'Components - Buttons',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          children: [
            ImpaktfullButton.primary(
              label: 'Primary Button',
              onTap: () => SnackyUtil.show('On Primary tapped'),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.secondary(
              label: 'Secondary Button',
              onTap: () => SnackyUtil.show('On Secondary tapped'),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.accent(
              label: 'Accent Button',
              onTap: () => SnackyUtil.show('On Accent tapped'),
            ),
          ],
        ),
      ),
    );
  }
}
