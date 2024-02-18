import 'package:impaktfull_ui/impaktfull_ui.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - BottomNavigation',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          children: [
            ImpaktfullBottomNavigation(
              items: [
                ImpaktfullBottomNavigationItem(
                  label: 'Label 1',
                  svgIcon: theme.assets.icons.chevronRight,
                  isSelected: false,
                  onTap: () {},
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Label 2',
                  svgIcon: theme.assets.icons.chevronRight,
                  isSelected: true,
                  onTap: () {},
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Label 3',
                  svgIcon: theme.assets.icons.chevronRight,
                  isSelected: false,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
