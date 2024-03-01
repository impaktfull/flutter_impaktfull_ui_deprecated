import 'package:flutter/foundation.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullRefreshIndicator extends StatelessWidget {
  final AsyncCallback? onRefresh;
  final Widget child;
  const ImpaktfullRefreshIndicator({
    required this.onRefresh,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (onRefresh == null) return child;
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) {
        return RefreshIndicator(
          color: theme.colors.accent1,
          onRefresh: onRefresh!,
          child: child,
        );
      },
    );
  }
}
