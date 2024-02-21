import 'package:impaktfull_ui/impaktfull_ui.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({
    super.key,
  });

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  var _value = 0;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - RadioButton List Item',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullRadioButtonListItem(
              title: 'This is a title',
              value: 1,
              groupValue: _value,
              onSelected: (value) {
                setState(() => _value = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
