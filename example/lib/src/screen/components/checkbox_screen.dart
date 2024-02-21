import 'package:impaktfull_ui/impaktfull_ui.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({
    super.key,
  });

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  var _value = true;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Checkbox',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullCheckBox(
              value: _value,
              onChanged: (value) {
                setState(() => _value = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
