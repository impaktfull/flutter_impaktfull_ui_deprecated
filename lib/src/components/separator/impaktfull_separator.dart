import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

enum ImpaktfullSeparatorType {
  canvas,
  card,
}

class ImpaktfullSeparator extends StatelessWidget {
  final ImpaktfullSeparatorType type;

  const ImpaktfullSeparator({
    required this.type,
    super.key,
  });

  const ImpaktfullSeparator.canvas({
    super.key,
  }) : type = ImpaktfullSeparatorType.canvas;

  const ImpaktfullSeparator.card({
    super.key,
  }) : type = ImpaktfullSeparatorType.card;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Container(
        height: 1,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: _getBackgroundColor(theme),
        child: Container(
          color: theme.colors.separator,
        ),
      ),
    );
  }

  Color _getBackgroundColor(ImpaktfullTheme theme) {
    switch (type) {
      case ImpaktfullSeparatorType.canvas:
        return theme.colors.canvas;
      case ImpaktfullSeparatorType.card:
        return theme.colors.card;
    }
  }
}
