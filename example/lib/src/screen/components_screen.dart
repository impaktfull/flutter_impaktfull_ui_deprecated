import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/screen/components/bottom_navigation_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/buttons_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/checkbox_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/date_picker_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/date_time_picker_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/date_time_range_picker_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/input_field_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/list_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/list_item_title_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/listview_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/loading_indicator_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/nav_bar_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/radiobutton_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/selectable_list_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/separated_column_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/switch_list_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/tab_bar_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/switch_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/time_picker_screen.dart';

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
          spacing: 8,
          children: [
            ImpaktfullButton.accent(
              label: 'BottomNavigation',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNavigationScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'Buttons',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ButtonsScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'Checkbox',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckboxScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'DatePicker',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DatePickerScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'DateTimePicker',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DateTimePickerScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'DateTimeRangePicker',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DateTimeRangePickerScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'InputField',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InputFieldScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'List Item Title',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListItemTitleScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'List Item',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListItemScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'ListViews',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListViewScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'LoadingIndicator',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoadingIndicatorScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'NavBar',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NavBarScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'RadioButton',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RadioButtonScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'Selectable List Item',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectableListItemScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'SeparatedColumn',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SeparatedColumnScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'Switch',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SwitchScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'Switch List Item',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SwitchListItemScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'Tabbar',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TabBarScreen())),
            ),
            ImpaktfullButton.accent(
              label: 'Time Picker',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TimePickerScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
