import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/example_assets.dart';
import 'package:impaktfull_ui_example/src/util/snacky_uitl.dart';

class ImpaktfullExampleScreen extends StatefulWidget {
  const ImpaktfullExampleScreen({
    super.key,
  });

  @override
  State<ImpaktfullExampleScreen> createState() =>
      _ImpaktfullExampleScreenState();
}

class _ImpaktfullExampleScreenState extends State<ImpaktfullExampleScreen> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - ListView',
        onBackTapped: () => Navigator.of(context).pop(),
        fab: ImpaktfullFab(
          asset: ExampleAssets.add,
          onTap: () => SnackyUtil.show('On fab tapped!'),
        ),
        actions: [
          ImpaktfullNavbarAction(
            svgIcon: theme.assets.icons.check,
            onTap: _onActionTapped,
          ),
        ],
        bottomAction: ImpaktfullBottomNavigation(
          items: [
            ImpaktfullBottomNavigationItem(
              svgIcon: ExampleAssets.home,
              label: 'Home',
              isSelected: _selectedIndex == 0,
              onTap: () => setState(() => _selectedIndex = 0),
            ),
            ImpaktfullBottomNavigationItem(
              svgIcon: ExampleAssets.search,
              label: 'Search',
              isSelected: _selectedIndex == 1,
              onTap: () => setState(() => _selectedIndex = 1),
            ),
            ImpaktfullBottomNavigationItem(
              svgIcon: ExampleAssets.settings,
              label: 'Settings',
              isSelected: _selectedIndex == 2,
              onTap: () => setState(() => _selectedIndex = 2),
            ),
          ],
        ),
        child: const Placeholder(),
      ),
    );
  }

  void _onActionTapped() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => ImpaktfullBottomSheet(
        title: 'Bottom sheet',
        hasCloseButton: true,
        child: ImpaktfullSeparatedColumn(
          type: ImpaktfullSeparatorType.card,
          children: [
            ImpaktfullListItem(
              title: 'Some item',
              onTap: () => Navigator.of(context).pop(),
            ),
            ImpaktfullListItem(
              title: 'Some item',
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
