import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/screen/home_screen.dart';

void main() => runApp(
      ImpaktfullApp(
        title: 'Impaktfull UI Example',
        impaktfullTheme: ImpaktfullTheme.impaktfullBranding(),
        home: const HomeScreen(),
      ),
    );
