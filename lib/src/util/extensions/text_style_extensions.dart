import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withOpacity(double opacity) =>
      copyWith(color: color?.withOpacity(opacity));
}
