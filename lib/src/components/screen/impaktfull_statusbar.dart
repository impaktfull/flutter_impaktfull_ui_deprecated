import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImpaktfullStatusBar extends StatelessWidget {
  final Widget child;
  final bool isDark;

  const ImpaktfullStatusBar.dark({
    required this.child,
    super.key,
  }) : isDark = true;

  const ImpaktfullStatusBar.light({
    required this.child,
    super.key,
  }) : isDark = false;

  const ImpaktfullStatusBar.custom({
    required this.child,
    required this.isDark,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark
          ? SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.transparent)
          : SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.transparent),
      child: child,
    );
  }
}
