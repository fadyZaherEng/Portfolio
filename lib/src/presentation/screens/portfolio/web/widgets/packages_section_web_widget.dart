import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';

class PackagesSectionWebWidget extends StatefulWidget {
  final bool isDarkMode;

  const PackagesSectionWebWidget({super.key, required this.isDarkMode});

  @override
  State<PackagesSectionWebWidget> createState() =>
      _PackagesSectionWebWidgetState();
}

class _PackagesSectionWebWidgetState extends State<PackagesSectionWebWidget> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final packages = Constants.packages;
    final Color textColor =
        widget.isDarkMode ? ColorSchemes.white : ColorSchemes.iconBackGround;
    final Color subTextColor =
        widget.isDarkMode ? Colors.white70 : Colors.black54;

    return Column(
      children: [
        const SizedBox(height: 40),
        // Section Title
        Text(
          S.of(context).myPackages,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorSchemes.iconDarkWhite,
              ),
        ),
        const SizedBox(height: 16),
        // Subtitle
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Text(
            S.of(context).exploreMyPackages,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: subTextColor,
                  height: 1.8,
                ),
          ),
        ),
        const SizedBox(height: 36),
        // Package Cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: List.generate(packages.length, (index) {
              final pkg = packages[index];
              final isHovered = _hoveredIndex == index;
              return MouseRegion(
                onEnter: (_) => setState(() => _hoveredIndex = index),
                onExit: (_) => setState(() => _hoveredIndex = null),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => openLink(pkg.pubDevUrl),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeOut,
                    width: 520,
                    transform: isHovered
                        ? (Matrix4.identity()..translate(0.0, -8.0))
                        : Matrix4.identity(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: isHovered
                            ? [
                                ColorSchemes.primary.withOpacity(0.95),
                                ColorSchemes.iconBackGround,
                              ]
                            : [
                                (widget.isDarkMode
                                        ? Colors.white.withOpacity(0.07)
                                        : Colors.grey.shade100)
                                    .withOpacity(isHovered ? 0 : 1),
                                (widget.isDarkMode
                                        ? Colors.white.withOpacity(0.03)
                                        : Colors.white)
                                    .withOpacity(isHovered ? 0 : 1),
                              ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(
                        color: isHovered
                            ? ColorSchemes.primary.withOpacity(0.6)
                            : (widget.isDarkMode
                                ? Colors.white.withOpacity(0.12)
                                : Colors.grey.shade300),
                        width: 1.5,
                      ),
                      boxShadow: isHovered
                          ? [
                              BoxShadow(
                                color: ColorSchemes.primary.withOpacity(0.35),
                                blurRadius: 24,
                                spreadRadius: 2,
                                offset: const Offset(0, 8),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Row: icon + package name + badges
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // pub.dev logo icon
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: isHovered
                                      ? Colors.white.withOpacity(0.15)
                                      : ColorSchemes.primary.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    ImagePaths.flutter,
                                    colorFilter: ColorFilter.mode(
                                      isHovered
                                          ? Colors.white
                                          : ColorSchemes.primary,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pkg.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: isHovered
                                                ? Colors.white
                                                : textColor,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        _buildBadge(
                                          label: pkg.license,
                                          bgColor: isHovered
                                              ? Colors.white.withOpacity(0.2)
                                              : Colors.green.withOpacity(0.15),
                                          textColor: isHovered
                                              ? Colors.white
                                              : Colors.green.shade700,
                                          icon: Icons.verified_outlined,
                                        ),
                                        const SizedBox(width: 8),
                                        _buildBadge(
                                          label: 'pub.dev',
                                          bgColor: isHovered
                                              ? Colors.white.withOpacity(0.2)
                                              : ColorSchemes.primary
                                                  .withOpacity(0.12),
                                          textColor: isHovered
                                              ? Colors.white
                                              : ColorSchemes.primary,
                                          icon: Icons.public,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Arrow icon
                              AnimatedRotation(
                                turns: isHovered ? 0.0 : 0.0,
                                duration: const Duration(milliseconds: 200),
                                child: Icon(
                                  Icons.arrow_outward_rounded,
                                  color: isHovered
                                      ? Colors.white
                                      : ColorSchemes.primary.withOpacity(0.7),
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Description
                          Text(
                            pkg.descriptionEn,
                            style:
                                Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: isHovered
                                          ? Colors.white.withOpacity(0.88)
                                          : subTextColor,
                                      fontSize: 14,
                                      height: 1.7,
                                    ),
                          ),
                          const SizedBox(height: 20),
                          // Divider
                          Divider(
                            color: isHovered
                                ? Colors.white.withOpacity(0.25)
                                : (widget.isDarkMode
                                    ? Colors.white.withOpacity(0.1)
                                    : Colors.grey.shade200),
                          ),
                          const SizedBox(height: 14),
                          // Features
                          Text(
                            S.of(context).features,
                            style:
                                Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: isHovered
                                          ? Colors.white.withOpacity(0.7)
                                          : subTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: pkg.features
                                .map(
                                  (f) => _buildFeatureChip(
                                    f,
                                    isHovered: isHovered,
                                    isDarkMode: widget.isDarkMode,
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 22),
                          // View on pub.dev button
                          SizedBox(
                            width: double.infinity,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: isHovered
                                    ? Colors.white
                                    : ColorSchemes.primary,
                              ),
                              child: TextButton(
                                onPressed: () => openLink(pkg.pubDevUrl),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  S.of(context).viewOnPubDev,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: isHovered
                                            ? ColorSchemes.primary
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }

  Widget _buildBadge({
    required String label,
    required Color bgColor,
    required Color textColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(
    String label, {
    required bool isHovered,
    required bool isDarkMode,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isHovered
            ? Colors.white.withOpacity(0.15)
            : (isDarkMode
                ? Colors.white.withOpacity(0.08)
                : Colors.grey.shade100),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isHovered
              ? Colors.white.withOpacity(0.3)
              : (isDarkMode
                  ? Colors.white.withOpacity(0.15)
                  : Colors.grey.shade300),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 13,
            color: isHovered
                ? Colors.white.withOpacity(0.85)
                : ColorSchemes.primary,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isHovered
                  ? Colors.white.withOpacity(0.9)
                  : (isDarkMode ? Colors.white70 : Colors.black87),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
