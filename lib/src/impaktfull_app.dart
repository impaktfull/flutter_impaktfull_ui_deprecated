import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';
import 'package:impaktfull_ui/src/theme/theme_configurator.dart';
import 'package:snacky/snacky.dart';

class ImpaktfullApp extends StatelessWidget {
  final String title;
  final Widget? home;
  final ImpaktfullTheme? impaktfullTheme;
  final ThemeData? materialLightTheme;
  final ThemeData? materialDarkTheme;
  final Locale? locale;
  final Iterable<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final List<NavigatorObserver> navigatorObservers;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;

  const ImpaktfullApp({
    required this.title,
    this.home,
    this.impaktfullTheme,
    this.materialLightTheme,
    this.materialDarkTheme,
    this.locale,
    this.supportedLocales = const <Locale>[Locale('en')],
    this.localizationsDelegates,
    this.navigatorKey,
    this.initialRoute,
    this.onGenerateRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    setImpaktfullTheme(impaktfullTheme);
    setImpaktfullLocale(locale);
    return SnackyConfiguratorWidget(
      snackyBuilder: SimpleSnackyBuilder(
        borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
      ),
      app: MaterialApp(
        title: title,
        home: home,
        locale: locale,
        theme: materialLightTheme,
        darkTheme: materialDarkTheme,
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        navigatorKey: navigatorKey,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        navigatorObservers: [
          SnackyNavigationObserver(),
          ...navigatorObservers,
        ],
      ),
    );
  }
}
