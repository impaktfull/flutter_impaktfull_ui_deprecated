import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/snacky_uitl.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Dialog',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullButton.accent(
              label: 'Show dialog',
              onAsyncTap: () async {
                showDialog(
                  context: context,
                  builder: (context) => ImpaktfullDialog(
                    child: Text(
                      'some body',
                      style: theme.textStyles.onCardPrimary.body,
                    ),
                  ),
                );
              },
            ),
            ImpaktfullButton.accent(
              label: 'Show dialog (with title & body)',
              onAsyncTap: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) => ImpaktfullDialog(
                    title: 'Some title',
                    body: 'Some body',
                    onSecondaryTapped: () => Navigator.of(context).pop(false),
                    onPrimaryTapped: () => Navigator.of(context).pop(true),
                  ),
                );
                SnackyUtil.show('Result of dialog: `$result`');
              },
            ),
            ImpaktfullButton.accent(
              label: 'Show dialog (with result)',
              onAsyncTap: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) => ImpaktfullDialog(
                    onSecondaryTapped: () => Navigator.of(context).pop(false),
                    onPrimaryTapped: () => Navigator.of(context).pop(true),
                    child: Text(
                      'some body',
                      style: theme.textStyles.onCardPrimary.body,
                    ),
                  ),
                );
                SnackyUtil.show('Result of dialog: `$result`');
              },
            ),
            ImpaktfullButton.accent(
              label: 'Show date time picker dialog',
              onAsyncTap: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) => ImpaktfullDateTimePickerDialog(
                    selectedDateTime: DateTime.now(),
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
