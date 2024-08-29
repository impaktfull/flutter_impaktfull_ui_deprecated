import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';
import 'package:lottie/lottie.dart';

class ImpaktfullLoadingIndicator extends StatelessWidget {
  final Color? color;
  final String? asset;

  const ImpaktfullLoadingIndicator({
    this.color,
    super.key,
  }) : asset = null;

  const ImpaktfullLoadingIndicator.custom({
    required this.asset,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) {
        final lottie = Lottie.asset(
          asset ?? theme.assets.lottie.loading,
          width: 48,
          height: 48,
        );
        if (color == null) return lottie;
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            color!,
            BlendMode.srcATop,
          ),
          child: lottie,
        );
      },
    );
  }
}
