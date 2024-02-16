import 'package:impaktfull_ui/impaktfull_ui.dart';

class ListViewChildren extends StatelessWidget {
  const ListViewChildren({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'ListView - Children',
      onBackTapped: () => Navigator.of(context).pop(),
      child: const ImpaktfullListView(
        children: [
          Text('Child 1'),
          Text('Child 2'),
          Text('Child 3'),
          Text('Child 4'),
          Text('Child 5'),
        ],
      ),
    );
  }
}
