import 'package:impaktfull_ui/impaktfull_ui.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({
    super.key,
  });

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  var _selectedIndex = 0;

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
                  isSelected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Label 2',
                  svgIcon: theme.assets.icons.chevronRight,
                  isSelected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Label 3',
                  svgIcon: theme.assets.icons.chevronRight,
                  isSelected: _selectedIndex == 2,
                  onTap: () => setState(() => _selectedIndex = 2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
