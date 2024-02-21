import 'package:impaktfull_ui/impaktfull_ui.dart';

class DateTimeRangePickerScreen extends StatefulWidget {
  const DateTimeRangePickerScreen({
    super.key,
  });

  @override
  State<DateTimeRangePickerScreen> createState() =>
      _DateTimeRangePickerScreenState();
}

class _DateTimeRangePickerScreenState extends State<DateTimeRangePickerScreen> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Date Time Picker',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullDateTimeRangePicker(
              startDate: _startDate,
              endDate: _endDate,
              onStartDateChanged: (value) => setState(() => _startDate = value),
              onEndDateChanged: (value) => setState(() => _endDate = value),
            ),
          ],
        ),
      ),
    );
  }
}
