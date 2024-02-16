import 'package:impaktfull_ui/impaktfull_ui.dart';

class ListViewItemBuilder extends StatelessWidget {
  const ListViewItemBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'ListView - Item Builder',
      onBackTapped: () => Navigator.of(context).pop(),
      child: ImpaktfullListView.builder(
        items: List.generate(100, (index) => 'Child ${index + 1}'),
        itemBuilder: (context, item) => Text(item),
        noDataLabel: 'No Data found',
      ),
    );
  }
}
