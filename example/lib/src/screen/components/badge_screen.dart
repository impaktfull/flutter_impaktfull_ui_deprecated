import 'package:impaktfull_ui/impaktfull_ui.dart';

class BadgeScreen extends StatelessWidget {
  const BadgeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Badge',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            Center(
              child: ImpaktfullBadge(
                showBadge: true,
                location: ImpaktfullBadgeLocation.topRight,
                child: Container(
                  height: 24,
                  width: 24,
                  color: theme.colors.primary,
                ),
              ),
            ),
            Center(
              child: ImpaktfullBadge(
                showBadge: true,
                location: ImpaktfullBadgeLocation.topLeft,
                child: Container(
                  height: 24,
                  width: 24,
                  color: theme.colors.primary,
                ),
              ),
            ),
            Center(
              child: ImpaktfullBadge(
                showBadge: true,
                location: ImpaktfullBadgeLocation.bottomLeft,
                child: Container(
                  height: 24,
                  width: 24,
                  color: theme.colors.primary,
                ),
              ),
            ),
            Center(
              child: ImpaktfullBadge(
                showBadge: true,
                location: ImpaktfullBadgeLocation.bottomRight,
                child: Container(
                  height: 24,
                  width: 24,
                  color: theme.colors.primary,
                ),
              ),
            ),
            Center(
              child: ImpaktfullBadge(
                badgeText: 'topRight',
                location: ImpaktfullBadgeLocation.topRight,
                child: Container(
                  height: 50,
                  width: 50,
                  color: theme.colors.primary,
                ),
              ),
            ),
            Center(
              child: ImpaktfullBadge(
                badgeText: 'topLeft',
                location: ImpaktfullBadgeLocation.topLeft,
                child: Container(
                  height: 50,
                  width: 50,
                  color: theme.colors.primary,
                ),
              ),
            ),
            Center(
              child: ImpaktfullBadge(
                badgeText: 'bottomLeft',
                location: ImpaktfullBadgeLocation.bottomLeft,
                child: Container(
                  height: 50,
                  width: 50,
                  color: theme.colors.primary,
                ),
              ),
            ),
            Center(
              child: ImpaktfullBadge(
                badgeText: 'bottomRight',
                location: ImpaktfullBadgeLocation.bottomRight,
                child: Container(
                  height: 50,
                  width: 50,
                  color: theme.colors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
