import 'package:impaktfull_ui/impaktfull_ui.dart';

class LoadingIndicatorScreen extends StatelessWidget {
  const LoadingIndicatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'Components - Loading Indicator',
      onBackTapped: () => Navigator.of(context).pop(),
      child: const ImpaktfullListView(
        children: [
          ImpaktfullLoadingIndicator(),
        ],
      ),
    );
  }
}
