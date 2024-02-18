import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullTabBar extends StatefulWidget {
  final TabController tabController;
  final List<Widget> items;

  const ImpaktfullTabBar({
    required this.tabController,
    required this.items,
    super.key,
  });

  @override
  State<ImpaktfullTabBar> createState() => _ImpaktfullTabBarState();
}

class _ImpaktfullTabBarState extends State<ImpaktfullTabBar> {
  @override
  void initState() {
    widget.tabController.addListener(_onTabChanged);
    super.initState();
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_onTabChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.items,
    );
  }

  void _onTabChanged() => setState(() {});
}
