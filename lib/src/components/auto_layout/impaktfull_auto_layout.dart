import 'package:flutter/material.dart';

enum ImpaktfullAutoLayoutOrientation {
  horizontal,
  vertical,
}

class ImpaktfullAutoLayout extends StatelessWidget {
  final ImpaktfullAutoLayoutOrientation orientation;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;
  final double spacing;

  const ImpaktfullAutoLayout({
    required this.children,
    required this.orientation,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    super.key,
  });

  const ImpaktfullAutoLayout.horizontal({
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    super.key,
  }) : orientation = ImpaktfullAutoLayoutOrientation.horizontal;

  const ImpaktfullAutoLayout.vertical({
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    super.key,
  }) : orientation = ImpaktfullAutoLayoutOrientation.vertical;

  @override
  Widget build(BuildContext context) {
    final width = orientation == ImpaktfullAutoLayoutOrientation.horizontal
        ? spacing.toDouble()
        : 0.0;
    final height = orientation == ImpaktfullAutoLayoutOrientation.vertical
        ? spacing.toDouble()
        : 0.0;
    final childerenWithSpacing = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      childerenWithSpacing.add(children[i]);
      if (i < children.length - 1) {
        childerenWithSpacing.add(SizedBox(
          width: width,
          height: height,
        ));
      }
    }

    if (orientation == ImpaktfullAutoLayoutOrientation.horizontal) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: childerenWithSpacing,
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: childerenWithSpacing,
      );
    }
  }
}
