import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullDateTimePicker extends StatelessWidget {
  final String? dateTitle;
  final String? timeTitle;
  final String? dateTimeTitle;
  final DateTime? selectedDateTime;
  final ValueChanged<DateTime> onChanged;
  final DateTime? initialDate;
  final bool vertical;

  const ImpaktfullDateTimePicker({
    required this.selectedDateTime,
    required this.vertical,
    required this.onChanged,
    this.dateTitle,
    this.dateTimeTitle,
    this.timeTitle,
    this.initialDate,
    super.key,
  });

  const ImpaktfullDateTimePicker.vertical({
    required this.selectedDateTime,
    required this.onChanged,
    this.dateTitle,
    this.timeTitle,
    this.initialDate,
    super.key,
  })  : vertical = true,
        dateTimeTitle = null;

  const ImpaktfullDateTimePicker.horizontal({
    required this.selectedDateTime,
    required this.onChanged,
    this.dateTimeTitle,
    this.initialDate,
    super.key,
  })  : vertical = false,
        dateTitle = null,
        timeTitle = null;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) {
        final datePicker = Container(
          padding: EdgeInsets.only(right: vertical ? 0 : 8),
          decoration: BoxDecoration(
            border: vertical
                ? null
                : Border(
                    right: BorderSide(
                      color: theme.colors.separator,
                      width: theme.dimens.borderWidth,
                    ),
                  ),
          ),
          child: ImpaktfullDatePicker(
            initialDate: initialDate ?? DateTime.now(),
            selectedDate: selectedDateTime,
            onChanged: _onDateChanged,
          ),
        );
        return ImpaktfullAutoLayout.vertical(
          children: [
            if (dateTimeTitle != null) ...[
              ImpaktfullListItemTitle(
                title: dateTimeTitle!,
              ),
            ],
            ImpaktfullAutoLayout(
              orientation: vertical
                  ? ImpaktfullAutoLayoutOrientation.vertical
                  : ImpaktfullAutoLayoutOrientation.horizontal,
              spacing: 8,
              children: [
                if (vertical) ...[
                  if (dateTitle != null) ...[
                    ImpaktfullListItemTitle(
                      title: dateTitle!,
                    ),
                  ],
                  datePicker,
                ] else ...[
                  Expanded(
                    child: datePicker,
                  ),
                ],
                if (timeTitle != null) ...[
                  ImpaktfullListItemTitle(
                    title: dateTitle!,
                  ),
                ],
                ImpaktfullTimePicker(
                  selectedTime: selectedDateTime != null
                      ? TimeOfDay.fromDateTime(selectedDateTime!)
                      : TimeOfDay.now(),
                  onChanged: _onTimeOfDayChanged,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _onDateChanged(DateTime date) {
    final time = selectedDateTime != null
        ? TimeOfDay.fromDateTime(selectedDateTime!)
        : TimeOfDay.now();
    onChanged(
      DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      ),
    );
  }

  void _onTimeOfDayChanged(TimeOfDay timeOfDay) {
    final date = selectedDateTime ?? DateTime.now();
    onChanged(
      DateTime(
        date.year,
        date.month,
        date.day,
        timeOfDay.hour,
        timeOfDay.minute,
      ),
    );
  }
}
