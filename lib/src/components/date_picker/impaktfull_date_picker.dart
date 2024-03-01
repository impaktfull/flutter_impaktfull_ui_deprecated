import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker_item.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker_type.dart';
import 'package:impaktfull_ui/src/util/date_extensions.dart';

class ImpaktfullDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onChanged;
  final ImpaktfullDatePickerLocalizations localizations;

  const ImpaktfullDatePicker({
    required this.initialDate,
    this.selectedDate,
    required this.onChanged,
    this.localizations = ImpaktfullDatePickerLocalizations.defaults,
    super.key,
  });

  @override
  State<ImpaktfullDatePicker> createState() => _ImpaktfullDatePickerState();
}

class _ImpaktfullDatePickerState extends State<ImpaktfullDatePicker> {
  var _type = ImpaktfullDatePickerType.days;

  late DateTime _initialDate;
  late DateTime _pageDate;
  final _dates = <DateTime>[];

  String get _title {
    switch (_type) {
      case ImpaktfullDatePickerType.years:
        return 'Select a year';
      case ImpaktfullDatePickerType.months:
        return '${_pageDate.year}';
      case ImpaktfullDatePickerType.days:
        return '${_pageDate.getLocalizedMonth(widget.localizations.months)} ${_pageDate.year}';
    }
  }

  int get _dateRows {
    if (_type == ImpaktfullDatePickerType.years) return 10 ~/ 2;
    if (_type == ImpaktfullDatePickerType.months) return 12 ~/ 3;
    if (_dates.length % 7 == 0) return _dates.length ~/ 7;
    return _dates.length ~/ 7 + 1;
  }

  Iterable<DateTime> _datesForRow(int i) {
    if (_type == ImpaktfullDatePickerType.years) {
      return _dates.getRange(2 * i, 2 * (i + 1));
    }
    if (_type == ImpaktfullDatePickerType.months) {
      return _dates.getRange(3 * i, 3 * (i + 1));
    }
    return _dates.getRange(7 * i, 7 * (i + 1));
  }

  @override
  void initState() {
    super.initState();
    _initialDate = widget.initialDate ?? DateTime.now();
    _pageDate = _initialDate;
  }

  @override
  void didUpdateWidget(covariant ImpaktfullDatePicker oldWidget) {
    final newSelectedDate = widget.selectedDate;
    if (newSelectedDate != null && oldWidget.selectedDate != newSelectedDate) {
      _pageDate = newSelectedDate;
    }

    final initialDate = widget.initialDate;
    if (initialDate != null && oldWidget.initialDate != initialDate) {
      _initialDate = initialDate;
    }
    super.didUpdateWidget(oldWidget);
  }

  void buildDateTimeList() {
    final pageDate = _pageDate.dateOnly();
    final dates = <DateTime>[];
    if (_type == ImpaktfullDatePickerType.days) {
      final daysPageDateMonth = pageDate.getDaysInMonth();
      final days = List.generate(
          daysPageDateMonth, (index) => pageDate.copyWith(day: index + 1));
      final firstWeekday = days.first.weekday;
      if (firstWeekday != 0) {
        final previousMonth = pageDate.getPreviousMonth();
        final daysPreviousMonth = previousMonth.getDaysInMonth();
        final daysBeforeMonth = List.generate(
                firstWeekday - 1,
                (index) =>
                    previousMonth.copyWith(day: daysPreviousMonth - index))
            .reversed;
        dates.addAll(daysBeforeMonth);
      }
      dates.addAll(days);
      final lastWeekday = days.last.weekday;
      if (lastWeekday != 7) {
        final nextMonth = pageDate.getNextMonth();
        final daysAfterMonth = List.generate(
            7 - lastWeekday, (index) => nextMonth.copyWith(day: index + 1));
        dates.addAll(daysAfterMonth);
      }
    } else if (_type == ImpaktfullDatePickerType.months) {
      for (var i = 1; i <= 12; i++) {
        dates.add(pageDate.copyWith(month: i));
      }
    } else if (_type == ImpaktfullDatePickerType.years) {
      final year = pageDate.year;
      final startYear = year - (year % 10);
      for (var i = 0; i <= 10; i++) {
        dates.add(pageDate.copyWith(year: startYear + i));
      }
    }
    _dates.clear();
    _dates.addAll(dates);
  }

