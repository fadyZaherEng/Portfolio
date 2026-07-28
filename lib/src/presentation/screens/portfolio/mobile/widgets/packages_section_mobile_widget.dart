import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';

class PackagesSectionMobileWidget extends StatelessWidget {
  final bool isDarkMode;

  const PackagesSectionMobileWidget({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final packages = Constants.packages;
    final Color subTextColor =
        isDarkMode ? Colors.white70 : Colors.black54;

    return Column(
      children: [
        const SizedBox(height: 36),
        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            S.of(context).myPackages,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: ColorSchemes.iconDarkWhite,
                ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            S.of(context).exploreMyPackages,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: subTextColor,
                  height: 1.7,
                ),
          ),
        ),
        const SizedBox(height: 24),
        // Package cards list
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: packages.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final pkg = packages[index];
            return _PackageMobileCard(
              pkg: pkg,
              isDarkMode: isDarkMode,
            );
          },
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}

class _PackageMobileCard extends StatefulWidget {
  final PackageModel pkg;
  final bool isDarkMode;

  const _PackageMobileCard({
    required this.pkg,
    required this.isDarkMode,
  });

  @override
  State<_PackageMobileCard> createState() => _PackageMobileCardState();
}

class _PackageMobileCardState extends State<_PackageMobileCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    if (_expanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pkg = widget.pkg;
    final isDark = widget.isDarkMode;
    final Color textColor = isDark ? ColorSchemes.white : ColorSchemes.iconBackGround;
    final Color subTextColor = isDark ? Colors.white70 : Colors.black54;

    return GestureDetector(
      onTap: () => openLink(pkg.pubDevUrl),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              isDark
                  ? Colors.white.withOpacity(0.07)
                  : Colors.grey.shade50,
              isDark ? Colors.white.withOpacity(0.03) : Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.12)
                : Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: ColorSchemes.primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        ImagePaths.flutter,
                        colorFilter: ColorFilter.mode(
                          ColorSchemes.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pkg.name,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: textColor,
                                  ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            _buildBadge(
                              label: pkg.license,
                              color: Colors.green,
                              icon: Icons.verified_outlined,
                            ),
                            const SizedBox(width: 6),
                            _buildBadge(
                              label: 'pub.dev',
                              color: ColorSchemes.primary,
                              icon: Icons.public,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Expand toggle
                  GestureDetector(
                    onTap: () {
                      _toggle();
                    },
                    child: AnimatedRotation(
                      turns: _expanded ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: ColorSchemes.primary,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Description (always visible)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                pkg.descriptionEn,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: subTextColor,
                      fontSize: 13,
                      height: 1.7,
                    ),
                maxLines: _expanded ? null : 3,
                overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
            ),
            // Expandable section
            SizeTransition(
              sizeFactor: _expandAnimation,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.grey.shade200,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      S.of(context).features,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: subTextColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                          ),
                    ),
                    const SizedBox(height: 10),
                    ...pkg.features.map(
                      (f) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 15,
                              color: ColorSchemes.primary,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                f,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: isDark
                                          ? Colors.white70
                                          : Colors.black87,
                                      fontSize: 13,
                                      height: 1.5,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // View on pub.dev button
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => openLink(pkg.pubDevUrl),
                  icon: const Icon(Icons.open_in_new, size: 16),
                  label: Text(S.of(context).viewOnPubDev),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorSchemes.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge({
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
