import 'package:impaktfull_ui/impaktfull_ui.dart';

class ListViewItemSeparatedBuilder extends StatelessWidget {
  const ListViewItemSeparatedBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'ListView - Item Separated Builder',
      onBackTapped: () => Navigator.of(context).pop(),
      child: ImpaktfullListView.separated(
        separatorType: ImpaktfullSeparatorType.canvas,
        items: List.generate(100, (index) => 'Child ${index + 1}'),
        itemBuilder: (context, item) => Text(item),
        noDataLabel: 'No Data found',
      ),
    );
  }
}
