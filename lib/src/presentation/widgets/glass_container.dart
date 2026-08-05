// A reusable glassmorphism container.
// Usage: GlassContainer(child: YourWidget())
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/theme_constants.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? surfaceColor; // Optional overlay color.

  const GlassContainer({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.surfaceColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color base = surfaceColor ??
        (isDark ? ColorSchemes.newDarkSurfaceGlass : ColorSchemes.lightSurfaceGlass);
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(kBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: kGlassBlurSigma,
          sigmaY: kGlassBlurSigma,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: base,
            borderRadius: borderRadius ?? BorderRadius.circular(kBorderRadius),
            border: Border.all(
              color: base.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
