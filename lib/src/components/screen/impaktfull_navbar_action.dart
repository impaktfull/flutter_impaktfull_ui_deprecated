import 'dart:io';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/icon/impaktfull_svg_icon.dart';

class ImpaktfullNavbarAction extends StatelessWidget {
  final String svgIcon;
  final VoidCallback? onTap;

  const ImpaktfullNavbarAction({
    required this.svgIcon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return IconButton(
        icon: SvgIcon(
          asset: svgIcon,
        ),
        onPressed: onTap,
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgIcon(
            asset: svgIcon,
          ),
        ),
      ),
    );
  }
}
