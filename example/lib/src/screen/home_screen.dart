import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/screen/components_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'Home',
      child: ImpaktfullListView(
        spacing: 8,
        children: [
          ImpaktfullButton.accent(
            label: 'Components',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ComponentsScreen())),
          ),
        ],
      ),
    );
  }
}
