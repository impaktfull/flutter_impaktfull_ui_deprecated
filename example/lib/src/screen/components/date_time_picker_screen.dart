import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/logger.dart';

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({
    super.key,
  });

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  final _initialDate = DateTime.now();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Date Time Picker',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullDateTimePicker.horizontal(
              dateTimeTitle: 'Pick a date and time',
              initialDate: _initialDate,
              selectedDateTime: _selectedDate,
              onChanged: (value) {
                Logger.log('Selected date: $value');
                setState(() => _selectedDate = value);
              },
            ),
            ImpaktfullDateTimePicker.vertical(
              dateTitle: 'Pick a date',
              timeTitle: 'Pick a time',
              initialDate: _initialDate,
              selectedDateTime: _selectedDate,
              onChanged: (value) {
                Logger.log('Selected date: $value');
                setState(() => _selectedDate = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
