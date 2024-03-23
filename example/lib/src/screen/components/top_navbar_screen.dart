import 'package:impaktfull_ui/impaktfull_ui.dart';

class TopNavBarScreen extends StatelessWidget {
  const TopNavBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Fab',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullTopNavbar(
          leadingWidget: const ImpaktfullLogo.darkTextLogo(),
          centerWidget: Container(),
          inputFieldHintText: 'What are you looking for?',
          inputFieldOnChanged: (value) {},
          content: Container(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
