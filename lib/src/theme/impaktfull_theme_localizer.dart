import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';

class ImpaktfullThemeLocalizer extends StatelessWidget {
  final Widget Function(BuildContext context, ImpaktfullTheme theme) builder;

  const ImpaktfullThemeLocalizer({
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      builder(context, ImpaktfullTheme.of(context));
}
