import 'package:flutter/material.dart';

enum ImpaktfullAutoLayoutOrientation {
  horizontal,
  vertical,
}

class ImpaktfullAutoLayout extends StatelessWidget {
  final ImpaktfullAutoLayoutOrientation orientation;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;
  final EdgeInsets padding;
  final int spacing;
  final Color backgroundColor;

  const ImpaktfullAutoLayout({
    required this.children,
    required this.orientation,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  const ImpaktfullAutoLayout.horizontal({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.backgroundColor = Colors.transparent,
    super.key,
  }) : orientation = ImpaktfullAutoLayoutOrientation.horizontal;

  const ImpaktfullAutoLayout.vertical({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.backgroundColor = Colors.transparent,
    super.key,
  }) : orientation = ImpaktfullAutoLayoutOrientation.vertical;

  @override
  Widget build(BuildContext context) {
    final width = orientation == ImpaktfullAutoLayoutOrientation.horizontal ? spacing.toDouble() : 0.0;
    final height = orientation == ImpaktfullAutoLayoutOrientation.vertical ? spacing.toDouble() : 0.0;
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

    final Widget child;
    if (orientation == ImpaktfullAutoLayoutOrientation.horizontal) {
      child = Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: childerenWithSpacing,
      );
    } else {
      child = Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: childerenWithSpacing,
      );
    }
    return Container(
      padding: padding,
      color: backgroundColor,
      child: child,
    );
  }
}
