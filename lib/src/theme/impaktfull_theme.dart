import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_branding.dart';
import 'package:impaktfull_ui/src/theme/theme_configurator.dart';
import 'package:impaktfull_ui/src/util/test_util.dart';

class ImpaktfullThemeConfig {
  static InteractiveInkFeatureFactory get defaultSplashFactory => TestUtil.isInTest ? InkSparkle.constantTurbulenceSeedSplashFactory : InkSparkle.splashFactory;
}

class ImpaktfullTheme {
  bool get useDarkStatusBar => (theme.colors.primary.computeLuminance() > 0.179) ? true : false;

  static ImpaktfullTheme impaktfullBranding({
    ImpaktfullShadowTheme? shadows,
    ImpaktfullBorderTheme? borders,
    ImpaktfullAssets? assets,
    ImpaktfullDimens? dimens,
    ImpaktfullDurations? durations,
    ImpaktfullLocalizations? localizations,
    InteractiveInkFeatureFactory? splashFactory,
  }) =>
      ImpaktfullTheme(
        colors: const ImpaktfullColorTheme(
          primary: ImpaktfullBranding.primary,
          accent1: ImpaktfullBranding.accent1,
          accent2: ImpaktfullBranding.accent2,
          accent3: ImpaktfullBranding.accent3,
          onPrimary: ImpaktfullBranding.textOnPrimary,
          onAccent1: ImpaktfullBranding.textOnAccent1,
          onAccent2: ImpaktfullBranding.textOnAccent2,
          canvas: ImpaktfullBranding.canvas,
          card: ImpaktfullBranding.card,
          error: ImpaktfullBranding.error,
          info: ImpaktfullBranding.info,
          success: ImpaktfullBranding.success,
          warning: ImpaktfullBranding.warning,
          separator: ImpaktfullBranding.divider,
        ),
        shadows: shadows ?? ImpaktfullShadowTheme.getDefaults(),
        borders: borders ?? ImpaktfullBorderTheme.getDefaults(),
        textStyles: ImpaktfullTextStylesTheme(
          onCanvasPrimary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnCanvasPrimary, ImpaktfullBranding.font),
          onCanvasSecondary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnCanvasSecondary, ImpaktfullBranding.font),
          onPrimary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnPrimary, ImpaktfullBranding.font),
          onAccent1: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnAccent1, ImpaktfullBranding.font),
          onCardPrimary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnCardPrimary, ImpaktfullBranding.font),
          onCardSecondary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnCardSecondary, ImpaktfullBranding.font),
        ),
        assets: assets ?? ImpaktfullAssets.getDefaults(),
        dimens: dimens ?? ImpaktfullDimens.getDefaults(),
        durations: durations ?? ImpaktfullDurations.getDefaults(),
        localizations: localizations ?? ImpaktfullLocalizations.getDefaults(),
        splashFactory: splashFactory ?? ImpaktfullThemeConfig.defaultSplashFactory,
      );

  static ImpaktfullTheme fromColors({
    required Color primary,
    required Color accent1,
    required Color accent2,
    Color? accent3,
    ImpaktfullShadowTheme? shadows,
    ImpaktfullBorderTheme? borders,
    ImpaktfullAssets? assets,
    ImpaktfullDimens? dimens,
    ImpaktfullDurations? durations,
    ImpaktfullLocalizations? localizations,
    InteractiveInkFeatureFactory? splashFactory,
  }) =>
      ImpaktfullTheme(
        colors: ImpaktfullColorTheme(
          primary: primary,
          accent1: accent1,
          accent2: accent2,
          accent3: accent3 ?? ImpaktfullBranding.accent3,
          onPrimary: ImpaktfullBranding.textOnPrimary,
          onAccent1: ImpaktfullBranding.textOnAccent1,
          onAccent2: ImpaktfullBranding.textOnAccent2,
          canvas: ImpaktfullBranding.canvas,
          card: ImpaktfullBranding.card,
          error: ImpaktfullBranding.error,
          info: ImpaktfullBranding.info,
          success: ImpaktfullBranding.success,
          warning: ImpaktfullBranding.warning,
          separator: ImpaktfullBranding.divider,
        ),
        shadows: shadows ?? ImpaktfullShadowTheme.getDefaults(),
        borders: borders ?? ImpaktfullBorderTheme.getDefaults(),
        textStyles: ImpaktfullTextStylesTheme(
          onCanvasPrimary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnCanvasPrimary, ImpaktfullBranding.font),
          onCanvasSecondary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnCanvasSecondary, ImpaktfullBranding.font),
          onPrimary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnPrimary, ImpaktfullBranding.font),
          onAccent1: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnAccent1, ImpaktfullBranding.font),
          onCardPrimary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnCardPrimary, ImpaktfullBranding.font),
          onCardSecondary: ImpaktfullTextStyleTheme.getTextStyleTheme(ImpaktfullBranding.textOnCardSecondary, ImpaktfullBranding.font),
        ),
        assets: assets ?? ImpaktfullAssets.getDefaults(),
        dimens: dimens ?? ImpaktfullDimens.getDefaults(),
        durations: durations ?? ImpaktfullDurations.getDefaults(),
        localizations: localizations ?? ImpaktfullLocalizations.getDefaults(),
        splashFactory: splashFactory ?? ImpaktfullThemeConfig.defaultSplashFactory,
      );

  final ImpaktfullColorTheme colors;
  final ImpaktfullShadowTheme shadows;
  final ImpaktfullBorderTheme borders;
  final ImpaktfullTextStylesTheme textStyles;
  final ImpaktfullAssets assets;
  final ImpaktfullDimens dimens;
  final ImpaktfullDurations durations;
  final ImpaktfullLocalizations localizations;
  final InteractiveInkFeatureFactory splashFactory;

  const ImpaktfullTheme({
    required this.colors,
    required this.shadows,
    required this.borders,
    required this.textStyles,
    required this.assets,
    required this.dimens,
    required this.durations,
    required this.localizations,
    this.splashFactory = InkSparkle.constantTurbulenceSeedSplashFactory,
  });

  static ImpaktfullTheme of(BuildContext context) => theme;
}

