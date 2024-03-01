import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/bottom_navigation/impaktfull_bottom_navigation_item.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

class ImpaktfullBottomNavigation extends StatelessWidget {
  final List<ImpaktfullBottomNavigationItem> items;

  const ImpaktfullBottomNavigation({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Container(
        decoration: BoxDecoration(
          color: theme.colors.card,
          boxShadow: [
            if (theme.shadows.bottomNavigation != null)
              theme.shadows.bottomNavigation!,
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: items,
          ),
        ),
      ),
    );
  }
}
