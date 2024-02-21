import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/dialog/impaktfull_date_time_picker_dialog.dart';
import 'package:impaktfull_ui/src/util/date_extensions.dart';

class ImpaktfullDateTimeRangePicker extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final ValueChanged<DateTime> onStartDateChanged;
  final ValueChanged<DateTime> onEndDateChanged;
  final String? dateTitle;
  final String? timeTitle;
  final String? startDateHint;
  final String? endDateHint;
  final String dateFormat;

  const ImpaktfullDateTimeRangePicker({
    required this.startDate,
    required this.endDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    this.dateTitle,
    this.timeTitle,
    this.startDateHint,
    this.endDateHint,
    this.dateFormat = 'dd/MM/yyyy HH:mm',
    super.key,
  });

  @override
  State<ImpaktfullDateTimeRangePicker> createState() => _ImpaktfullDateTimeRangePickerState();
}

class _ImpaktfullDateTimeRangePickerState extends State<ImpaktfullDateTimeRangePicker> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (contex, theme) => Container(
        decoration: BoxDecoration(
          color: theme.colors.card,
          borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
        ),
        child: ImpaktfullAutoLayout.horizontal(
          children: [
            Expanded(
              child: ImpaktfullTouchFeedback(
                onTap: _onTapStartDate,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    widget.startDate?.format(widget.dateFormat) ?? widget.startDateHint ?? '',
                    textAlign: TextAlign.center,
                    style: widget.endDate == null ? theme.textStyles.onCardSecondary.body : theme.textStyles.onCardPrimary.body,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ImpaktfullTouchFeedback(
                onTap: _onTapEndDate,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    widget.endDate?.format(widget.dateFormat) ?? widget.endDateHint ?? '',
                    textAlign: TextAlign.center,
                    style: widget.endDate == null ? theme.textStyles.onCardSecondary.body : theme.textStyles.onCardPrimary.body,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapStartDate() async {
    final newDate = await ImpaktfullDateTimePickerDialog.show(
      context: context,
      selectedDateTime: widget.startDate,
    );
    if (newDate == null) return;
    widget.onStartDateChanged(newDate);
  }

  Future<void> _onTapEndDate() async {
    final newDate = await ImpaktfullDateTimePickerDialog.show(
      context: context,
      selectedDateTime: widget.endDate,
      dateTimeTitle: widget.dateTitle,
      timeTitle: widget.timeTitle,
    );
    if (newDate == null) return;
    widget.onEndDateChanged(newDate);
  }
}
