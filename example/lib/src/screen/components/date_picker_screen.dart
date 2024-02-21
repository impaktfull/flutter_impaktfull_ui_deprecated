import 'package:impaktfull_ui/impaktfull_ui.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({
    super.key,
  });

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  final _initialDate = DateTime.now();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Date Picker',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullDatePicker(
              initialDate: _initialDate,
              selectedDate: _selectedDate,
              onChanged: (value) {
                setState(() => _selectedDate = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