  @override
  Widget build(BuildContext context) {
    buildDateTimeList();
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) {
        return ImpaktfullAutoLayout.vertical(
          children: [
            ImpaktfullAutoLayout.horizontal(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_type == ImpaktfullDatePickerType.days) ...[
                  ImpaktfullButton.secondary(
                    label: '<<',
                    onTap: _onDoublePreviousTapped,
                  ),
                ],
                ImpaktfullButton.secondary(
                  label: '<',
                  onTap: _onPreviousTapped,
                ),
                Expanded(
                  child: PlatfomTouchFeedback(
                    onTap: _type == ImpaktfullDatePickerType.years
                        ? null
                        : _onTitleTapped,
                    onLongTap: _onTitleLongTapped,
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: Text(
                        _title,
                        style: theme.textStyles.onCardPrimary.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                ImpaktfullButton.secondary(
                  label: '>',
                  onTap: _onNextTapped,
                ),
                if (_type == ImpaktfullDatePickerType.days) ...[
                  ImpaktfullButton.secondary(
                    label: '>>',
                    onTap: _onDoubleNextTapped,
                  ),
                ],
              ],
            ),
            if (_type == ImpaktfullDatePickerType.days) ...[
              ImpaktfullAutoLayout.horizontal(
                children: [
                  for (var i = 1; i <= 7; i++) ...[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          widget.localizations.weekdays.parse(i),
                          style: theme.textStyles.onCanvasSecondary.body,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
            for (var i = 0; i < _dateRows; i++) ...[
              Builder(builder: (context) {
                return ImpaktfullAutoLayout.horizontal(
                  children: [
                    for (final day in _datesForRow(i)) ...[
                      Expanded(
                        child: DatePickerItem(
                          dateTime: day,
                          type: _type,
                          pageDate: _pageDate,
                          initialDate: _initialDate,
                          selectedDate: widget.selectedDate,
                          localizations: widget.localizations.months,
                          onTap: () => _onTapItem(day),
                        ),
                      ),
                    ]
                  ],
                );
              }),
            ],
          ],
        );
      },
    );
  }

  void _onDoublePreviousTapped() {
    _pageDate = DateTime(_pageDate.year - 1, _pageDate.month, _pageDate.day);
    setState(() {});
  }

  void _onPreviousTapped() {
    if (_type == ImpaktfullDatePickerType.months ||
        _type == ImpaktfullDatePickerType.years) {
      _pageDate = DateTime(_pageDate.year - 10, _pageDate.month, _pageDate.day);
    } else if (_type == ImpaktfullDatePickerType.days) {
      _pageDate = DateTime(_pageDate.year, _pageDate.month - 1, _pageDate.day);
    }
    setState(() {});
  }

  void _onNextTapped() {
    if (_type == ImpaktfullDatePickerType.months ||
        _type == ImpaktfullDatePickerType.years) {
      _pageDate = DateTime(_pageDate.year + 10, _pageDate.month, _pageDate.day);
    } else if (_type == ImpaktfullDatePickerType.days) {
      _pageDate = DateTime(_pageDate.year, _pageDate.month + 1, _pageDate.day);
    }
    setState(() {});
  }

  void _onDoubleNextTapped() {
    _pageDate = DateTime(_pageDate.year + 1, _pageDate.month, _pageDate.day);
    setState(() {});
  }

  void _onTitleTapped() {
    if (_type == ImpaktfullDatePickerType.years) return;
    if (_type == ImpaktfullDatePickerType.months) {
      _type = ImpaktfullDatePickerType.years;
    } else if (_type == ImpaktfullDatePickerType.days) {
      _type = ImpaktfullDatePickerType.months;
    }
    setState(() {});
  }

  void _onTitleLongTapped() {
    _pageDate = DateTime.now();
    _type = ImpaktfullDatePickerType.days;
    setState(() {});
  }

  _onTapItem(DateTime day) {
    if (_type == ImpaktfullDatePickerType.days) {
      if (!day.isSameMonth(_pageDate)) {
        _pageDate = day;
        setState(() {});
      }
      widget.onChanged(day);
    } else if (_type == ImpaktfullDatePickerType.months) {
      _pageDate = _pageDate.copyWith(
        year: day.year,
        month: day.month,
      );
      _type = ImpaktfullDatePickerType.days;
      setState(() {});
    } else if (_type == ImpaktfullDatePickerType.years) {
      _pageDate = _pageDate.copyWith(
        year: day.year,
      );
      _type = ImpaktfullDatePickerType.months;
      setState(() {});
    }
  }
}

class ImpaktfullDatePickerLocalizations {
  static const ImpaktfullDatePickerLocalizations defaults =
      ImpaktfullDatePickerLocalizations(
    months: ImpaktfullDatePickerMonthLocalizations(
      january: 'January',
      february: 'February',
      march: 'March',
      april: 'April',
      may: 'May',
      june: 'June',
      july: 'July',
      august: 'August',
      september: 'September',
      october: 'October',
      november: 'November',
      december: 'December',
    ),
    weekdays: ImpaktfullDatePickerWeekdayLocalizations(
      monday: 'Mo',
      tuesday: 'Tu',
      wednesday: 'We',
      thursday: 'Th',
      friday: 'Fr',
      saturday: 'Sa',
      sunday: 'Su',
    ),
  );

  final ImpaktfullDatePickerMonthLocalizations months;
  final ImpaktfullDatePickerWeekdayLocalizations weekdays;

  const ImpaktfullDatePickerLocalizations({
    required this.months,
    required this.weekdays,
  });
}

class ImpaktfullDatePickerMonthLocalizations {
  final String january;
  final String february;
  final String march;
  final String april;
  final String may;
  final String june;
  final String july;
  final String august;
  final String september;
  final String october;
  final String november;
  final String december;

  const ImpaktfullDatePickerMonthLocalizations({
    required this.january,
    required this.february,
    required this.march,
    required this.april,
    required this.may,
    required this.june,
    required this.july,
    required this.august,
    required this.september,
    required this.october,
    required this.november,
    required this.december,
  });
}

class ImpaktfullDatePickerWeekdayLocalizations {
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;

  const ImpaktfullDatePickerWeekdayLocalizations({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  String parse(int weekday) {
    switch (weekday) {
      case 1:
        return monday;
      case 2:
        return tuesday;
      case 3:
        return wednesday;
      case 4:
        return thursday;
      case 5:
        return friday;
      case 6:
        return saturday;
      case 7:
        return sunday;
      default:
        return '';
    }
  }
}
