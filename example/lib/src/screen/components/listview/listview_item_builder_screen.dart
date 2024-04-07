import 'package:impaktfull_ui/impaktfull_ui.dart';

class ListViewItemBuilderScreen extends StatelessWidget {
  const ListViewItemBuilderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'ListView - Item Builder',
      onBackTapped: () => Navigator.of(context).pop(),
      child: ImpaktfullListView.builder(
        onRefresh: () async => Future.delayed(const Duration(seconds: 2)),
        items: List.generate(100, (index) => 'Child ${index + 1}'),
        itemBuilder: (context, item, index) => Text(item),
        noDataLabel: 'No Data found',
      ),
    );
  }
}
