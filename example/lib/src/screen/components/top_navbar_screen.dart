import 'package:impaktfull_ui/impaktfull_ui.dart';

class TopNavBarScreen extends StatefulWidget {
  const TopNavBarScreen({
    super.key,
  });

  @override
  State<TopNavBarScreen> createState() => _TopNavBarScreenState();
}

class _TopNavBarScreenState extends State<TopNavBarScreen> {
  final _data = List.generate(
    100,
    (index) => 'This is item $index',
  );
  var _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredData = _data.where((e) => e.contains(_searchQuery)).toList();
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Fab',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullTopNavbar(
          leadingWidget: const ImpaktfullLogo.darkTextLogo(),
          centerWidget: Container(),
          inputFieldHintText: 'What are you looking for?',
          inputFieldOnChanged: (value) {
            setState(() => _searchQuery = value);
          },
          content: ImpaktfullListView.builder(
            items: filteredData,
            itemBuilder: (context, item, index) => ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: index == 0
                    ? Radius.circular(
                        theme.dimens.generalBorderRadius,
                      )
                    : Radius.zero,
                bottom: index == _data.length - 1
                    ? Radius.circular(
                        theme.dimens.generalBorderRadius,
                      )
                    : Radius.zero,
              ),
              child: ImpaktfullListItem(
                title: item,
              ),
            ),
            noDataLabel: 'No Data found',
          ),
        ),
      ),
    );
  }
}
