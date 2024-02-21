import 'dart:ui';

import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';

ImpaktfullTheme? _theme;
Locale? _locale;

ImpaktfullTheme get theme {
  if (_theme == null) {
    throw Exception(
        'Impaktfull theme is not set, make sure you call setImpaktfullTheme() before using theme.');
  }
  return _theme!;
}

Locale get locale {
  if (_locale == null) {
    throw Exception(
        'Impaktfull locale is not set, make sure you call setImpaktfullLocale() before using theme.');
  }
  return _locale!;
}

void setImpaktfullTheme(ImpaktfullTheme? theme) {
  _theme = theme ?? ImpaktfullTheme.impaktfullBranding();
}

void setImpaktfullLocale(Locale? locale) {
  _locale = locale ?? const Locale('en');
}
