import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/screen/components/buttons_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/listview_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/loading_indicator_screen.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'Components',
      onBackTapped: () => Navigator.of(context).pop(),
      child: ImpaktfullListView(
        children: [
          ImpaktfullButton.primary(
            label: 'Buttons',
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ButtonsScreen())),
          ),
          const SizedBox(height: 8),
          ImpaktfullButton.primary(
            label: 'ListViews',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListViewScreen())),
          ),
          const SizedBox(height: 8),
          ImpaktfullButton.primary(
            label: 'LoadingIndicator',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoadingIndicatorScreen())),
          ),
        ],
      ),
    );
  }
}
