import 'package:impaktfull_ui/impaktfull_ui.dart';

class InputFieldScreen extends StatelessWidget {
  const InputFieldScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - InputField',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullInputField(
              onChanged: (value) {},
              hintText: 'Some hint text',
            ),
          ],
        ),
      ),
    );
  }
}
