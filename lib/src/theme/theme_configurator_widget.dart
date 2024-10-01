import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/theme/theme_configurator.dart';

class ImpaktfullThemeConfiguratorWidget extends StatelessWidget {
  final ImpaktfullTheme? theme;
  final Locale? locale;
  final Widget child;

  const ImpaktfullThemeConfiguratorWidget({
    required this.child,
    this.theme,
    this.locale,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    setImpaktfullTheme(theme);
    setImpaktfullLocale(locale);
    return child;
  }
}
