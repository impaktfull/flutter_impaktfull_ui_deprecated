import 'package:impaktfull_ui/impaktfull_ui.dart';

class ListViewItemSeparatedBuilderScreen extends StatelessWidget {
  const ListViewItemSeparatedBuilderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'ListView - Item Separated Builder',
      onBackTapped: () => Navigator.of(context).pop(),
      child: ImpaktfullListView.separated(
        onRefresh: () async => Future.delayed(const Duration(seconds: 2)),
        separatorType: ImpaktfullSeparatorType.canvas,
        items: List.generate(100, (index) => 'Child ${index + 1}'),
        itemBuilder: (context, item, index) => Text(item),
        noDataLabel: 'No Data found',
      ),
    );
  }
}
