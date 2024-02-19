import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImpaktfullSvgIcon extends StatelessWidget {
  final String asset;
  final int? size;
  final Color? color;

  const ImpaktfullSvgIcon({
    required this.asset,
    this.size,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// The Transform.scale widget is used to fix the issue of the SVG icon not being displayed on some devices
    /// https://github.com/dnfield/flutter_svg/issues/927#issuecomment-1880662373
    /// 
    /// Related to Impeller, these 2 issues track the actual issue:
    /// https://github.com/dnfield/flutter_svg/issues/927
    /// https://github.com/dnfield/flutter_svg/issues/975
    return Transform.scale(
      scale: 0.999,
      child: SvgPicture.asset(
        asset,
        width: size?.toDouble() ?? 24,
        height: size?.toDouble() ?? 24,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              ),
      ),
    );
  }
}
