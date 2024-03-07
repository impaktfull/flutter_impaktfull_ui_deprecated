import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';
import 'package:lottie/lottie.dart';

class ImpaktfullLoadingIndicator extends StatelessWidget {
  final String? asset;

  const ImpaktfullLoadingIndicator({
    super.key,
  }) : asset = null;

  const ImpaktfullLoadingIndicator.custom({
    required this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Lottie.asset(
        asset ?? theme.assets.lottie.loading,
        width: 48,
        height: 48,
      ),
    );
  }
}
