import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/logger.dart';

class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({
    super.key,
  });

  @override
  State<TimePickerScreen> createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  var _selectedDate = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Time Picker',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullTimePicker(
              selectedTime: _selectedDate,
              onChanged: (value) {
                Logger.log('Selected Time: $value');
                setState(() => _selectedDate = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
