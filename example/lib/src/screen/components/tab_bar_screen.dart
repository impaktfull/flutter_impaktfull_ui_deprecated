import 'package:impaktfull_ui/impaktfull_ui.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({
    super.key,
  });

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Tabbar',
        onBackTapped: () => Navigator.of(context).pop(),
        bottomNavBarChild: ImpaktfullTabBar(
          tabController: _tabController,
          items: [
            ImpaktfullTabBarItem(
              label: 'Page 1',
              index: 0,
              tabController: _tabController,
            ),
            ImpaktfullTabBarItem(
              label: 'Page 2',
              index: 1,
              tabController: _tabController,
            ),
            ImpaktfullTabBarItem(
              label: 'Page 3',
              index: 2,
              tabController: _tabController,
            ),
          ],
        ),
        child: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('Page 1')),
            Center(child: Text('Page 2')),
            Center(child: Text('Page 3')),
          ],
        ),
      ),
    );
  }
}
