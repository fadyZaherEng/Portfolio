 import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';

extension ColorExtension on String {
  toColor() {
    if (isEmpty) return ColorSchemes.primary;
    return Color(int.parse(replaceAll("#", "ff"), radix: 16) | 0xFF000000);

   }
}
