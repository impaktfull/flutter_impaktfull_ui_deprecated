import 'package:flutter/material.dart';

class ImpaktfullTouchFeedback extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const ImpaktfullTouchFeedback({
    required this.onTap,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap == null) return child;
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}
