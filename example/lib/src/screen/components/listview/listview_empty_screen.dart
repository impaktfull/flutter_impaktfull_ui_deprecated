import 'package:impaktfull_ui/impaktfull_ui.dart';

class ListViewEmptyScreen extends StatelessWidget {
  const ListViewEmptyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'ListView - Empty',
      onBackTapped: () => Navigator.of(context).pop(),
      child: ImpaktfullListView.builder(
        onRefresh: () async => Future.delayed(const Duration(seconds: 2)),
        items: const [],
        itemBuilder: (context, item) => Container(),
        noDataLabel: 'No data',
        refreshBtnLabel: 'Probeer opnieuw',
      ),
    );
  }
}
