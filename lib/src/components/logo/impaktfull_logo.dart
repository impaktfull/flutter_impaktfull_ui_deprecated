import 'package:flutter/material.dart';

class ImpaktfullLogo extends StatelessWidget {
  final bool dark;
  final bool textLogo;

  const ImpaktfullLogo({
    required this.dark,
    this.textLogo = false,
    super.key,
  });

  const ImpaktfullLogo.darkLogo({
    super.key,
  })  : dark = true,
        textLogo = false;

  const ImpaktfullLogo.lightLogo({
    super.key,
  })  : dark = false,
        textLogo = false;

  const ImpaktfullLogo.darkTextLogo({
    super.key,
  })  : dark = true,
        textLogo = true;

  const ImpaktfullLogo.lightTextLogo({
    super.key,
  })  : dark = true,
        textLogo = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: textLogo ? 100 : 40,
      height: textLogo ? 40 : 40,
      child: const Placeholder(),
    );
  }
}
