import 'package:flutter/foundation.dart';
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
  final Widget Function(BuildContext context, Widget app)? builder;
  final bool showDebugFlag;

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
    this.builder,
    this.showDebugFlag = kDebugMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    setImpaktfullTheme(impaktfullTheme);
    setImpaktfullLocale(locale);
    return SnackyConfiguratorWidget(
      snackyBuilder: SimpleSnackyBuilder(
        borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
        colorBuilder: (snacky) {
          switch (snacky.type) {
            case SnackyType.error:
              return Color.lerp(theme.colors.error, Colors.white, 0.8) ??
                  theme.colors.error;
            case SnackyType.info:
              return Color.lerp(theme.colors.info, Colors.white, 0.8) ??
                  theme.colors.info;
            case SnackyType.success:
              return Color.lerp(theme.colors.success, Colors.white, 0.8) ??
                  theme.colors.success;
            case SnackyType.warning:
              return Color.lerp(theme.colors.warning, Colors.white, 0.8) ??
                  theme.colors.warning;
          }
        },
        borderBuilder: (snacky) {
          final width = theme.dimens.borderWidth;
          switch (snacky.type) {
            case SnackyType.error:
              return Border.all(
                color: theme.colors.error,
                width: width,
              );
            case SnackyType.info:
              return Border.all(
                color: theme.colors.info,
                width: width,
              );
            case SnackyType.success:
              return Border.all(
                color: theme.colors.success,
                width: width,
              );
            case SnackyType.warning:
              return Border.all(
                color: theme.colors.warning,
                width: width,
              );
          }
        },
      ),
      app: Builder(
        builder: (context) {
          final app = MaterialApp(
            title: title,
            home: home,
            debugShowCheckedModeBanner: showDebugFlag,
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
          );
          if (builder == null) {
            return app;
          }
          return builder!(context, app);
        },
      ),
    );
  }
}
