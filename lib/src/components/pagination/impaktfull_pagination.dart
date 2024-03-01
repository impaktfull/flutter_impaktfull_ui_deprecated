import 'package:impaktfull_ui/impaktfull_ui.dart';

typedef ImpaktfullPaginationPageChangeCallback = void Function(
    int page, int countPerPage);

class ImpaktfullPagination extends StatelessWidget {
  static const _defaultCountPerPage = 20;
  static const _maxAmountOfPages = 7;

  final int currentPage;
  final int count;
  final int countPerPage;
  final ImpaktfullPaginationPageChangeCallback onPageChange;
  final bool showFirstLastButtons;

  const ImpaktfullPagination({
    required this.currentPage,
    required this.count,
    required this.onPageChange,
    this.countPerPage = _defaultCountPerPage,
    this.showFirstLastButtons = false,
    super.key,
  });

  bool get isFirstPage => currentPage == 1;

  bool get hasPreviousPage => currentPage > 1;

  bool get hasNextPage => currentPage < _totalAmountOfPages;

  bool get isLastPage => currentPage == _totalAmountOfPages;

  int get _totalAmountOfPages => (count / countPerPage).ceil();

  int get _amountOfPages {
    if (!exceededMaxAmountOfPages) return _totalAmountOfPages;
    var amountOfPages = _maxAmountOfPages;
    if (exceededMaxAmountOfPagesStart) {
      amountOfPages--;
    }
    if (exceededMaxAmountOfPagesEnd) {
      amountOfPages--;
    }
    return amountOfPages;
  }

  int get offset => ((_maxAmountOfPages / 2).ceil() - 1);

  bool get exceededMaxAmountOfPages => _totalAmountOfPages > _maxAmountOfPages;

  bool get exceededMaxAmountOfPagesStart =>
      (currentPage - 1) > offset && exceededMaxAmountOfPages;

  bool get exceededMaxAmountOfPagesEnd =>
      (currentPage <= _totalAmountOfPages - offset) && exceededMaxAmountOfPages;

  List<_PageItem> get _pages {
    return List.generate(_amountOfPages, (index) {
      final indexOffset = index + 1;
      int value = currentPage - offset + indexOffset;
      if (!exceededMaxAmountOfPagesStart) {
        value = indexOffset;
      }
      if (!exceededMaxAmountOfPagesEnd) {
        value = _totalAmountOfPages - _amountOfPages + indexOffset;
      }
      return _PageItem(
        value: value,
        label: (value).toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(builder: (context, theme) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showFirstLastButtons) ...[
            ImpaktfullButton.secondary(
              label: '<<',
              onTap: isFirstPage ? null : _goToFirstPage,
            ),
          ],
          ImpaktfullButton.secondary(
            label: '<',
            onTap: hasPreviousPage ? _goPageBack : null,
          ),
          if (exceededMaxAmountOfPagesStart) ...[
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
              child: Center(
                child: Text(
                  '...',
                  style: theme.textStyles.onCanvasPrimary.button,
                ),
              ),
            ),
          ],
          for (final page in _pages) ...[
            if (page.value == currentPage) ...[
              ImpaktfullButton.accent(
                label: page.label,
                onTap: () => _onPageTapped(page.value),
              ),
            ] else ...[
              ImpaktfullButton.secondary(
                label: page.label,
                onTap: () => _onPageTapped(page.value),
              ),
            ],
          ],
          if (exceededMaxAmountOfPagesEnd) ...[
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
              child: Center(
                child: Text(
                  '...',
                  style: theme.textStyles.onCanvasPrimary.button,
                ),
              ),
            ),
          ],
          ImpaktfullButton.secondary(
            label: '>',
            onTap: hasNextPage ? _goPageForward : null,
          ),
          if (showFirstLastButtons) ...[
            ImpaktfullButton.secondary(
              label: '>>',
              onTap: isLastPage ? null : _goToLastPage,
            ),
          ],
        ],
      );
    });
  }

  void _goToFirstPage() => _onPageTapped(1);

  void _goPageBack() => _onPageTapped(currentPage - 1);

  void _onPageTapped(int page) {
    if (page < 1) return;
    if (page > _totalAmountOfPages) return;
    onPageChange(page, countPerPage);
  }

  void _goPageForward() => _onPageTapped(currentPage + 1);

  void _goToLastPage() => _onPageTapped((count / countPerPage).ceil());
}

class _PageItem {
  final int value;
  final String label;

  const _PageItem({
    required this.value,
    required this.label,
  });
}
