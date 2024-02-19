import 'package:impaktfull_ui/impaktfull_ui.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({
    super.key,
  });

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  var value = false;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Switch',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullSwitch(
              value: true,
              onChanged: (value) {},
            ),
            ImpaktfullSwitch(
              value: false,
              onChanged: (value) {},
            ),
            ImpaktfullSwitch(
              value: value,
              onChanged: (value) {
                setState(() => this.value = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
