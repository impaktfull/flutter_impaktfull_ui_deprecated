import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String format(String format) => DateFormat(format).format(this);

  String getLocalizedMonth(ImpaktfullDatePickerMonthLocalizations localizations) {
    switch (month) {
      case 1:
        return localizations.january;
      case 2:
        return localizations.february;
      case 3:
        return localizations.march;
      case 4:
        return localizations.april;
      case 5:
        return localizations.may;
      case 6:
        return localizations.june;
      case 7:
        return localizations.july;
      case 8:
        return localizations.august;
      case 9:
        return localizations.september;
      case 10:
        return localizations.october;
      case 11:
        return localizations.november;
      case 12:
        return localizations.december;
      default:
        return '';
    }
  }

  DateTime getPreviousMonth() => copyWith(month: month - 1);

  DateTime getPreviousYear() => copyWith(year: year - 1);

  DateTime getNextYear() => copyWith(year: year + 1);

  DateTime getNextMonth() => copyWith(month: month + 1);

  bool isSameYear(DateTime date) => year == date.year;

  bool isSameMonth(DateTime date) => year == date.year && month == date.month;

  bool isSameDay(DateTime date) => year == date.year && month == date.month && day == date.day;

  DateTime dateOnly() => copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    final newYear = year ?? this.year;
    final newMonth = month ?? this.month;
    var newDays = day ?? this.day;
    final daysInNewMonth = _getDaysInMonth(
      year: newYear,
      month: newMonth == 0
          ? 12
          : newMonth == 13
              ? 1
              : newMonth,
    );
    if (newDays > daysInNewMonth) {
      newDays = daysInNewMonth;
    }
    return DateTime(
      newYear,
      newMonth,
      newDays,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  int getDaysInMonth() => _getDaysInMonth(
        year: year,
        month: month,
      );
}

int _getDaysInMonth({
  required int year,
  required int month,
}) {
  // Map to hold the number of days in each month for non-leap years.
  Map<int, int> monthDays = {1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31};

  // Check for leap year and adjust February's days if necessary.
  if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    monthDays[2] = 29; // Adjusting for leap year
  }

  return monthDays[month]!;
}
