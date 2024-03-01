import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker_type.dart';
import 'package:impaktfull_ui/src/util/date_extensions.dart';

class DatePickerItem extends StatelessWidget {
  final DateTime dateTime;
  final ImpaktfullDatePickerType type;
  final DateTime pageDate;
  final DateTime initialDate;
  final DateTime? selectedDate;
  final VoidCallback onTap;
  final ImpaktfullDatePickerMonthLocalizations localizations;

  const DatePickerItem({
    required this.dateTime,
    required this.type,
    required this.pageDate,
    required this.initialDate,
    required this.selectedDate,
    required this.onTap,
    required this.localizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullTouchFeedback(
        onTap: onTap,
        borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
        color: _isSelected()
            ? theme.colors.primary
            : _isHighlighted()
                ? theme.colors.accent1.withOpacity(0.05)
                : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(theme.dimens.generalBorderRadius),
            border: Border.all(
              color:
                  _isHighlighted() ? theme.colors.accent1 : Colors.transparent,
              width: theme.dimens.borderWidth,
            ),
          ),
          constraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          alignment: Alignment.center,
          child: Text(
            _getText(),
            style: _getTextStyle(theme),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  TextStyle _getTextStyle(ImpaktfullTheme theme) {
    if (_isSelected()) return theme.textStyles.onPrimary.body;
    if (type == ImpaktfullDatePickerType.months) {
      return theme.textStyles.onCanvasPrimary.body;
    }
    if (type == ImpaktfullDatePickerType.years) {
      return theme.textStyles.onCanvasPrimary.body;
    }
    return dateTime.isSameMonth(pageDate)
        ? theme.textStyles.onCanvasPrimary.body
        : theme.textStyles.onCanvasSecondary.body;
  }

  String _getText() {
    if (type == ImpaktfullDatePickerType.years) return dateTime.year.toString();
    if (type == ImpaktfullDatePickerType.months) {
      return dateTime.getLocalizedMonth(localizations);
    }
    return dateTime.day.toString();
  }

  bool _isHighlighted() {
    if (type == ImpaktfullDatePickerType.days) {
      return dateTime.isSameDay(initialDate);
    } else if (type == ImpaktfullDatePickerType.months) {
      return dateTime.isSameMonth(initialDate);
    } else if (type == ImpaktfullDatePickerType.years) {
      return dateTime.isSameYear(initialDate);
    }
    return false;
  }

  bool _isSelected() {
    if (selectedDate == null) return false;
    if (type == ImpaktfullDatePickerType.days) {
      return dateTime.isSameDay(selectedDate!);
    } else if (type == ImpaktfullDatePickerType.months) {
      return dateTime.isSameMonth(selectedDate!);
    } else if (type == ImpaktfullDatePickerType.years) {
      return dateTime.isSameYear(selectedDate!);
    }
    return false;
  }
}
