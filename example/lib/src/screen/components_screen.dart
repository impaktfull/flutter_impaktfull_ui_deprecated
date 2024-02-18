import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/screen/components/bottom_navigation_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/buttons_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/input_field_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/list_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/list_item_title_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/listview_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/loading_indicator_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/selectable_list_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/separated_column_screen.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          children: [
            ImpaktfullButton.primary(
              label: 'BottomNavigation',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNavigationScreen())),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.primary(
              label: 'Buttons',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ButtonsScreen())),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.primary(
              label: 'InputField',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InputFieldScreen())),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.primary(
              label: 'ListViews',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListViewScreen())),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.primary(
              label: 'List Item Title',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListItemTitleScreen())),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.primary(
              label: 'List Item',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListItemScreen())),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.primary(
              label: 'Selectable List Item',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectableListItemScreen())),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.primary(
              label: 'SeparatedColumn',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SeparatedColumnScreen())),
            ),
            const SizedBox(height: 8),
            ImpaktfullButton.primary(
              label: 'LoadingIndicator',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoadingIndicatorScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
