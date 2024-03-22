import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/snacky_uitl.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - BottomSheet',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullButton.accent(
              label: 'Show bottom sheet',
              onAsyncTap: () async {
                final result = await showModalBottomSheet<bool>(
                  context: context,
                  builder: (BuildContext context) => ImpaktfullBottomSheet(
                    title: 'Bottom sheet',
                    hasCloseButton: true,
                    child: ImpaktfullSeparatedColumn(
                      type: ImpaktfullSeparatorType.card,
                      clip: false,
                      children: [
                        ImpaktfullListItem(
                          title: 'Result false',
                          onTap: () => Navigator.of(context).pop(false),
                        ),
                        ImpaktfullListItem(
                          title: 'Result true',
                          onTap: () => Navigator.of(context).pop(true),
                        ),
                        ImpaktfullListItem(
                          title: 'Result null',
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                );
                SnackyUtil.show('Result of date time picker dialog: `$result`');
              },
            ),
          ],
        ),
      ),
    );
  }
}