class ImpaktfullColorTheme {
  final Color primary;
  final Color accent1;
  final Color accent2;
  final Color accent3;
  final Color canvas;
  final Color card;
  final Color onPrimary;
  final Color onAccent1;
  final Color onAccent2;
  final Color error;
  final Color info;
  final Color success;
  final Color warning;
  final Color separator;

  const ImpaktfullColorTheme({
    required this.primary,
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.onPrimary,
    required this.onAccent1,
    required this.onAccent2,
    required this.canvas,
    required this.card,
    required this.error,
    required this.info,
    required this.success,
    required this.warning,
    required this.separator,
  });
}

class ImpaktfullShadowTheme {
  final BoxShadow? card;
  final BoxShadow? selectedCard;
  final BoxShadow? bottomNavigation;
  final BoxShadow? button;

  const ImpaktfullShadowTheme({
    required this.card,
    required this.selectedCard,
    required this.bottomNavigation,
    required this.button,
  });

  static ImpaktfullShadowTheme getDefaults({
    Color? accent1,
    Color? selectedColor,
  }) =>
      ImpaktfullShadowTheme(
        card: const BoxShadow(
          color: ImpaktfullBranding.shadow,
          blurRadius: 20,
          offset: Offset(0, 1),
          spreadRadius: 4,
        ),
        selectedCard: BoxShadow(
          color: selectedColor ?? accent1?.withOpacity(0.4) ?? ImpaktfullBranding.accent1.withOpacity(0.4),
          blurRadius: 20,
          offset: const Offset(0, 1),
          spreadRadius: 4,
        ),
        bottomNavigation: const BoxShadow(
          color: ImpaktfullBranding.shadow,
          blurRadius: 20,
          offset: Offset(0, 1),
          spreadRadius: 4,
        ),
        button: const BoxShadow(
          color: ImpaktfullBranding.shadow,
          blurRadius: 20,
          offset: Offset(0, 1),
          spreadRadius: 4,
        ),
      );
}

class ImpaktfullBorderTheme {
  final Border? card;
  final Border? selectedCard;

  const ImpaktfullBorderTheme({
    required this.card,
    required this.selectedCard,
  });

  static ImpaktfullBorderTheme getDefaults({
    Color? accent1,
  }) =>
      ImpaktfullBorderTheme(
        card: Border.all(
          color: Colors.transparent,
          width: 2,
        ),
        selectedCard: Border.all(
          color: accent1 ?? ImpaktfullBranding.accent1,
          width: 2,
        ),
      );
}

class ImpaktfullTextStylesTheme {
  final ImpaktfullTextStyleTheme onCanvasPrimary;
  final ImpaktfullTextStyleTheme onCanvasSecondary;
  final ImpaktfullTextStyleTheme onPrimary;
  final ImpaktfullTextStyleTheme onAccent1;
  final ImpaktfullTextStyleTheme onCardPrimary;
  final ImpaktfullTextStyleTheme onCardSecondary;

  const ImpaktfullTextStylesTheme({
    required this.onCanvasPrimary,
    required this.onCanvasSecondary,
    required this.onCardPrimary,
    required this.onCardSecondary,
    required this.onPrimary,
    required this.onAccent1,
  });
}

class ImpaktfullTextStyleTheme {
  final TextStyle title;
  final TextStyle titleSmall;
  final TextStyle listItemTitle;
  final TextStyle body;
  final TextStyle button;
  final TextStyle smallBody;
  final TextStyle bodyInput;

  const ImpaktfullTextStyleTheme({
    required this.title,
    required this.titleSmall,
    required this.listItemTitle,
    required this.body,
    required this.button,
    required this.smallBody,
    required this.bodyInput,
  });

