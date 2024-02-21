import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/snacky_uitl.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - NavBar',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullNavBar(
              title: 'Title',
              subtitle: 'Subtitle',
              onBackTapped: () => SnackyUtil.show('Back tapped'),
              actions: [
                ImpaktfullNavbarAction(
                  svgIcon: theme.assets.icons.check,
                  onTap: () => SnackyUtil.show('Check tapped'),
                ),
              ],
            ),
            ImpaktfullNavBar(
              title: 'Title',
              onBackTapped: () => SnackyUtil.show('Back tapped'),
              actions: [
                ImpaktfullNavbarAction(
                  svgIcon: theme.assets.icons.check,
                  onTap: () => SnackyUtil.show('Check tapped'),
                ),
              ],
            ),
            ImpaktfullNavBar(
              title: 'Title very long title with extra text that does not fit on 1 or 2 lines',
              subtitle: 'Subtitle',
              onBackTapped: () => SnackyUtil.show('Back tapped'),
              actions: [
                ImpaktfullNavbarAction(
                  svgIcon: theme.assets.icons.check,
                  onTap: () => SnackyUtil.show('Check tapped'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
