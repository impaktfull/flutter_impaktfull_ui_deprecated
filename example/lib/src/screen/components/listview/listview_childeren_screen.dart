import 'package:impaktfull_ui/impaktfull_ui.dart';

class ListViewChildrenScreen extends StatelessWidget {
  const ListViewChildrenScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'ListView - Children',
      onBackTapped: () => Navigator.of(context).pop(),
      child: ImpaktfullListView(
        onRefresh: () async => Future.delayed(const Duration(seconds: 2)),
        children: const [
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
