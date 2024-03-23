import 'package:flutter/material.dart';

class ImpaktfullWrapperContainer extends StatelessWidget {
  final Widget child;

  const ImpaktfullWrapperContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1440),
        child: child,
      ),
    );
  }
}
