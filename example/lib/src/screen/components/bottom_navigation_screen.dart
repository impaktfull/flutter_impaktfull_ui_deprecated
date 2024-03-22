import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/example_assets.dart';

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
          spacing: 8,
          children: [
            ImpaktfullBottomNavigation(
              items: [
                ImpaktfullBottomNavigationItem(
                  label: 'Home',
                  svgIcon: ExampleAssets.home,
                  isSelected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Search',
                  svgIcon: ExampleAssets.search,
                  isSelected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Settings',
                  svgIcon: ExampleAssets.settings,
                  isSelected: _selectedIndex == 2,
                  onTap: () => setState(() => _selectedIndex = 2),
                ),
              ],
            ),
            ImpaktfullBottomNavigation(
              items: [
                ImpaktfullBottomNavigationItem(
                  label: 'Home',
                  svgIcon: ExampleAssets.home,
                  svgIconSelected: ExampleAssets.homeSelected,
                  isSelected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Search',
                  svgIcon: ExampleAssets.search,
                  svgIconSelected: ExampleAssets.searchSelected,
                  isSelected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Settings',
                  svgIcon: ExampleAssets.settings,
                  svgIconSelected: ExampleAssets.settingsSelected,
                  isSelected: _selectedIndex == 2,
                  onTap: () => setState(() => _selectedIndex = 2),
                ),
              ],
            ),
            ImpaktfullBottomNavigation(
              items: [
                ImpaktfullBottomNavigationItem(
                  label: 'Home',
                  svgIcon: ExampleAssets.home,
                  svgIconSelected: ExampleAssets.homeSelected,
                  isSelected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Search',
                  svgIcon: ExampleAssets.search,
                  svgIconSelected: ExampleAssets.searchSelected,
                  isSelected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Settings',
                  svgIcon: ExampleAssets.settings,
                  svgIconSelected: ExampleAssets.settingsSelected,
                  isSelected: _selectedIndex == 2,
                  onTap: () => setState(() => _selectedIndex = 2),
                  showBadge: true,
                ),
              ],
            ),
            ImpaktfullBottomNavigation(
              items: [
                ImpaktfullBottomNavigationItem(
                  label: 'Home',
                  svgIcon: ExampleAssets.home,
                  svgIconSelected: ExampleAssets.homeSelected,
                  isSelected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Search',
                  svgIcon: ExampleAssets.search,
                  svgIconSelected: ExampleAssets.searchSelected,
                  isSelected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Settings',
                  svgIcon: ExampleAssets.settings,
                  svgIconSelected: ExampleAssets.settingsSelected,
                  isSelected: _selectedIndex == 2,
                  onTap: () => setState(() => _selectedIndex = 2),
                  badgeText: '12',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
