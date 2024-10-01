import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/theme/theme_configurator.dart';

class ThemeConfiguratorWidget extends StatelessWidget {
  final ImpaktfullTheme? theme;
  final Locale locale;
  final Widget child;

  const ThemeConfiguratorWidget({
    required this.child,
    this.theme,
    this.locale = const Locale('en'),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    setImpaktfullTheme(theme);
    setImpaktfullLocale(locale);
    return child;
  }
}
