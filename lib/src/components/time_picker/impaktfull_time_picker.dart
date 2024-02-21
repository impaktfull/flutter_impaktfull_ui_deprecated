import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullTimePicker extends StatelessWidget {
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay> onChanged;

  const ImpaktfullTimePicker({
    required this.selectedTime,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Center(
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 100,
            maxWidth: 100,
          ),
          child: Stack(
            children: [
              ImpaktfullAutoLayout.horizontal(
                children: [
                  Expanded(
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: theme.textStyles.onCanvasPrimary.body.fontSize! * 2,
                      perspective: 0.0005,
                      overAndUnderCenterOpacity: 0.6,
                      magnification: 1.25,
                      useMagnifier: true,
                      controller: FixedExtentScrollController(initialItem: selectedTime.hour),
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (value) => onChanged(
                        TimeOfDay(
                          hour: value,
                          minute: selectedTime.minute,
                        ),
                      ),
                      childDelegate: ListWheelChildLoopingListDelegate(
                        children: [
                          for (var i = 0; i <= 23; i++)
                            Center(
                              child: Text(
                                i.toString().padLeft(2, '0'),
                                style: theme.textStyles.onCanvasPrimary.body,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      ':',
                      style: theme.textStyles.onCanvasPrimary.body,
                    ),
                  ),
                  Expanded(
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: theme.textStyles.onCanvasPrimary.body.fontSize! * 2,
                      perspective: 0.0005,
                      overAndUnderCenterOpacity: 0.6,
                      magnification: 1.25,
                      useMagnifier: true,
                      controller: FixedExtentScrollController(initialItem: selectedTime.minute),
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (value) => onChanged(
                        TimeOfDay(
                          minute: value,
                          hour: selectedTime.hour,
                        ),
                      ),
                      childDelegate: ListWheelChildLoopingListDelegate(
                        children: [
                          for (var i = 0; i <= 59; i++)
                            Center(
                              child: Text(
                                i.toString().padLeft(2, '0'),
                                style: theme.textStyles.onCanvasPrimary.body,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: IgnorePointer(
                  child: Container(
                    height: theme.textStyles.onCanvasPrimary.body.fontSize! * 2.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colors.accent1,
                        width: theme.dimens.borderWidth,
                      ),
                      borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
                      color: theme.colors.accent1.withOpacity(0.05),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
