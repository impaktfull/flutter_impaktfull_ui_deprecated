import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/dialog/impaktfull_dialog.dart';

class ImpaktfullDateTimePickerDialog extends StatefulWidget {
  final DateTime? initalSelectedDateTime;
  final DateTime? selectedDateTime;
  final String? dateTimeTitle;
  final String? timeTitle;

  const ImpaktfullDateTimePickerDialog({
    required this.selectedDateTime,
    this.initalSelectedDateTime,
    this.dateTimeTitle,
    this.timeTitle,
    super.key,
  });

  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initalSelectedDateTime,
    DateTime? selectedDateTime,
    String? dateTimeTitle,
    String? timeTitle,
  }) async =>
      showDialog<DateTime>(
        context: context,
        builder: (context) => ImpaktfullDateTimePickerDialog(
          selectedDateTime: selectedDateTime,
          dateTimeTitle: dateTimeTitle,
          timeTitle: timeTitle,
        ),
      );

  @override
  State<ImpaktfullDateTimePickerDialog> createState() => _ImpaktfullDateTimePickerDialogState();
}

class _ImpaktfullDateTimePickerDialogState extends State<ImpaktfullDateTimePickerDialog> {
  DateTime? _initialDateTime;
  DateTime? _selectedDateTime;
  @override
  void initState() {
    super.initState();
    _initialDateTime = widget.initalSelectedDateTime;
    _selectedDateTime = widget.selectedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullDialog(
        onSecondaryTapped: () => Navigator.of(context, rootNavigator: true).pop(),
        onPrimaryTapped: () => Navigator.of(context).pop(_selectedDateTime),
        child: ImpaktfullDateTimePicker(
          vertical: MediaQuery.of(context).size.width < 600,
          initialDate: _initialDateTime,
          selectedDateTime: _selectedDateTime,
          dateTimeTitle: widget.dateTimeTitle,
          timeTitle: widget.timeTitle,
          onChanged: (date) {
            _selectedDateTime = date;
            setState(() {});
          },
        ),
      ),
    );
  }
}