  static ImpaktfullTextStyleTheme getTextStyleTheme(Color color, String fontFamily) => ImpaktfullTextStyleTheme(
        title: TextStyle(fontSize: 16, height: 1.2, fontWeight: FontWeight.bold, fontFamily: fontFamily, color: color),
        button: TextStyle(fontSize: 16, height: 1.2, fontWeight: FontWeight.bold, fontFamily: fontFamily, color: color),
        titleSmall: TextStyle(fontSize: 14, height: 1.2, fontWeight: FontWeight.bold, fontFamily: fontFamily, color: color),
        listItemTitle: TextStyle(fontSize: 16, height: 1.2, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: color),
        bodyInput: TextStyle(fontSize: 16, height: 1.2, fontWeight: FontWeight.normal, fontFamily: fontFamily, color: color),
        body: TextStyle(fontSize: 13, height: 1.2, fontWeight: FontWeight.normal, fontFamily: fontFamily, color: color),
        smallBody: TextStyle(fontSize: 11, height: 1.2, fontWeight: FontWeight.normal, fontFamily: fontFamily, color: color),
      );
}

class ImpaktfullAssets {
  final ImpaktfullAssetIcons icons;
  final ImpaktfullAssetLotties lottie;

  const ImpaktfullAssets({
    required this.icons,
    required this.lottie,
  });

  static ImpaktfullAssets getDefaults() => ImpaktfullAssets(
        icons: ImpaktfullAssetIcons.getDefaults(),
        lottie: ImpaktfullAssetLotties.getDefaults(),
      );
}

class ImpaktfullAssetIcons {
  final String arrowLeft;
  final String check;
  final String chevronRight;

  const ImpaktfullAssetIcons({
    required this.arrowLeft,
    required this.check,
    required this.chevronRight,
  });

  static ImpaktfullAssetIcons getDefaults() {
    const prefix = 'assets/icons';
    return const ImpaktfullAssetIcons(
      arrowLeft: '$prefix/arrow_left.svg',
      check: '$prefix/check.svg',
      chevronRight: '$prefix/chevron_right.svg',
    );
  }
}

class ImpaktfullAssetLotties {
  final String loading;

  const ImpaktfullAssetLotties({
    required this.loading,
  });

  static ImpaktfullAssetLotties getDefaults() {
    const prefix = 'assets/lottie';
    return const ImpaktfullAssetLotties(
      loading: '$prefix/loading.json',
    );
  }
}

class ImpaktfullDimens {
  /// Border Radius
  final double generalBorderRadius;

  /// Padding
  final double listViewTitleHorizontalPadding;
  final double listViewTitleVerticalPadding;
  final double listViewHorizontalPadding;
  final double listViewVerticalPadding;
  final double separatorHorizontalPadding;

  /// Switch
  final double switchBorderRadius;
  final double switchThumbBorderRadius;

  /// Borders
  final double borderWidth;

  const ImpaktfullDimens({
    required this.generalBorderRadius,
    required this.listViewTitleHorizontalPadding,
    required this.listViewTitleVerticalPadding,
    required this.listViewHorizontalPadding,
    required this.listViewVerticalPadding,
    required this.separatorHorizontalPadding,
    required this.switchBorderRadius,
    required this.switchThumbBorderRadius,
    required this.borderWidth,
  });

  static ImpaktfullDimens getDefaults() => const ImpaktfullDimens(
        generalBorderRadius: 8,
        listViewTitleHorizontalPadding: 16,
        listViewTitleVerticalPadding: 16,
        listViewHorizontalPadding: 16,
        listViewVerticalPadding: 16,
        separatorHorizontalPadding: 16,
        switchBorderRadius: 8,
        switchThumbBorderRadius: 4,
        borderWidth: 2,
      );
}

class ImpaktfullDurations {
  final Duration short;

  const ImpaktfullDurations({
    required this.short,
  });

  static ImpaktfullDurations getDefaults() => const ImpaktfullDurations(
        short: Duration(milliseconds: 250),
      );
}

class ImpaktfullLocalizations {
  final ImpaktfullLocalizationsValues en;
  final ImpaktfullLocalizationsValues nl;

  const ImpaktfullLocalizations({
    required this.en,
    required this.nl,
  });

  static ImpaktfullLocalizations getDefaults() => ImpaktfullLocalizations(
        en: ImpaktfullLocalizationsValues.getEnValues(),
        nl: ImpaktfullLocalizationsValues.getNlValues(),
      );

  ImpaktfullLocalizationsValues get current {
    switch (locale.languageCode) {
      case 'en':
        return en;
      case 'nl':
        return en;
      default:
        return en;
    }
  }
}

class ImpaktfullLocalizationsValues {
  final String generalLabelAccept;
  final String generalLabelCancel;

  const ImpaktfullLocalizationsValues({
    required this.generalLabelAccept,
    required this.generalLabelCancel,
  });

  static ImpaktfullLocalizationsValues getEnValues() => const ImpaktfullLocalizationsValues(
        generalLabelAccept: 'Accept',
        generalLabelCancel: 'Cancel',
      );

  static ImpaktfullLocalizationsValues getNlValues() => const ImpaktfullLocalizationsValues(
        generalLabelAccept: 'Accepteren',
        generalLabelCancel: 'Annuleren',
      );
}
