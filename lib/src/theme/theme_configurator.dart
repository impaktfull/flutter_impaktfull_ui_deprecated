import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';

ImpaktfullTheme? _theme;

ImpaktfullTheme get theme {
  if (_theme == null) {
    throw Exception('Impaktfull theme is not set, make sure you call setImpaktfullTheme() before using theme.');
  }
  return _theme!;
}

void setImpaktfullTheme(ImpaktfullTheme? theme) {
  _theme = theme ?? ImpaktfullTheme.impaktfullBranding();
}
