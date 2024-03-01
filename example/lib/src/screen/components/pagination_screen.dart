import 'package:impaktfull_ui/impaktfull_ui.dart';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({
    super.key,
  });

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  var _currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Pagination',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullPagination(
              currentPage: _currentPage,
              count: 200,
              onPageChange: (int page, int countPerPage) {
                setState(() {
                  _currentPage = page;
                });
              },
              showFirstLastButtons: true,
            ),
          ],
        ),
      ),
    );
  }
}
