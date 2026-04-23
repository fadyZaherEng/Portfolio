import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';

class FlutterPackagesWebWidget extends StatelessWidget {
  final bool isDarkMode;
  const FlutterPackagesWebWidget({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final Color cardColor = isDarkMode 
        ? ColorSchemes.primary.withOpacity(0.1)
        : ColorSchemes.primary.withOpacity(0.05);
    final Color borderColor = isDarkMode 
        ? ColorSchemes.primary.withOpacity(0.3) 
        : ColorSchemes.primary.withOpacity(0.1);
    final Color titleColor = isDarkMode 
        ? ColorSchemes.secondary 
        : ColorSchemes.primary;
    final Color subtitleColor = isDarkMode 
        ? Colors.white.withOpacity(0.7) 
        : ColorSchemes.primary.withOpacity(0.6);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Flutter Packages (on pub.dev)",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorSchemes.iconDarkWhite,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: 100,
              height: 4,
              decoration: BoxDecoration(
                color: ColorSchemes.primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPackageCard(
                title: "fzTrimmer",
                subtitle: "Video Trimming Utility",
                description: "Developed and published a highly flexible Flutter package for video trimming. Provides a sleek, customizable UI for users to select video segments with frame-accurate precision. Optimized for performance and easy integration.",
                icon: Icons.video_library_rounded,
                url: "https://pub.dev/packages/fz_trimmer",
                cardColor: cardColor,
                borderColor: borderColor,
                titleColor: titleColor,
                subtitleColor: subtitleColor,
              ),
              const SizedBox(width: 24),
              _buildPackageCard(
                title: "fzReactionsChat",
                subtitle: "Chat Reactions Interface",
                description: "Created a dynamic and visually appealing chat reaction system inspired by popular messaging apps. Offers customizable emoji-based reactions with smooth animations and intuitive UX, enhancing user engagement.",
                icon: Icons.add_reaction_rounded,
                url: "https://pub.dev/packages/fz_reactions_chat",
                cardColor: cardColor,
                borderColor: borderColor,
                titleColor: titleColor,
                subtitleColor: subtitleColor,
              ),
              const SizedBox(width: 24),
              _buildPackageCard(
                title: "fz_google_oauth2",
                subtitle: "Google OAuth2 Handler",
                description: "Full control over Google OAuth2 login – without relying on Web View. Handles token expiration gracefully, preventing the need for manual forced logouts and improving the overall user experience.",
                icon: FontAwesomeIcons.google,
                url: "https://pub.dev/packages/fz_google_oauth2",
                cardColor: cardColor,
                borderColor: borderColor,
                titleColor: titleColor,
                subtitleColor: subtitleColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPackageCard({
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required String url,
    required Color cardColor,
    required Color borderColor,
    required Color titleColor,
    required Color subtitleColor,
  }) {
    return Expanded(
      child: Container(
        height: 320,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: titleColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: titleColor, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: subtitleColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                  color: ColorSchemes.white.withOpacity(0.9),
                  height: 1.5,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => openLink(url),
              child: Row(
                children: [
                  Text(
                    "View on pub.dev",
                    style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward_rounded, 
                    color: titleColor, size: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
